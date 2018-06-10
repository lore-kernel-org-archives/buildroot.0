From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Jun 2018 10:15:52 +0300
Subject: [Buildroot] Initramfs
In-Reply-To: <2C6957468785C14D8F47AB016E1D8F4B158FA7C2@hasmsx107.ger.corp.intel.com>
References: <2C6957468785C14D8F47AB016E1D8F4B158FA7C2@hasmsx107.ger.corp.intel.com>
Message-ID: <20180610071552.ym7c6xb4j3aa6vlh@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gil,

On Sun, Jun 10, 2018 at 07:00:06AM +0000, Montag, Gil wrote:
> I have few questions regarding the use of initramfs in my system:
> 
> 1.       Please correct me if I'm wrong:
> 
> -          When I enable the initramfs option, buildroot creates for me the 
> same rootfs that was created before (e.g. ext2),  just instead of making it 
> a file to be later unpacked into a storage device (e.g. rootfs.ext2) it will 
> pack it  in a cpio archieve, and have the kernel build use it to build a 
> kernel image that already contains it inside.
> 
> -          I don't need to enable ext2 file system anymore

Correct. Though usually initramfs is only used as a first stage filesystem. 
Scripts running from initramfs locate the persistent storage and mount it. But 
there are plenty of use cases of initramfs only setup.

> 2.       If I want to add anything to the rootfs created this way, should I 
> do it in the same way as I did before - e.g. with rootfs overlay?

Correct.

> 3.       Kernel image (bzImage in my case) is expected to grow bigger than 
> it was before by the amount of the size of the rootfs.cpio.gz  file created 
> in output/images

That depends on how you configured initramfs compression in your kernel. 
Different compression algorithms give different compressed image sizes.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
