From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 4 Apr 2012 13:42:03 +0300
Subject: [Buildroot] [PATCH] New Package: latencytop
In-Reply-To: <1333535085-10290-1-git-send-email-qais.yousef@imgtec.com>
References: <1333535085-10290-1-git-send-email-qais.yousef@imgtec.com>
Message-ID: <20120404104203.GB3282@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Qais,

On Wed, Apr 04, 2012 at 11:24:45AM +0100, Qais Yousef wrote:
> 
> Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
> ---

[snip]

> diff --git a/package/latencytop/latencytop.mk 
> b/package/latencytop/latencytop.mk
> new file mode 100644
> index 0000000..c33eee9
> --- /dev/null
> +++ b/package/latencytop/latencytop.mk
> @@ -0,0 +1,22 @@
> +#############################################################
> +#
> +# latencytop
> +#
> +#############################################################
> +
> +LATENCYTOP_VERSION = 0.5
> +LATENCYTOP_SITE = http://www.latencytop.org/download/
> +LATENCYTOP_DEPENDENCIES = libglib2 ncurses
> +
> +# NOTE: GTK is heavy weight, we intentionally build the text (ncurses)
> +# version only
> +define LATENCYTOP_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
> +		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" HAS_GTK_GUI=0 -C $(@D)

You can use $(TARGET_CONFIGURE_OPTS), which includes CC, LD, and PKG_CONFIG.

baruch

> +endef
> +
> +define LATENCYTOP_INSTALL_TARGET_CMDS
> +	$(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR)
> +endef
> +
> +$(eval $(call GENTARGETS))
> -- 
> 1.7.1

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
