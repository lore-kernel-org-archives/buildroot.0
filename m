From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 28 Aug 2015 23:31:06 +0200
Subject: [Buildroot] [PATCH] package/cppcms: bump to 1.0.5
Message-ID: <1440797466-29956-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump cppcms since it seems to fixe an issue with gcc5+.
The new release has been build tested against a failing Buildroot config.

Fixes:
http://autobuild.buildroot.net/results/d9d/d9d3f40bf0a203e052d2a43ac7a6a1dfa60379b3/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
It's hard to undersand which commit really fixe the issue
since svn logs lack of verbosity and contains comments like:
"Various fixes", "Workaround", "One more fixe", "make it work"...
---
 package/cppcms/cppcms.hash | 5 ++++-
 package/cppcms/cppcms.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/cppcms/cppcms.hash b/package/cppcms/cppcms.hash
index 3b2fa28..28e998c 100644
--- a/package/cppcms/cppcms.hash
+++ b/package/cppcms/cppcms.hash
@@ -1,2 +1,5 @@
+# From http://sourceforge.net/projects/cppcms/files/cppcms/1.0.5/
+sha1	15f21897c14acfd4b0c74622e49d95857f2fe939	cppcms-1.0.5.tar.bz2
+md5	d668c201dd31fff8090380ebdc0bcc2b	cppcms-1.0.5.tar.bz2
 # Locally computed:
-sha256  7c76befc706f3a5f7435b5757eab56784d762db9dd3654467e02e85000caf700  cppcms-1.0.4.tar.bz2
+sha256	84b685977bca97c3e997497f227bd5906adb80555066d811a7046b01c2f51865	cppcms-1.0.5.tar.bz2
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 7f9a452..611020c 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPCMS_VERSION = 1.0.4
+CPPCMS_VERSION = 1.0.5
 CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
 CPPCMS_LICENSE = LGPLv3
 CPPCMS_LICENSE_FILES = COPYING.TXT
-- 
2.4.3
