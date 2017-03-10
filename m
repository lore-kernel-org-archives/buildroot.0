From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 21:40:56 +0100
Subject: [Buildroot] [git commit] Revert "libnl: bump to version 3.2.29"
Message-ID: <20170310204126.D8F24822C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=482dd2256905e6146cfa88e1779db4c0e21f32dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit c3a9c432fd6dbb56e05eacc4063be6893e428b1e. It
causes too many build failures.

Fixes:

  http://autobuild.buildroot.net/results/563f46e9a11f9e3b174a4e1308444f284d1b3421/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnl/libnl.hash | 4 ++--
 package/libnl/libnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 9761a95..2f1a3cb 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,2 +1,2 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_2_29/libnl-3.2.29.tar.gz.sha256sum
-sha256	0beb593dc6abfffa18a5c787b27884979c1b7e7f1fd468c801e3cc938a685922	libnl-3.2.29.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_2_27/libnl-3.2.27.tar.gz.sha256sum
+sha256	4bbbf92b3c78a90f423cf96260bf419a28b75db8cced47051217a56795f58ec6	libnl-3.2.27.tar.gz
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index d168885..85c0db8 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.2.29
+LIBNL_VERSION = 3.2.27
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
