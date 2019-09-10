From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 10 Sep 2019 21:07:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/haveged: bump to version 1.9.6
Message-ID: <1568142431-9159-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This includes the following changes:

94079e6 Fixed invalid UTF-8 codes in ChangeLog
1470a82 Updated service.fedora
9596c53 Updated service.fedora
b50b59b New version 1.9.5
037e059 New version 1.9.5
2681d01 Added test for /dev/random symlink
0dac21b Update to automake 1.16
638e2f0 Fixed built issue on Cygwin
083f827 minimize diff
b38def1 minimize diff
e16369d take into account review by @nbraud
6dfce53 Remove support for CPUID on ia64
fc50dda [PATCH] Output some progress during CUSUM and RANDOM EXCURSION test
be4e481 NEWS: Cleanup extraneous whitespace
0815b3c Fixup upstream changelog
6d52229 Fix type mismatch in get_poolsize
90d00f7 service.redhat: update PIDFile
16a9726 fix segv at start
ceab89a init.d/Makefile.am: add missing dependency
01e3154 Diagnostics capture mode now works correctly by referencing the right variable during rng warmup
f219358 Fix segfault on arm machines

Also add a 'v' prefix in _SITE variable.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 0489418..fc78587 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c4959d3cb1fa6391d16a3aa1ba4d82cd3a0d497206ae4b87d638088c0664e5aa	haveged-1.9.4.tar.gz
+sha256  4d4c046755476d3734ffb78772c242c25913ff0eb7509c143671dae6ec9d1189	haveged-1.9.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index bc1bb2d..afb54df 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.4
-HAVEGED_SITE = $(call github,jirka-h,haveged,$(HAVEGED_VERSION))
+HAVEGED_VERSION = 1.9.6
+HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
 
-- 
2.7.4
