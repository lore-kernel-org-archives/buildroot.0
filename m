From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jan 2015 16:50:54 +0100
Subject: [Buildroot] Grub2 and Memtest86+
In-Reply-To: <54CA4C59.3010107@ou.edu>
References: <54CA4C59.3010107@ou.edu>
Message-ID: <20150129165054.5b72b7fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Thu, 29 Jan 2015 09:06:01 -0600, Steve Kenton wrote:
> I've been tinkering with adding memtest86+ V4.20 to the
> grub2 menu for my x86 target. It's straight forward.
> 
> The questions, is there interest in this and how to
> do this only for x86 targets. I've not dug into how
> the boot loaders are handled, yet, but it's apparently
> different from regular packages. Is there anyone
> who keeps track on the grub2 boot loader in buildroot?

I'm not sure I can say I "keep track of grub2", but I did add the
package last year.

> Modify ~boot/grub2/grub.cfg to add the memtest entry
> and download the memtest86+ source tarball and then
> copy/rename the shipped precomp.bin file file to
> /boot/memtest86+.bin (It's a bootable 486 binary)
> 
> set default="0"
> set timeout="5"
> 
> menuentry "Buildroot" {
> 	linux /boot/bzImage root=/dev/sda1 console=tty1 quiet splash=silent
> }
> 
> menuentry "Memtest86+" {
> 	linux16 /boot/memtest86+.bin
> }

What I would suggest is to add a package for memtest86 in Buildroot,
have it install the appropriate binary in /boot, and in its Config.in
help text, indicate how to add it to the Grub menu.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
