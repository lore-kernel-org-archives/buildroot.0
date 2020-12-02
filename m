From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  2 Dec 2020 21:07:31 +0100
Subject: [Buildroot] [PATCH/next v1] package/rsyslog: bump version to
 8.2010.0
Message-ID: <20201202200731.25360-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- disable new input module options imhttp and impcap

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rsyslog/rsyslog.hash | 2 +-
 package/rsyslog/rsyslog.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index 50edaa64cd..f404098439 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,5 +1,5 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256  5fc3d7b775f0879a40606d960491812a602e22f62e006ce027ed7bcf4c9f27d9  rsyslog-8.2004.0.tar.gz
+sha256  19b232f765c4ba7a35b91ef1f5f9af775f6ff78ef56bb7737a2ce79ccbb32b98  rsyslog-8.2010.0.tar.gz
 
 # Locally calculated
 sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 50f3328493..18f9bc33a6 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.2004.0
+RSYSLOG_VERSION = 8.2010.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
@@ -29,6 +29,8 @@ RSYSLOG_CONF_OPTS += --disable-elasticsearch \
 	--disable-omhttp \
 	--disable-fmhttp \
 	--disable-imdocker \
+	--disable-imhttp \
+	--disable-impcap \
 	--disable-omhttpfs \
 	--disable-mmkubernetes
 
-- 
2.29.2
