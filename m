From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Aug 2016 09:45:53 +0200
Subject: [Buildroot] [PATCHv2] pckages/sconeserver: fix build with gcc-6
Message-ID: <1472111153-14215-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We simply bump the version rather than backport the patch, as there has
been only very few, minor commits in-between.

Fixes:
    http://autobuild.buildroot.org/results/fa7/fa7881c6ffb821a2aff139f95ba53c96d6e2b942/
    http://autobuild.buildroot.org/results/749/749fbd6cc505f6f3c0cccfeb63be6deddab8fba5/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2;
  - update hash file  (Thomas)
---
 package/sconeserver/sconeserver.hash | 2 +-
 package/sconeserver/sconeserver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/sconeserver.hash b/package/sconeserver/sconeserver.hash
index 4503b9f..978b442 100644
--- a/package/sconeserver/sconeserver.hash
+++ b/package/sconeserver/sconeserver.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 6bd76843df8e48519c67c72505412896b227d7b40ec0dee831c79ed414c85ff3 sconeserver-bbb384404575f8a3ef31c1ec41218b621b66ab27.tar.gz
+sha256 38e72b962eb42bea8f0deb6f101833f8f2f2fa8c53f0dc03f3eb5d56873517c8 sconeserver-d659468cd164e6a6cc12932cc6780566b04f8328.tar.gz
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 0b0ed1a..e02c1a6 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCONESERVER_VERSION = bbb384404575f8a3ef31c1ec41218b621b66ab27
+SCONESERVER_VERSION = d659468cd164e6a6cc12932cc6780566b04f8328
 SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
-- 
2.7.4
