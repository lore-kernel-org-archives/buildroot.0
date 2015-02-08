From: Romain Naour <romain.naour@openwide.fr>
Date: Mon,  9 Feb 2015 00:22:10 +0100
Subject: [Buildroot] [PATCH 3/3] package/openmvtools: don't use host library
	path
In-Reply-To: <1423437730-22997-1-git-send-email-romain.naour@openwide.fr>
References: <1423437730-22997-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1423437730-22997-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set CUSTOM_PROCPS_LIBS to -L$(STAGING_DIR) otherwise -L/lib is
used by default.

Fixes:
http://autobuild.buildroot.net/results/bff/bff7d8f3ec19ce790f0c88a336d1007e1ff29836/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openvmtools/openvmtools.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 7aa04af..42cda82 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -22,7 +22,8 @@ OPENVMTOOLS_DEPENDENCIES += libfuse
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
-OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
+OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps \
+	CUSTOM_PROCPS_LIBS="-L$(STAGING_DIR)"
 OPENVMTOOLS_CONF_OPTS += --with-procps
 OPENVMTOOLS_DEPENDENCIES += procps-ng
 else
-- 
1.9.3
