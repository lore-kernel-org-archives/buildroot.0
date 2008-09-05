From: Steven Woody <narkewoody@gmail.com>
Date: Fri, 5 Sep 2008 15:38:31 +0800
Subject: [Buildroot] Login exited
In-Reply-To: <20080905010758.GA22747@cloud.net.au>
References: <ed4892840809010102n6293e75ejc6caf1dd57a954db@mail.gmail.com>
	<ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<200809031950.49148.vda.linux@googlemail.com>
	<ed4892840809031850y32161b46qc99547711ab535a7@mail.gmail.com>
	<20080904020018.GC16933@cloud.net.au>
	<ed4892840809032234h62607fb2oac8847e3da884e44@mail.gmail.com>
	<20080904142912.GB28250@cloud.net.au>
	<ed4892840809040849x7505c56ft98135e1535dc0fcc@mail.gmail.com>
	<20080905010758.GA22747@cloud.net.au>
Message-ID: <ed4892840809050038j3d0be1edjca3226465afedfdb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, All

I am now pretty sure that is the ash (as busybox applet) exited
somewhere in the function ash_main(...).  I got know this by inserted
many debug messages in the source of getty.c run_shell.c and ash.c.

And, I  attached my boot messages you for analysis, please check it
out. One file is for normal boot, another is for boot with
"init=/bin/sh". I will provide some other related information about my
build process, but because the message size limits for the list. I
have to post them in many other successive messages. Please check them
out too.

PS.  I just noticed, there is an error line when I run 'make' to get
my rootfs image, it is:
 ...
 rootdir=/root/buildroot/project_build_arm/uclibc/root
 table='target/generic/mini_device_table.txt'
 /root/buildroot/build_arm/cramfs-1.1/mkcramfs: invalid option -- l
 rm -f /root/buildroot/project_build_arm/uclibc/.fakeroot*

I checked, there is no a -l option for mkcramfs, but the buildroot
does try to use it.  Anyway, the cramfs is created successfully, but I
am not sure it is not a problem.



Regards,
narke
-------------- next part --------------
A non-text attachment was scrubbed...
Name: boot-msg.log
Type: application/octet-stream
Size: 4847 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080905/f48ba68a/attachment.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: boot-msg-with-init=bin-sh.log
Type: application/octet-stream
Size: 4588 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080905/f48ba68a/attachment-0001.obj 
