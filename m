From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:36 +0100
Subject: [Buildroot] [PATCH 35/52] package/corosync: add optional dbus
	support
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <1b88b2c9e4d8065656a0328ae646c5d217b07e0f.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/corosync/corosync.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/corosync/corosync.mk b/package/corosync/corosync.mk
index 865f5e0..a20edd4 100644
--- a/package/corosync/corosync.mk
+++ b/package/corosync/corosync.mk
@@ -29,7 +29,6 @@ COROSYNC_CONF_OPTS = \
 	--disable-user-flags \
 	--disable-coverage \
 	--disable-small-memory-footprint \
-	--disable-dbus \
 	--disable-testagents \
 	--disable-rdma \
 	--disable-monitoring \
@@ -44,4 +43,11 @@ COROSYNC_CONF_OPTS = \
 	--disable-qdevices \
 	--disable-qnet
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+COROSYNC_DEPENDENCIES += dbus
+COROSYNC_CONF_OPTS += --enable-dbus
+else
+COROSYNC_CONF_OPTS += --disable-dbus
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
