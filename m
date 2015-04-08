From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:27:05 +0200
Subject: [Buildroot] [git commit] socat: security bump to version 2.0.0-b8
Message-ID: <20150408192716.88652819AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c76c25e63d8790eae14c5c23550caebcbd81a24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-1379 - signal handler implementations are not async-signal-safe
and can cause crash or freeze of socat processes.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/socat/socat.hash |    2 ++
 package/socat/socat.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
