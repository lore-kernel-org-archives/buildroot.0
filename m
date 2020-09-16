From: Valabdas, Miken <mvalabdas@distech-controls.com>
Date: Wed, 16 Sep 2020 18:52:42 +0000
Subject: [Buildroot] [PATCH] package/18xx-ti-utils: update makefile in
 order to compile wlconf
In-Reply-To: <20200916182832.3ab15d33@windsurf.hq.k.grp>
References: <20200916135834.400-1-mvalabdas@distech-controls.com>
 <20200916165703.266d2cb8@windsurf.hq.k.grp>
 <BN6PR0101MB30731CA7C4042E36578139788B210@BN6PR0101MB3073.prod.exchangelabs.com>
 <20200916182832.3ab15d33@windsurf.hq.k.grp>
Message-ID: <BN6PR0101MB307370E9EE79C87427032CA08B210@BN6PR0101MB3073.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I see, I will change accordingly. Thanks for your input.

Regards,
Miken.
mvalabdas at distech-controls.com






-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: 16 septembre 2020 12:29
To: Valabdas, Miken <mvalabdas@distech-controls.com>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH] package/18xx-ti-utils: update makefile in order to compile wlconf

Hello,

On Wed, 16 Sep 2020 16:14:07 +0000
"Valabdas, Miken" <mvalabdas@distech-controls.com> wrote:

> Thanks for your message.
>
> The reason why I haven't changed the
> 18XX_TI_UTILS_INSTALL_TARGET_CMDS is because this tool will be used in 
> a host computer (not on the target board) in conjunction with 
> BR2_ROOTFS_POST_IMAGE_SCRIPT.
>
> In resume, this tool will be used by a script through 
> BR2_ROOTFS_POST_IMAGE_SCRIPT. The script itself will install the 
> appropriate output (after doing some stuffs).

OK, so this tool is built with the host compiler, and runs on the host machine. It seems weird as you're passing CFLAGS="$(TARGET_CFLAGS) ..."
for example.

Also, a host tool should be installed in $(HOST_DIR)/bin or $(HOST_DIR)/sbin.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://urldefense.com/v3/__https://bootlin.com__;!!Po4YltK3bPMkYw!jjfxu5py5t8nd8ucVhSs2-N5n3EdfjudvNwyVbcc5lGNbET1KSf4rOMlgzqqIxvs7YGLi0TO$ 
