From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Mon, 28 Jun 2010 14:09:05 +0100
Subject: [Buildroot] Steps to add a new board
Message-ID: <AB12B32E73474741A2C5361C433A44DE01E38E6B@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I've been using Buildroot for a Renesas SH4 device (SH7724) on a MS7724
development board, so first of all many thanks for all your work!

In order to get the board going, I've had to make a number of changes and
want to feed these back... However, there are a few things I'd like to iron
out.

 

Right now I'm using an external toolchain (CodeSourcery) as I had some
problems building the kernel using the BR generated toolchain. Would you
accept patches based on using an external toolchain? I guess this causes
problems for the board's defconfig.

 

Regarding the directory structure, I assume that I should populate
target/device/Renesas/MS7724 with the kernel & busybox configs and
device_table.txt. For the kernel, I'm using 2.6.33 with a few patches, so
under this dir I should have a kernel-patches dir for patches required and
these patches should start with linux-2.6.33-  is this correct?

 

I also use a post build script to fix securetty (the device needs ttySC0)
and also add an mdev script to /etc/init.d along with mdef.conf.

Atmel provides its own target skeleton, but I only need to fix securetty. Is
there a better way to do this? Since the need for ttySC0 means
target/generic/Config.in has to be fixed, surely it makes sense to fix the
generic securetty?

 

I notice that other boards only setup mdev via a replacement target
skeleton. Should I be doing this instead of a post build script? Is there a
way to apply a patch to the generic skeleton?

 

Thanks for any help,

Phil

 

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100628/6f656e4a/attachment.html>
