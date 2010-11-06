From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 06 Nov 2010 15:05:42 +0100
Subject: [Buildroot] Results of random configuration builds
In-Reply-To: <20101106134454.7769d258@surf>
References: <20101106134454.7769d258@surf>
Message-ID: <1289052342.3280.19.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

It seems you've strange toolchains :)
It seems the glib breakage is due to a compiler not supporting builtin
atomic operations, which is strange for x86.
I'm not able to reproduce with internal or external glibc/sh4
toolchains.

Can test with the attached patch to apply on glib2 ?

Regards,

--
Lionel Landwerlin

Le samedi 06 novembre 2010 ? 13:44 +0100, Thomas Petazzoni a ?crit :
> Hello,
> 
> I've run a few random build tests yesterday, and analyzed the results a
> bit today. I've set up a small webpage that gathers the results,
> together with the logfile and the configuration for each test.
> 
> See http://free-electrons.com/~thomas/pub/buildroot-logs/
> 
> Most of the builds are failing. The worst problem is that libglib2 does
> not build in many situations (see
> http://free-electrons.com/~thomas/pub/buildroot-logs/test-195/logfile-end).
> There are also problems with logrotate, gvfs, libgcrypt, olsr, libmad,
> netperf, magiccube4d, libmpeg2, xfsprogs, imagemagick, squid, ltrace,
> tcpdump, bash, gmp, gdb.
> 
> It'd be great if some of the readers of this list could have a look at
> one or several of these build problems, so that we can collaboratively
> solve them.
> 
> Thanks!
> 
> Thomas

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-glib-fix-compilation-with-no-builtin-atomic-operatio.patch
Type: text/x-patch
Size: 797 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101106/dd5ae904/attachment.bin>
