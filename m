From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 24 Jan 2014 22:34:21 +0100
Subject: [Buildroot] [PATCH 1/1] openpowerlink: force static library build
Message-ID: <1390599261-30736-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no shared lib in openpowerlink,
so force static lib to build libpowerlink.a

Fixes:
http://autobuild.buildroot.net/results/b33/b33008d260c95bedc52bed48f191f76843612ef9/build-end.log
http://autobuild.buildroot.net/results/c46/c464bdfb8edaaf69d49ade92ef9cc6f45cc73362/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openpowerlink/openpowerlink.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 3a60478..0800a05 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -22,6 +22,10 @@ endif
 
 OPENPOWERLINK_CONF_OPT = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
 
+# There is no shared lib in openpowerlink, 
+# so force static lib to build libpowerlink.a
+OPENPOWERLINK_CONF_OPT += -DBUILD_SHARED_LIBS=OFF
+
 ifeq ($(BR2_ENABLE_DEBUG),y)
 OPENPOWERLINK_CONF_OPT += -DCMAKE_BUILD_TYPE=Debug
 else
-- 
1.8.5.3
