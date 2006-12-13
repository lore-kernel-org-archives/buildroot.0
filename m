From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 13 Dec 2006 13:23:13 +0100
Subject: [Buildroot] Grub not working?
In-Reply-To: <200612131303.54803.alexander.rigbo@acgnystrom.se>
References: <200612131303.54803.alexander.rigbo@acgnystrom.se>
Message-ID: <20061213122313.GU8157@rotomalug.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander Rigbo (alexander.rigbo at acgnystrom.se) wrote:
> Hi,
> 
> I'm making a small system for a pc/104 computer, but i'm having some troubles 
> with grub.
> Grub is built and installed to my root, but i can't use it to install the 
> bootloader to MBR. See following output:
> 
> grub> root (hd0,1)
>  Filesystem type is ext2fs, partition type 0x83
> grub> setup (hd0)
>  Checking if "/boot/grub/stage1" exists... no
>  Checking if "/grub/stage1" exists... no
> 
> Error 15: File not found
> 
> But, on hda2 (my root partition) i have:
> 
> [root at uclibc grub]# ls -l /boot/grub/stage1
> -rwxr-xr-x     1 root      root             512 Dec 13 03:25 /boot/grub/stage1
> 
> What can this be?
> Grub bug? uClibc bug? buildroot? my fault (most likely though)?

Only one partition ? (hd0,1) is your rootfs or your /boot partition ?

I have had lot of problem with grub on wrap plateform. Now I use lilo
for x86 processor family.

	Christophe
