From: Rick Robino <rick.robino@ipfabrics.com>
Date: Fri, 15 Nov 2013 23:53:40 -0800
Subject: [Buildroot] longterm kernel releases: version-URI different for
	v2.x kernels
Message-ID: <76128FA7-9969-4BC7-B8F8-07F5BEDDD177@ipfabrics.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I encountered problems automatically downloading kernel version 2.6.32.61, one of the current longterm releases.  It looks like the URL might have changed, so I thought that I would mention it here in case this fact might be news to anyone.

The longterm kernels are in a subdirectory called ?v2/.6/longterm/vA.B.C?.  Buildroot only looks in ?v2.6?, which works fine for standard kernels but not the longterm ones for 2.6.

Adjusting LINUX_SITE in linux/linux.mk solved the problem for me.

$ diff linux/linux.mk linux/linux.mk.orig
28c28
< LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/longterm/v2.6.32/
---
> LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/


I hesitated to submit this as a bug or a patch because the longterm naming scheme doesn?t seem consistent at kernel.org between 2.x and 3.x kernels.  But, I thought it might help others like myself who are just getting started with buildroot.

Apologies in advance if I?ve simply missed something in the configuration documentation.

? 
Rick
