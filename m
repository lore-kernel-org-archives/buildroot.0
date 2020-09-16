From: Valabdas, Miken <mvalabdas@distech-controls.com>
Date: Wed, 16 Sep 2020 16:14:07 +0000
Subject: [Buildroot] [PATCH] package/18xx-ti-utils: update makefile in
 order to compile wlconf
In-Reply-To: <20200916165703.266d2cb8@windsurf.hq.k.grp>
References: <20200916135834.400-1-mvalabdas@distech-controls.com>
 <20200916165703.266d2cb8@windsurf.hq.k.grp>
Message-ID: <BN6PR0101MB30731CA7C4042E36578139788B210@BN6PR0101MB3073.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for your message.
The reason why I haven't changed the 18XX_TI_UTILS_INSTALL_TARGET_CMDS is because this tool will be used in a host computer (not on the target board) in conjunction with BR2_ROOTFS_POST_IMAGE_SCRIPT.
In resume, this tool will be used by a script through BR2_ROOTFS_POST_IMAGE_SCRIPT. The script itself will install the appropriate output (after doing some stuffs).

Thanks!
Miken 




-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: 16 septembre 2020 10:57
To: Valabdas, Miken <mvalabdas@distech-controls.com>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH] package/18xx-ti-utils: update makefile in order to compile wlconf

Hello Miken,

Thanks for your contribution!

On Wed, 16 Sep 2020 09:58:34 -0400
Miken Valabdas via buildroot <buildroot@busybox.net> wrote:

> Signed-off-by: Miken Valabdas <mvalabdas@distech-controls.com>
> ---
>  package/18xx-ti-utils/18xx-ti-utils.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk 
> b/package/18xx-ti-utils/18xx-ti-utils.mk
> index d1f0388c3a..41ce8ab973 100644
> --- a/package/18xx-ti-utils/18xx-ti-utils.mk
> +++ b/package/18xx-ti-utils/18xx-ti-utils.mk
> @@ -21,6 +21,11 @@ define 18XX_TI_UTILS_BUILD_CMDS
>  		NFSROOT="$(STAGING_DIR)" NLVER=3 $(MAKE) -C $(@D) \
>  		CFLAGS="$(TARGET_CFLAGS) $(18XX_TI_UTILS_CFLAGS)" \
>  		$(18XX_TI_UTILS_BUILD_TARGET)
> +
> +	$(TARGET_MAKE_ENV) CROSS_COMPILE=$(TARGET_CROSS) \
> +		NFSROOT="$(STAGING_DIR)" NLVER=3 $(MAKE) -C $(@D)/wlconf \
> +		CFLAGS="$(TARGET_CFLAGS) $(18XX_TI_UTILS_CFLAGS)" \
> +		$(18XX_TI_UTILS_BUILD_TARGET)

So this is going to build another tool, but you haven't changed the 18XX_TI_UTILS_INSTALL_TARGET_CMDS to also install it. So how is this tool going to be practically useful ?

Thanks!

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://urldefense.com/v3/__https://bootlin.com__;!!Po4YltK3bPMkYw!nIVmpi0i8yXDE-CppSCDd56kOjhCnuUXrq0QLj-UBQgyigt5BaYRYF8QHgYt3qmOJ1jr2Fkv$ 
