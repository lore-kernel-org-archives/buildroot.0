From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 30 Jan 2017 20:33:16 +0100
Subject: [Buildroot] [PATCH v5 04/10] Conditional revert "qt5base:
 install bundled fonts to target"
In-Reply-To: <1485439461-4797-5-git-send-email-anaumann@ultratronik.de>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
 <1485439461-4797-5-git-send-email-anaumann@ultratronik.de>
Message-ID: <20170130203316.06e17698@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jan 2017 15:04:15 +0100, Andreas Naumann <anaumann@ultratronik.de> wrote:

> From: Julien Corjon <corjon.j@ecagroup.com>
> 
> qtbase carries nor more fonts since c5ceabb9a1caf6b9b7615a28c3097f221772f645
> 
> So for Qt Version 5.8.0 this reverts commit cdfa21b06041eb601e0bea79f2c8f50e9d637384
> and part of 186ef9f6f4647ed34b67a3427a5e0e249f0794e7

Time for a new subject, eg. 'qt5base: conditional install bundled fonts'?

And a new patch description (the resulting patch hase nothing more to do with
reverting a particular patch)?

Regards,
Peter


> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 1b3e2d3..78c7a81 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -256,12 +256,14 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
>  	fi
>  endef
>  
> +ifeq ($(BR2_QT5_VERSION_5_6),y)
>  define QT5BASE_INSTALL_TARGET_FONTS
>  	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
>  		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
>  		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
>  	fi
>  endef
> +endif
>  
>  define QT5BASE_INSTALL_TARGET_EXAMPLES
>  	if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
