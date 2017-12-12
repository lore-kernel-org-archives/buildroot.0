From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 12 Dec 2017 09:24:01 +0100
Subject: [Buildroot] [PATCH 9/9] boards/zynq: use genimage to generate a
 bootable SD card image
In-Reply-To: <87fu8huend.fsf@dell.be.48ers.dk>
References: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
 <1512855007-1834-10-git-send-email-luca@lucaceresoli.net>
 <87fu8huend.fsf@dell.be.48ers.dk>
Message-ID: <70e3ef4e-2fed-8e38-a542-c3d6ba57e371@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 11/12/2017 22:40, Peter Korsgaard wrote:
>>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
[...]
>  > diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
>  > index c6685a4bc189..98879cada04d 100644
>  > --- a/configs/zynq_microzed_defconfig
>  > +++ b/configs/zynq_microzed_defconfig
>  > @@ -28,3 +28,4 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  >  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  >  BR2_TARGET_UBOOT_SPL=y
>  >  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>  > +BR2_PACKAGE_HOST_GENIMAGE=y
> 
> We also need
> 
> BR2_PACKAGE_HOST_DOSFSTOOLS=y
> BR2_PACKAGE_HOST_MTOOLS=y
> 
> For creating / populating the vfat image. Committed with that fixed,
> thanks.

You're obviously right, sorry.

BTW, genimage is becoming quite an official tool in Buildroot. Shouldn't
it be mentioned in the manual, along with the dosfstools and mtools
dependencies?

Thanks,
-- 
Luca
