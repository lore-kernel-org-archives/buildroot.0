From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Mon, 28 Nov 2011 16:15:02 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
 <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
Message-ID: <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> cp etherlabmaster-1.0.tar.bz2 /home/user1/buildroot-2011.05/dl/
>
> to get it in the dl/ directory.

In addition to anyone seeing a problem with this, now when I run the
program:

/etc/init.d/ethercat start

I get a message like this:

Starting EtherCAT master devel modprobe: module ec_master not found in
modules.d
ep
 failed



This error message is what got me started down the path of adding the
package in Buildroot.  I used to build EtherCAT outside of Buildroot and
then that build process would put EtherCAT in the linux image.  But I'd get
this error, so the suggestion was made to make the EtherCAT build part of
Buildroot.  Somehow the kernel needs to be told of this module.  The
Buildroot process must not be doing a 'make install'?  Or is there a command
I should run on the board itself once Linux is running?
