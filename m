From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 Feb 2011 19:10:24 +0200
Subject: [Buildroot] Changing from NFS root filesystem to embedded
 within kernel
In-Reply-To: <201102231803.41162.dargaud@lpsc.in2p3.fr>
References: <201102231803.41162.dargaud@lpsc.in2p3.fr>
Message-ID: <20110223171024.GC339@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume,

On Wed, Feb 23, 2011 at 06:03:40PM +0100, Guillaume Dargaud wrote:
> It's probably a simple question, but I'm a bit confused by what I found 
> searching this question.
> I have a buildroot system which currently boots remotely via DHCP+NFS.
> The following is both in the dts file and as the kernel parameter line:
> console=ttyUL0,115200 rw root=/dev/nfs ip=bootp
> 
> Now I would like to package the kernel with the filesystem embedded in it. 
> That's what initramfs is for, right ?
> 
> In buildroot, I generated a CPIO filesystem, and in the kernel compile options 
> I told it to use that file as an initramfs.
> 
> Now all I need is to change the kernel parameter line, right ? What's the 
> syntax ?

No. If you include initramfs in your kernel, the /init script runs 
automatically, regardless of the kernel command line. In this script you can 
examine the kernel command line (available in /proc/cmdline), and mount the 
right filesystem. See the Documentation/filesystems/ramfs-rootfs-initramfs.txt 
file under "What is initramfs?".

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
