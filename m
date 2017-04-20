From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 23:29:40 +0200
Subject: [Buildroot] [git commit] netsniff-ng: use upstream provided tarball
Message-ID: <20170420213014.161A781699@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=418545457e0703dd27a33f7990bac30ab0df5d78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsniff-ng/netsniff-ng.hash | 4 ++--
 package/netsniff-ng/netsniff-ng.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index 67b3331..79dc686 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 62e8aa970a4f46cdaddf54daf8ea26e7ae9f9f358efaf0651799c8c4e937c286 netsniff-ng-v0.6.2.tar.gz
+# Locally calculated after checking signature
+sha256 4f2f7afc96b5044b5ccd3b671d0c3b8cb166bfa7f1063cea6c2d5e0fd5a13cf5 netsniff-ng-0.6.2.tar.xz
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 1a4017e..5d59747 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = v0.6.2
-NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
+NETSNIFF_NG_VERSION = 0.6.2
+NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
+NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
 NETSNIFF_NG_LICENSE = GPL-2.0
 NETSNIFF_NG_LICENSE_FILES = README COPYING
 # Prevent netsniff-ng configure script from finding a host installed nacl
