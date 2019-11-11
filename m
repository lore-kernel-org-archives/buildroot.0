From: Xiaolin He <xiaolin.he@nxp.com>
Date: Mon, 11 Nov 2019 12:05:18 +0800
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host configure option
Message-ID: <20191111040518.7996-1-xiaolin.he@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host-sysrepoctl should install yang modules to target
directory.

Signed-off-by: Xiaolin He <xiaolin.he@nxp.com>
---
 DEVELOPERS                 | 3 +++
 package/sysrepo/sysrepo.mk | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c0863aabc6..41a3935407 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2430,6 +2430,9 @@ F:	package/python-pyusb/
 N:	Wojciech Nizi?ski <niziak@spox.org>
 F:	package/fwup/
 
+N:	Xiaolin He <xiaolin.he@nxp.com>
+F:	package/sysrepo/
+
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
 F:	board/friendlyarm/nanopi-neo/
 F:	configs/nanopi_neo_defconfig
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 8676158a19..932c8fd5c0 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -58,7 +58,7 @@ HOST_SYSREPO_CONF_OPTS = \
 	-DCALL_TARGET_BINS_DIRECTLY=OFF \
 	-DBUILD_EXAMPLES=OFF \
 	-DBUILD_CPP_EXAMPLES=OFF \
-	-DREPOSITORY_LOC=$(HOST_DIR)/etc/sysrepo \
+	-DREPOSITORY_LOC=$(TARGET_DIR)/etc/sysrepo \
 	-DSUBSCRIPTIONS_SOCKET_DIR=$(HOST_DIR)/var/run/sysrepo-subscriptions
 
 $(eval $(cmake-package))
-- 
2.17.1
