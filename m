From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Apr 2014 00:27:51 +0200
Subject: [Buildroot] [git commit] gcc: fixup "standard" gcc location after
	'use default gcc 4.8.2 for microblaze'
Message-ID: <20140429223019.DE4AC9CA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42ebd7475d3fc94590645182ed8ea8a4aa15197c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Somehow the 'else' part got dropped from commit 3f82e9dbcd (use default gcc
4.8.2 for microblaze), breaking download for "normal" architectures.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 3fe2844..3274821 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -22,6 +22,7 @@ GCC_SITE = ftp://www.at91.com/pub/buildroot/
 else ifeq ($(BR2_arc),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
+else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 endif
 
