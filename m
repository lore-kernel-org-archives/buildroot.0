From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 14:01:29 +0100
Subject: [Buildroot] [RFC 0/2] Handle conflicting files with Busybox
Message-ID: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As we discussed during the Prague Buildroot Developers meeting, in
order to implement per-package SDK, we need to ensure that no package
overwrites files installed by another package.

This RFC series is an attempt at solving this problem for Busybox. I
have not fixed all packages yet: since it is a very boring task to do,
I wanted to first get some feedback on whether the approach looks
reasonable or not.

If the feedback is positive, I'll go ahead and submit proper patches
that fix all packages that conflict with Busybox.

Thanks for your feedback!

Thomas

Thomas Petazzoni (2):
  busybox: avoid conflict with other packages
  packages: drop no longer needed busybox dependencies

 package/bc/bc.mk                   |  5 ----
 package/binutils/binutils.mk       |  5 ----
 package/busybox/busybox.mk         | 58 ++++++++++++++++++++++++++++++++++++++
 package/coreutils/coreutils.mk     |  6 ----
 package/cpio/cpio.mk               |  1 -
 package/dcron/dcron.mk             |  5 ----
 package/debianutils/debianutils.mk |  2 --
 package/diffutils/diffutils.mk     |  4 ---
 package/fbset/fbset.mk             |  5 ----
 package/kmod/kmod.mk               |  3 --
 package/util-linux/util-linux.mk   |  6 ----
 11 files changed, 58 insertions(+), 42 deletions(-)

-- 
2.14.3
