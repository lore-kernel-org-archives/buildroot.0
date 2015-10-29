From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 29 Oct 2015 19:28:09 +0100
Subject: [Buildroot] [PATCH 1/2] libv4l: fix a typo to not override the
 LIBV4L_DEPENDENCIES variable
In-Reply-To: <1446125625-7009-1-git-send-email-Vincent.Riera@imgtec.com>
References: <y>
	<1446125625-7009-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151029192809.225b955b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vicente,

On Thu, 29 Oct 2015 13:33:44 +0000, Vicente Olivert Riera <Vincent.Riera@imgtec.com> wrote:

> Otherwise host-pkgconf will not be installed and the configure script
> will fail with an error like this one:
> 
> ./configure: line 16346: PKG_PROG_PKG_CONFIG: command not found
> [snip]
> ./configure: line 20511: syntax error near unexpected token `X11,'
> ./configure: line 20511: `PKG_CHECK_MODULES(X11, x11, x11_pkgconfig=yes,
> x11_pkgconfig=no)'
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libv4l/libv4l.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index 9442467..89d1d00 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -13,7 +13,7 @@ LIBV4L_CONF_OPTS = --disable-doxygen-doc
>  
>  # patch touches Makefile.am (and needs host-gettext for autoreconf)
>  LIBV4L_AUTORECONF= YES
> -LIBV4L_DEPENDENCIES = host-gettext
> +LIBV4L_DEPENDENCIES += host-gettext
>  
>  # fix uclibc-ng configure/compile
>  LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'


Thanks for spotting my mistake....

Tested-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
