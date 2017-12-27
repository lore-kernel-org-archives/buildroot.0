From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 12:33:38 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] xenomai: bump to 3.0.6
Message-ID: <20171227113626.D94F0811ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f4087c3a77694a1a34bd1ffd03874acdb179660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

This new version includes a fix to allow compilation with compilers
defaulting to -fpie (gcc 6+). It also a fix for a critical bug in
Cobalt:

http://xenomai.org/pipermail/xenomai/2017-November/037923.html

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 34d20f0b878c4f18ee5f5af0276894499d3f9bf8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xenomai/xenomai.hash | 2 +-
 package/xenomai/xenomai.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index 1290ca5..c36badb 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,2 @@
 # Locally computed;
-sha256 84836a43b6a996dcdcb42b0b1653a3271cc201df2a2d42c1b4b3bafb2cca7c63  xenomai-3.0.5.tar.bz2
+sha256 2c0dd3f0e36e4a10f97e0028989bb873e80f4d1ce212ac55fd3b28857c464f94  xenomai-3.0.6.tar.bz2
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index c53d514..6bf08ed 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 3.0.5
+XENOMAI_VERSION = 3.0.6
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
