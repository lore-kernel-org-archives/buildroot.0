From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Oct 2018 09:36:35 +0200
Subject: [Buildroot] [git commit] crda: bump version to 4.14
Message-ID: <20181003074356.E6C548A460@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e79bd3f456cef12886ac6b086c8bc78e3e520f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- changed download location
- rebased 0001-crda-support-python-3-in-utils-key2pub.py.patch

Changes since 3.18:
- 2018-01-05	Update gitignore
- 2018-01-05	crda: Fix error: `keys??? defined but not used

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-crda-support-python-3-in-utils-key2pub.py.patch | 18 ++++++++++--------
 package/crda/crda.hash                                 |  4 ++--
 package/crda/crda.mk                                   |  6 +++---
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
index 99eb11cba7..fb46d58ed2 100644
--- a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
+++ b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
@@ -1,7 +1,7 @@
-From 797f2836c48f9ba2446629ae4b6867ca1a5ea512 Mon Sep 17 00:00:00 2001
+From 4c346aa9e816bddfedc8ac99809fd1ed91bfc8ee Mon Sep 17 00:00:00 2001
 From: Taahir Ahmed <ahmed.taahir@gmail.com>
 Date: Wed, 30 Mar 2016 11:23:54 -0300
-Subject: [PATCH 1/2] crda: support python 3 in utils/key2pub.py
+Subject: [PATCH] crda: support python 3 in utils/key2pub.py
 
 utils/key2pub.py can now be run under either python 2.7 or python 3.x.
 This required some minor syntactical changes as well as switching from
@@ -18,16 +18,18 @@ fixed:
 [Gustavo: don't call /utils/key2pub.py since that doesn't compute]
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Rebased against crda-4.14]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
 Status: submitted upstream by author but not (yet) accepted
 URL: http://www.spinics.net/lists/linux-wireless/msg138936.html
-
+---
  Makefile         |   2 +-
- utils/key2pub.py | 146 ++++++++++++++++++++++++++++---------------------------
+ utils/key2pub.py | 146 ++++++++++++++++++++++++-----------------------
  2 files changed, 75 insertions(+), 73 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 1f25509..523a96e 100644
+index a3ead30..8da38d0 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -112,7 +112,7 @@ $(REG_BIN):
@@ -40,7 +42,7 @@ index 1f25509..523a96e 100644
  $(LIBREG): regdb.h reglib.h reglib.c
  	$(NQ) '  CC  ' $@
 diff --git a/utils/key2pub.py b/utils/key2pub.py
-index 3e84cd2..c76cbbb 100755
+index 9bb04cd..9f92ebd 100755
 --- a/utils/key2pub.py
 +++ b/utils/key2pub.py
 @@ -1,126 +1,128 @@
@@ -223,7 +225,7 @@ index 3e84cd2..c76cbbb 100755
 +	.n = _n, .len_n = sizeof(_n), \\
  }
  
- static const struct key_params keys[] = {
+ static const struct key_params __attribute__ ((unused)) keys[] = {
  ''')
 -    for n in xrange(n + 1):
 -        output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
@@ -267,5 +269,5 @@ index 3e84cd2..c76cbbb 100755
  
  modes[mode][1](output, idx - 1)
 -- 
-2.7.3
+2.18.0
 
diff --git a/package/crda/crda.hash b/package/crda/crda.hash
index 45b9d20407..edec55a019 100644
--- a/package/crda/crda.hash
+++ b/package/crda/crda.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/software/network/crda/sha256sums.asc
-sha256	43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf	crda-3.18.tar.xz
+# Locally computed
+sha256 5a8f35bb8b27474f466b0e75d451ba917433d8aab1889678a64d9c4e72a8b8c2 crda-4.14.tar.gz
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index df879f68bb..ab50030126 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CRDA_VERSION = 3.18
-CRDA_SOURCE = crda-$(CRDA_VERSION).tar.xz
-CRDA_SITE = $(BR2_KERNEL_MIRROR)/software/network/crda
+CRDA_VERSION = 4.14
+CRDA_SOURCE = crda-$(CRDA_VERSION).tar.gz
+CRDA_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/snapshot
 CRDA_DEPENDENCIES = host-pkgconf host-python-pycrypto libnl libgcrypt
 CRDA_LICENSE = ISC
 CRDA_LICENSE_FILES = LICENSE
