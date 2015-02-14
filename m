From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Feb 2015 12:42:50 +0100
Subject: [Buildroot] [PATCH v2] package/openmvtools: don't use host library
	path
Message-ID: <1423914170-10299-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set CUSTOM_PROCPS_LIBS to " " otherwise -L/lib is
used by default.

Fixes:
http://autobuild.buildroot.net/results/bff/bff7d8f3ec19ce790f0c88a336d1007e1ff29836/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openvmtools/openvmtools.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 7aa04af..e0ec6d6 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -22,7 +22,9 @@ OPENVMTOOLS_DEPENDENCIES += libfuse
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
-OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
+# Set CUSTOM_PROCPS_LIBS to " " otherwise -L/lib is used by default.
+OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps \
+	CUSTOM_PROCPS_LIBS=" "
 OPENVMTOOLS_CONF_OPTS += --with-procps
 OPENVMTOOLS_DEPENDENCIES += procps-ng
 else
-- 
1.9.3
