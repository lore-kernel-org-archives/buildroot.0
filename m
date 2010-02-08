From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 08 Feb 2010 15:42:08 +0200
Subject: [Buildroot] [PATCH 07/10] package: fix install without strip
In-Reply-To: <1265561742-5924-8-git-send-email-llandwerlin@gmail.com>
References: <1265561742-5924-1-git-send-email-llandwerlin@gmail.com>
	<1265561742-5924-8-git-send-email-llandwerlin@gmail.com>
Message-ID: <4B7014B0.3070603@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/07/2010 06:55 PM, 
llandwerlin at gmail.com wrote:
> From: Lionel Landwerlin<llandwerlin@gmail.com>
>
> Signed-off-by: Lionel Landwerlin<llandwerlin@gmail.com>
> ---
>   package/Makefile.autotools.in |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
> index 7114bba..96ea453 100644
> --- a/package/Makefile.autotools.in
> +++ b/package/Makefile.autotools.in
> @@ -60,7 +60,7 @@ $(2)_LIBTOOL_PATCH		?= YES
>   $(2)_USE_CONFIG_CACHE           ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
>   $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
>   ifeq ($(BR2_ENABLE_DEBUG),y)
> -$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-exec
> +$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-strip

I think you want just simple install instead of install-strip here.
And if you insist on keeping install-strip then you should remove
ifeq-else-endif since it is not needed anymore.

>   else
>   $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-strip
>   endif
