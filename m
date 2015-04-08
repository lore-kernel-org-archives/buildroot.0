From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Apr 2015 13:21:46 -0300
Subject: [Buildroot] [PATCH] socat: security bump to version 2.0.0-b8
Message-ID: <1428510106-26897-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-1379 - signal handler implementations are not async-signal-safe
and can cause crash or freeze of socat processes.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/socat/socat.hash | 2 ++
 package/socat/socat.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/socat/socat.hash

diff --git a/package/socat/socat.hash b/package/socat/socat.hash
new file mode 100644
index 0000000..a876ae2
--- /dev/null
+++ b/package/socat/socat.hash
@@ -0,0 +1,2 @@
+# From http://www.dest-unreach.org/socat/download.md5sum
+md5	ff56576703dfdeac221357a348c30760	socat-2.0.0-b8.tar.bz2
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index ecb7621..eaf13bc 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 2.0.0-b7
+SOCAT_VERSION = 2.0.0-b8
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPLv2
-- 
2.0.5
