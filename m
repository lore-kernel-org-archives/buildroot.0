From: Robert Nelson <robert.nelson.work@gmail.com>
Date: Thu, 23 Oct 2008 10:18:26 -0500
Subject: [Buildroot] New to embedded Linux... questions ref. buildroot
In-Reply-To: <6.2.5.6.2.20081023070550.02f4eb98@rkt-tech.com>
References: <6.2.5.6.2.20081023070550.02f4eb98@rkt-tech.com>
Message-ID: <490095C2.9000902@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric wrote:
> Good morning, all.
>
>
> Now, my questions are...
>
> 1.  Do I need to be concerned about the "no parent directory"
> complaints above, and if so, what can I do about it?
>    
It's fine, common error in buildroot, they'll be generated on first run 
with the kernel.

> 2.  Are the rootfs.avr32.jffs2-root and rootfs.avr32.jffs2-usr files
> the image files like the ngw_jffs2_root.img and ngw_jffs2_usr.img
> files I downloaded from Atmel, and are they installed in the same
> way?  I know... the obvious answer is "try it and see what
> happens".  I am fearful of blowing away my u-boot, because I am told
> I'd need a jtag pod to restore it, and I don't have a jtag pod and
> can't get one any time soon, so if I blow this one away I'm out of business.
>    
The ngw has two options.

*-root can be flashed into the 8Mb of NOR flash
*-usr can be flashed into 8Mb of serial DataFlash

or

rootfs.avr32.tar can be written to an sd card

You'll have to configure u-boot for what ever method you use.

> 3.  The file rootfs.avr32.tar.bz2, when uncompressed and untarred,
> looks like this:
>
> drwxrwxr-x 21 eric eric     4096 2008-10-23 03:42 .
> drwxrwxr-x  3 eric eric     4096 2008-10-23 07:22 ..
> drwxrwxr-x  2 eric eric     4096 2008-10-23 03:42 bin
> drwxr-xr-x  2 eric eric     4096 2008-10-23 03:39 boot
> drwxr-xr-x  2 eric eric     4096 2008-10-22 16:05 config
> drwxr-xr-x  2 eric eric     4096 2008-10-23 03:42 dev
> drwxr-xr-x  8 eric eric     4096 2008-10-23 03:42 etc
> drwxrwxr-x  4 eric eric     4096 2008-10-23 03:42 home
> drwxr-xr-x  3 eric eric     4096 2008-10-23 03:42 lib
> lrwxrwxrwx  1 eric eric       11 2008-10-23 07:22 linuxrc ->  bin/busybox
> drwx------  2 eric eric     4096 2008-10-23 03:42 lost+found
> drwxr-xr-x  2 eric eric     4096 2008-10-23 03:42 media
> drwxrwxr-x  2 eric eric     4096 2008-10-22 16:05 mnt
> drwxrwxr-x  2 eric eric     4096 2008-10-22 16:05 opt
> drwxr-xr-x  2 eric eric     4096 2008-10-23 03:42 proc
> drwxrwxr-x  2 eric eric     4096 2008-10-22 16:05 root
> drwxr-xr-x  2 eric eric     4096 2008-10-23 03:42 sbin
> drwxr-xr-x  2 eric eric     4096 2008-10-23 03:42 sys
> drwxrwxr-x  2 eric eric     4096 2008-09-25 09:21 tmp
> drwxrwxr-x  7 eric eric     4096 2008-10-23 03:22 usr
> drwxrwxr-x 10 eric eric     4096 2008-09-25 09:21 var
> drwxr-xr-x  7 eric eric     4096 2008-10-23 03:22 www
>
> ... which looks amazingly like the file structure that's on the
> NGW100 board.  Do I need to do anything with that tarball, or do I
> just load rootfs.avr32.jffs2-root and rootfs.avr32.jffs2-usr and I'll
> have all I need?
>
> 4.  Speaking of u-boot, I see the buildroot process also created the
> file u-boot.bin.  Is this the file I need if I blow away my u-boot on
> the board, and is it true that the only way to install it is via a jtag pod?
>
> Thanks to all for helping me get started on this...
Their are ways, but i've never done it without a jtagmk2

Take a look at these:

http://www.atmel.no/buildroot/ (ps v2.2.0 has been replaced by v.2.2.1, 
application notes, etc)
http://www.avrfreaks.net/wiki/index.php/Documentation:AVR32_General
http://www.avr32linux.org

PS. Since this is Atmel's fork, it would be best to ask your questions 
here: buildroot at avr32linux.org although Hans-Christian Egtvedt and 
Haavard Skinnemoen usually monitor this list. (even thou these stay in 
relative sync)

Regards,

Robert
