From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:02:00 +0100
Subject: [Buildroot] [PATCH 1/1] Main Makefile Have "make savedefconfig"
 show where the file is being written to.
In-Reply-To: <20180227112818.6766-1-chrismcc@gmail.com>
References: <20180227112818.6766-1-chrismcc@gmail.com>
Message-ID: <20180227220200.3340b30f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Feb 2018 03:28:18 -0800, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

The commit title should be shorter, perhaps:

	Makefile: show defconfig file being saved in 'savedefconfig'

and then the commit log should expand on that, to explain why this is
useful.

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index ec39bcdb9c..4ac2435a9c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -927,6 +927,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
>  		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>  		$(CONFIG_CONFIG_IN)
>  	@$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
> +	@echo "Saved to $(DEFCONFIG)"

I'm personally OK with this, and believe it makes sense. I've always
found it weird that we automatically save back to the defconfig we have
started from, but some people liked that. More than once I've been
puzzled after a "make savedefconfig" to not find a "defconfig" file in
the current folder, because the defconfig had been updated in
configs/<something>_defconfig. So to me, your change makes sense.

Could you respin after fixing the commit title, and expanding a bit the
commit log ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
