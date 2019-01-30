From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 30 Jan 2019 18:28:33 +0100
Subject: [Buildroot] [PATCH 1/3] aircrack-ng: add optional hwloc dependency
Message-ID: <20190130172835.4761-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hwloc dependency has been added in version 1.4 with
https://github.com/aircrack-ng/aircrack-ng/commit/c31b27449962bc69638b32ec14e0ffdb8997dfcf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/aircrack-ng/aircrack-ng.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 350e251bfe..b51332ab77 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -31,6 +31,13 @@ else
 AIRCRACK_NG_CONF_OPTS += --without-duma
 endif
 
+ifeq ($(BR2_PACKAGE_HWLOC),y)
+AIRCRACK_NG_DEPENDENCIES += hwloc
+AIRCRACK_NG_CONF_OPTS += --enable-hwloc
+else
+AIRCRACK_NG_CONF_OPTS += --disable-hwloc
+endif
+
 ifeq ($(BR2_PACKAGE_JEMALLOC),y)
 AIRCRACK_NG_DEPENDENCIES += jemalloc
 AIRCRACK_NG_CONF_OPTS += --with-jemalloc
-- 
2.14.1
