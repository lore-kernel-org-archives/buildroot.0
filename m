From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Jun 2019 15:00:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/dialog: fix build with NLS
In-Reply-To: <20190628203209.1563-1-fontaine.fabrice@gmail.com>
References: <20190628203209.1563-1-fontaine.fabrice@gmail.com>
Message-ID: <be88202a-8523-7860-5f8d-a30970a44d2d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/06/2019 22:32, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/9287ffbb86a7dc09cda5f99f87445fa884e77625
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/dialog/dialog.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
> index 73fabe07cf..b1933b8836 100644
> --- a/package/dialog/dialog.mk
> +++ b/package/dialog/dialog.mk
> @@ -9,7 +9,7 @@ DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
>  DIALOG_SITE = ftp://ftp.invisible-island.net/dialog
>  DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
>  	--disable-rpath-hack
> -DIALOG_DEPENDENCIES = host-pkgconf ncurses
> +DIALOG_DEPENDENCIES = host-pkgconf ncurses $(TARGET_NLS_DEPENDENCIES)
>  DIALOG_LICENSE = LGPL-2.1
>  DIALOG_LICENSE_FILES = COPYING
>  
> 
