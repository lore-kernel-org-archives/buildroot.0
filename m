From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:26:56 +0100
Subject: [Buildroot] [git commit] package/xinetd: add XINETD_CPE_ID_VENDOR
Message-ID: <20210125201144.89B02815EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81dd61e5e4851524b16c08a401c7459540419e2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:xinetd:xinetd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axinetd%3Axinetd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xinetd/xinetd.hash | 2 +-
 package/xinetd/xinetd.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/xinetd/xinetd.hash b/package/xinetd/xinetd.hash
index 1b7ee09b09..ce5a93f571 100644
--- a/package/xinetd/xinetd.hash
+++ b/package/xinetd/xinetd.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  620b25f4ab4d72fdf32b13797156ea40df2049f1c07e640177e5fec544e9a94c  xinetd-2-3-15.tar.gz
+sha256  620b25f4ab4d72fdf32b13797156ea40df2049f1c07e640177e5fec544e9a94c  xinetd-2.3.15.tar.gz
 sha256  2f3dd19831b1837f7360f80a7700a130c04a59e387d4359299d6df712308bbed  COPYRIGHT
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 6d6767766b..f58c26f02a 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-XINETD_VERSION = 2-3-15
-XINETD_SITE = $(call github,xinetd-org,xinetd,xinetd-$(XINETD_VERSION))
+XINETD_VERSION = 2.3.15
+XINETD_SITE = \
+	$(call github,xinetd-org,xinetd,xinetd-$(subst .,-,$(XINETD_VERSION)))
 XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
+XINETD_CPE_ID_VENDOR = xinetd
 
 # 0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
 XINETD_IGNORE_CVES += CVE-2013-4342
