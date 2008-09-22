From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Sep 2008 14:03:09 +0200
Subject: [Buildroot] Date in kernel file name
In-Reply-To: <48D7742E.9030209@eubus.net> (Lars Lockenvitz's message of "Mon\,
	22 Sep 2008 12\:32\:14 +0200")
References: <48D7742E.9030209@eubus.net>
Message-ID: <87fxnsv14y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lars" == Lars Lockenvitz <l.lockenvitz@eubus.net> writes:

 Lars> Hello,
 Lars> does anyone know where the setting is, that defines the suffix to the 
 Lars> kernel?
 Lars> Course, my problem is that I want the kernel output file without the 
 Lars> datecode!

I take it you use target/linux/Makefile.in.advanced? It has:

# File name for the Linux kernel binary
LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)

It should probably use $(ROOTFS_SUFFIX) instead so it uses whatever is
configured for the rootfs. I'll fix it in svn.

-- 
Bye, Peter Korsgaard
