From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 11:59:58 +0200
Subject: [Buildroot] [git commit] busybox: bump to version 1.24.0
Message-ID: <20151014100736.48B9681E71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d42ca918cc72bb1baf817ee1614d77b5081a7e75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable CONFIG_FEATURE_SYNC_FANCY in the busybox.config because that
option causes build failures for any uClibc based toolchains since it
requires syncfs() support, which doens't exist in uClibc.

This new option has been introduced in 1.24.0, so despite of disabling
it, we are not losing anything that we had before.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.config |    1 +
 package/busybox/busybox.hash   |    6 +++---
 package/busybox/busybox.mk     |    2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 8d1d80a..bb138f9 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -284,6 +284,7 @@ CONFIG_FEATURE_SORT_BIG=y
 CONFIG_STTY=y
 # CONFIG_SUM is not set
 CONFIG_SYNC=y
+# CONFIG_FEATURE_SYNC_FANCY is not set
 # CONFIG_TAC is not set
 CONFIG_TAIL=y
 CONFIG_FEATURE_FANCY_TAIL=y
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index cfd4937..1a9b2ff 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.23.2.tar.bz2.sign
-md5	7925683d7dd105aabe9b6b618d48cc73	busybox-1.23.2.tar.bz2
-sha1	7f37193cb249f27630e0b2a2c6c9bbb7b1d24c16	busybox-1.23.2.tar.bz2
+# From http://busybox.net/downloads/busybox-1.24.0.tar.bz2.sign
+md5 2fa3110042e518e0e1225c799294664c  busybox-1.24.0.tar.bz2
+sha1 238a9b8a66c31fdcdd00790a840ef03cc77482c7  busybox-1.24.0.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6e302f4..3494456 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.23.2
+BUSYBOX_VERSION = 1.24.0
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
