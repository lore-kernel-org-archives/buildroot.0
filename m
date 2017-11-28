From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Nov 2017 10:42:22 +0100
Subject: [Buildroot] [PATCH 1/1] qt5: remove unused QT5_SNAPSHOTS_SITE
In-Reply-To: <20171128010517.26420-1-gael.portay@savoirfairelinux.com>
References: <20171128010517.26420-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171128094222.GB2889@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

On 2017-11-27 20:05 -0500, Ga?l PORTAY spake thusly:
> The variable QT5_SNAPSHOTS_SITE was introduced in commit 9d5ac9698 to
> fetch sources of obsolete modules. It was used to download qt5webkit
> tarballs.
> 
> The variable is not referenced anymore since the qt5webkit tarballs are
> downloaded from the Qt community release site.

This commit not only gets rid of the variable, but also de-duplicates
the _SITE variable. This should have been mentioned as well.

    package/qt5: simplify and cleanup _SITE variables

    [your commit log]

    Since the introduction of qt-5.9 in aa1c40ba3, the QT5_SITE variable
    was duplicates for no good reason.

    Signed-off-by: You

With the above fixed:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index 0e49c6b58b..5d63433666 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -7,13 +7,11 @@
>  ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>  QT5_VERSION_MAJOR = 5.9
>  QT5_VERSION = $(QT5_VERSION_MAJOR).2
> -QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
>  else
>  QT5_VERSION_MAJOR = 5.6
>  QT5_VERSION = $(QT5_VERSION_MAJOR).3
> -QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
> -QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
>  endif
> +QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
>  
>  include $(sort $(wildcard package/qt5/*/*.mk))
>  
> -- 
> 2.15.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
