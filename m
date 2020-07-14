From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:44:22 +0200
Subject: [Buildroot] [git commit] package/bind: security bump to version
 9.11.20
Message-ID: <20200714204615.D2EE786DA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc7740825afec413d78db697477c8246ad5da9da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:
 * CVE-2020-8619: It was possible to trigger an INSIST failure when a
   zone with an interior wildcard label was queried in a certain
   pattern.

Release notes:
https://ftp.isc.org/isc/bind9/cur/9.11/RELEASE-NOTES-bind-9.11.20.txt

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 4eb3aff3b1..282b2aeba3 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.19/bind-9.11.19.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.11.20/bind-9.11.20.tar.gz.asc
 # with key AE3FAC796711EC59FC007AA474BB6B9A4CBB3D38
-sha256  0dee554a4caa368948b32da9a0c97b516c19103bc13ff5b3762c5d8552f52329  bind-9.11.19.tar.gz
+sha256  306831a738a275693bbe1d6839a09b34a2c8b5c26f8a42ea57ef000a6a99c2b6  bind-9.11.20.tar.gz
 sha256  da2aec2b7f6f0feb16bcb080e2c587375fd3195145f047e4d92d112f5b9db501  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 362a26dce6..80f8defca8 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.19
+BIND_VERSION = 9.11.20
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
