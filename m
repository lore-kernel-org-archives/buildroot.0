From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 17:10:20 +0200
Subject: [Buildroot] [git commit] rsh-redone: remove code related to rcp
Message-ID: <20140412151044.6EE9D9C749@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ace1e4203854080ba76955e090cc88f1d915df87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While there is a rcp.c in the source tree, the Makefile does not have
a rule nor logic to build it, and it anyway doesn't build at all.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsh-redone/Config.in     |    4 ----
 package/rsh-redone/rsh-redone.mk |    1 -
 2 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index d26ca2b..f636e2f 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -9,10 +9,6 @@ config BR2_PACKAGE_RSH_REDONE
 
 if BR2_PACKAGE_RSH_REDONE
 
-# this is incomplete in the source
-#config BR2_PACKAGE_RSH_REDONE_RCP
-#	bool "rcp"
-
 config BR2_PACKAGE_RSH_REDONE_RLOGIN
 	bool "rlogin"
 
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index 93e1358..8b74538 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -9,7 +9,6 @@ RSH_REDONE_SOURCE = rsh-redone_$(RSH_REDONE_VERSION).orig.tar.gz
 RSH_REDONE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/r/rsh-redone
 
 rsh-redone-bin-y =
-rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RCP) += rcp
 rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RLOGIN) += rlogin
 rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RSH) += rsh
 rsh-redone-sbin-y =
