From: Woody Wu <narkewoody@gmail.com>
Date: Mon, 10 Dec 2012 09:14:12 +0000 (UTC)
Subject: [Buildroot] Linux build error: mixed implicit and normal rules
Message-ID: <slrnkcb9t5.17l.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, list

I am trying to build an old Linux kernel 2.6.16. But got the error:

Makefile:441: mixed implicit and normal rules. stop.

The line 441 of Linux makefile is:

config %config: scripts_basic outputmakefile FORCE
	$(Q)mkdir -p include/linux
	$(Q)$(MAKE) $(build)=scripts/kconfig $@
	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= .kernelrelease

How should I fix this?  My buildroot version is 2012.08.

Thanks in advance!

-- 
woody
I can't go back to yesterday - because I was a different person then.
