From: Saxena, Nitin <Nitin.Saxena@cavium.com>
Date: Wed, 24 Jan 2018 15:05:04 +0000
Subject: [Buildroot] grub/grub2 support on AARCH64 native compilation
In-Reply-To: <20180124121749.e55in64g5lwdn3ex@sapphire.tkos.co.il>
References: <DM2PR07MB703B7C9C8A5B9DF875B9E73EAE20@DM2PR07MB703.namprd07.prod.outlook.com>
 <BY2PR07MB69360D7DF88E734B64BD581EAE20@BY2PR07MB693.namprd07.prod.outlook.com>
 <BY2PR07MB693C88FA469BDE50F523ABBEAE20@BY2PR07MB693.namprd07.prod.outlook.com>,
 <20180124121749.e55in64g5lwdn3ex@sapphire.tkos.co.il>
Message-ID: <BY2PR07MB6936300DAD1B7A851A9024DEAE20@BY2PR07MB693.namprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks baruch.

I need a way to get VM image for aarch64 via buildroot (native compilation) so that I can launch it via qemu-system-aarch64.
I tried compiling buildroot-2017.05.2 and got rootfs.tar and kernel "Image". I created ext4 file system from rootfs.tar and tried to launch QEMU using following command

=============
T=/home/dut/launch/br
qemu-system-aarch64 -enable-kvm -m 2048 -smp 4 -cpu host \
    -M virt,gic_version=3 -nographic \
    -kernel $T/Image --append "console=ttyAMA0 root=/dev/vda rw"  \
    -drive file=$T/rootfs.img,if=virtio,aio=threads \
    -netdev user,id=user0 -device virtio-net,netdev=user0
=============

Is this possible with buildroot package? I can try latest buildroot package.

Thanks,
Nitin
________________________________________
From: Baruch Siach <baruch@tkos.co.il>
Sent: Wednesday, January 24, 2018 5:47 PM
To: Saxena, Nitin
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] grub/grub2 support on AARCH64 native compilation

Hi Nitin,

On Wed, Jan 24, 2018 at 11:40:36AM +0000, Saxena, Nitin wrote:
> I want to create VM image for aarch64 using rootfs and grub created by
> buildroot-2017.11.2 tag. I am doing native compilation on AARCH64.
>
> So during compilation I am not able to find grub or grub2 option in make
> menuconfig. Can somebody help me in creating grub for AARCH64

The grub/grub2 packages in Buildroot only support x86 targets at the moment.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
