From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  3 Nov 2019 00:07:43 -0600
Subject: [Buildroot] [PATCH 1/1] package/iputils: add systemd dependency
Message-ID: <20191103060743.107052-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed to ensure systemd services are installed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iputils/iputils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 57e90a973a..daceb192f2 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -49,6 +49,10 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 IPUTILS_NINFOD = n
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+IPUTILS_DEPENDENCIES += systemd
+endif
+
 # ninfod requires <pthread.h>
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 IPUTILS_NINFOD = n
-- 
2.20.1
