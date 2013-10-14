From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Mon, 14 Oct 2013 11:11:14 -0300
Subject: [Buildroot] [PATCH 2/2] qt5base: add an option to build and
 install examples
In-Reply-To: <1381007796-20031-2-git-send-email-fatih.asici@gmail.com>
References: <1381007796-20031-1-git-send-email-fatih.asici@gmail.com>
 <1381007796-20031-2-git-send-email-fatih.asici@gmail.com>
Message-ID: <CAAEAJfDKwZ-EtAO61h=ZOE4QoAr75fZsw7s8aXhQjJm9VVBQwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 October 2013 18:16, Fatih A??c? <fatih.asici@gmail.com> wrote:
> Adds two patches to fix building of examples when configured with one of
> these options:
>
>   * -no-opengl (patch fetched from upstream)
>   * -no-gui    (patch sent to upstream)
>
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  package/qt5/qt5base/Config.in                      |  7 +++
>  ...e-build-failure-in-windowcontainer-exampl.patch | 28 ++++++++++
>  ...les-Fix-build-when-configured-with-no-gui.patch | 62 ++++++++++++++++++++++
>  package/qt5/qt5base/qt5base.mk                     | 18 ++++++-
>  4 files changed, 114 insertions(+), 1 deletion(-)
>  create mode 100644 package/qt5/qt5base/qt5base-0006-Fix-possible-build-failure-in-windowcontainer-exampl.patch
>  create mode 100644 package/qt5/qt5base/qt5base-0007-examples-Fix-build-when-configured-with-no-gui.patch
>
[...]

> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 0106c2c..ebf51c4 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -60,6 +60,12 @@ QT5BASE_LICENSE = Commercial license
>  QT5BASE_REDISTRIBUTE = NO
>  endif
>
> +ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
> +QT5BASE_CONFIGURE_OPTS += -make examples -compile-examples
> +else
> +QT5BASE_CONFIGURE_OPTS += -nomake examples
> +endif
> +

Any reason why this is not with the rest of the options
and using the simpler:

QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES), \
        -make examples -compile-examples, \
        -nomake examples)

?

Regards,
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
