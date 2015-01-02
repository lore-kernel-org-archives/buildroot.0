From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Fri, 02 Jan 2015 18:02:37 +0100
Subject: [Buildroot] [RFC] Wine package
Message-ID: <54A6CF2D.1090706@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm working on the Wine package for upstream buildroot.
I attached Config.in and wine.mk for early review, so i don't start totally wrong.
Note that it's not complete wrt to dependency checking.

For cross compilation wine needs its own tools compiled for the host architecture, therefor there is host-wine.
As there's no easy way to only build the wine tools i disabled as much as possible.

Are stable or up-to-date (development) versions preferred? Wine 1.6.2 (latest stable) is one year old...
-------------- next part --------------
config BR2_PACKAGE_WINE
	bool "Wine"
	depends on BR2_INET_IPV6
	depends on BR2_TOOLCHAIN_HAS_THREADS
	# Wine has much CPU specific code
	depends on BR2_i386 || BR2_x86_64
	help
	  Wine is a compatibility layer capable of running
	  Windows applications on Linux. Instead of simulating internal
	  Windows logic like a virtual machine or emulator,
	  Wine translates Windows API calls into POSIX calls on-the-fly,
	  eliminating the performance and memory penalties of other methods.

	  http://www.winehq.org

comment "Wine needs a toolchain w/ IPv6, threads"
	depends on BR2_i386 || BR2_x86_64
	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
-------------- next part --------------
A non-text attachment was scrubbed...
Name: wine.mk
Type: text/x-makefile
Size: 4234 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150102/b11261be/attachment.bin>
