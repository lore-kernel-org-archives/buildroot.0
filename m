From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 4 Nov 2019 18:00:37 +0100
Subject: [Buildroot] [PATCH 1/2] configs/stm32mp157c_dk2: disable mkfs
 metadata_csum and dir_index options
In-Reply-To: <87sgn4g5cw.fsf@dell.be.48ers.dk>
References: <20191103115017.788940-1-b.bilas@grinn-global.com>
 <87sgn4g5cw.fsf@dell.be.48ers.dk>
Message-ID: <14f84e0e-87c2-f5ec-5e41-3fca63485436@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On 03.11.2019 19:52, Peter Korsgaard wrote:
>>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:
>   > To solve issue with non-possibilities to mount rootfs partition we
>   > should disable a new mkfs features such as metadata_csum and
>   > dir_index because there is incompatibility with these options.
>
>   > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>   > ---
>   >  configs/stm32mp157c_dk2_defconfig | 1 +
>   >  1 file changed, 1 insertion(+)
>
>   > diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
>   > index a1e61d752d..ba044e5e55 100644
>   > --- a/configs/stm32mp157c_dk2_defconfig
>   > +++ b/configs/stm32mp157c_dk2_defconfig
>   > @@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   >  BR2_TARGET_ROOTFS_EXT2=y
>   >  BR2_TARGET_ROOTFS_EXT2_4=y
>   >  BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   > +BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^64bit,^metadata_csum,^dir_index"
>
> Is this a general issue with the ext4 support in u-boot? Should we do
> this generally by default, similar to how we do it for 64bit?
>
probably in case when device saves env in file on ext4 it is, but it 
should be checked on the other boards in order to inquiry if I'm right. 
As I know the requests done by U-Boot are acceptable if the ext4 file 
system is generated with only the features supported by U-Boot. 
Unfortunately I don't have any board except that which allows me to do so.


Best
Bartek
