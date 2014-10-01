From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  1 Oct 2014 09:36:23 -0300
Subject: [Buildroot] [PATCH] rsyslog: security bump to verison 7.6.6
Message-ID: <1412166983-11140-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-3634 - potential abort when a message with PRI > 191 was
processed if the "pri-text" property was used in active templates, this
could be abused to a remote denial of service from permitted senders.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsyslog/rsyslog.hash | 4 ++--
 package/rsyslog/rsyslog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index b47932a..afc75cc 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,2 +1,2 @@
-# From http://www.rsyslog.com/downloads/download-other/
-sha256	45bca1c1ffca6b8260363617897c09baeaf350e8b92c51361d2770375cdf4b34	rsyslog-7.6.5.tar.gz
+# From http://www.rsyslog.com/downloads/download-v7-stable/
+sha256	c77ae0db6204c5bd670fa96c354ee5fe1c62c876bd84ec06ed429138c78885bb	rsyslog-7.6.6.tar.gz
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index ae152d0..a40593c 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 7.6.5
+RSYSLOG_VERSION = 7.6.6
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
-- 
2.0.4
