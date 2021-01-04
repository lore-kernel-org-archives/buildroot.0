From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Mon,  4 Jan 2021 19:47:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/waf: bump to v2.0.21
Message-ID: <20210104184712.95956-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a comment in waf.hash about the mechanism for LICENSE hash check

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/waf/waf.hash | 9 ++++++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index afca0f31bf..1e74b74d63 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,4 +1,7 @@
 # Locally computed
-sha1  92212071a63ce38fdfd69fb8332f04e84d1f6635  waf-2.0.20
-sha256  bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f  waf-2.0.20
-sha256  bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f  waf
+sha1  b7f38d2987433ee6e0f4a75ecec8807575176e1e  waf-2.0.21
+sha256  7cebf2c5efe53cbb9a4b5bdc4b49ae90ecd64a8fce7a3222d58e591b58215306  waf-2.0.21
+
+# The waf script also contains its license, but is renamed `waf` in the extract
+# step, so this is a synonym for the above, to check WAF_LICENSE
+sha256  7cebf2c5efe53cbb9a4b5bdc4b49ae90ecd64a8fce7a3222d58e591b58215306  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 9c5e72d9eb..dd97519b57 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.0.20
+WAF_VERSION = 2.0.21
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
-- 
2.25.3
