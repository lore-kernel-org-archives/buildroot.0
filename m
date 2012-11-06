From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 6 Nov 2012 15:06:35 +0000
Subject: [Buildroot] [PATCH] BR2_PREFER_STATIC_LIB and LDFLAGS+= -static
In-Reply-To: <50984D57.3080402@mind.be>
References: <F9C551623D2CBB4C9488801D14F864C628A986@ex-mb1.corp.adtran.com>
 <50984D57.3080402@mind.be>
Message-ID: <F9C551623D2CBB4C9488801D14F864C628B69F@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
>   Although I'm OK with this patch, I have been unable to reproduce the problem
> and I'd like to know why it is going wrong with -static.  Can you post a
> defconfig that I can rebuild and that exposes the problem?
> 
>   Note: a few autobuilders with BR2_PREFER_STATIC_LIB enabled could be nice -
> or maybe not, because many packages _will_break.
> 
>   Regards,
>   Arnout

First off, I built again with a clean copy of BuildRoot (2012.08) and
produced this output this time:

root at akennedy_lin:~/deleteme/buildroot-2012.08# find output/target/ \
-exec file {} \; 2>&1 | grep dynamic | awk -F: '{print $1}'
output/target/usr/bin/ldd
output/target/usr/bin/htop
output/target/usr/bin/getconf
output/target/usr/sbin/kdump
output/target/usr/sbin/proftpd
output/target/sbin/ldconfig

Note that htop and proftpd got linked dynamically.  The odd part is
that kexec built static this time.  What's up with that?  I repeated
this twice and kexec builds static every time. . . though I really
thought I did this last week and it was dynamically linked.  Perhaps
I'm smokin' something. . .  BTW, I have _NEVER_ been able to build
kdump static through their build.  I can reproduce it manually, but
there seems to be no way to do it with their current Makefile.

Attached is the config file.  You may want to change the primary
download site as I have it set to ftp://localhost/pub/dl.

Andy
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2012_08.config
Type: application/octet-stream
Size: 25887 bytes
Desc: buildroot-2012_08.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121106/a48d4e15/attachment-0001.obj>
