From: Julien Olivain <juju@cotds.org>
Date: Tue, 17 Dec 2019 21:26:15 +0100
Subject: [Buildroot] [PATCH 1/1] board/freescale/common/imx: use nodtb
 variant in uboot images for 8M
In-Reply-To: <20191216225703.7c5b06e2@windsurf.home>
References: <20191202200333.418111-1-juju@cotds.org>
 <20191216225703.7c5b06e2@windsurf.home>
Message-ID: <ecf09f2326ad59894f401505159e0c96@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I will send an updated version of the patch with more details in
the commit log.

On 2019-12-16 22:57, Thomas Petazzoni wrote:
> Hello Julien,
> 
> +Fabio in Cc.
> 
> On Mon,  2 Dec 2019 21:03:33 +0100
> Julien Olivain <juju@cotds.org> wrote:
> 
>> When using u-boot.bin, u-boot is using its builtin dtb which may not
>> be suitable for all cases. For TechNexion Pico Pi i.MX8M and
>> i.MX8MMini, this break the USB and UMS commands. Since those boards
>> does not have SD card slots, a recovery serial download is needed at
>> every update.
> 
> Could you give more details? If it doesn't use a built-in DTB, which
> DTB gets used?

Basically, without this patch, the U-Boot DTB is included twice (once in
builtin u-boot.bin image, and a second time in the boot FIT image).

> How does using the built-in DTB breaks USB and UMS ?

Since the second correct DTB is ignored, the default embedded one
is used, which is for another board (fsl-imx8mm-evk), which produce
some initialization errors on non-EVK boards.

> Thanks,
> 
> Thomas

Best regards,

Julien.
