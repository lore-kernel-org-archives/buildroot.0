From: Stephen Thomas <scjthm@live.com>
Date: Sun, 18 May 2014 00:04:26 +0100
Subject: [Buildroot] How to disable patches for libtool
Message-ID: <SNT146-W8595A45AC23B3F05582F95A8300@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
I have been playing around with buildroot and have managed to hack something that uses graphite in GCC as this speeds up compilation and can produce slightly smaller code.
I have hacked a couple of things, which I am a bit ashamed to admit. First I hardcoded the config for binutils to only build the gold tools, and in gcc and binutils I disabled the search for the isl and cloog libraries. However, one problem that I cannot hack around is the need to add an isl package. The changes were as follows in the gcc.mk file: HOST_GCC_COMMON_DEPENDENCIES = \-       host-binutils \        host-gmp \+       host-isl \        host-mpfr \+       host-mpc \+       host-cloog \+       host-binutils \
But the problem that I cannot get around is how to patch the file ltmain.sh in isl version 0.13. I have a patch that patches this file and this causes the one from the buildroot to fail. So all I do is just touch the build/isl-0.13/.stamp_patched file or whatever and I can continue the build. But is there a way to not have this file patched from the buildroot? I have looked into the packages and I didn't see this done anywhere. If it has been would someone please be kind enough to point me in the right direction?
Cheers
Thomo 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140518/9dc979e5/attachment.html>
