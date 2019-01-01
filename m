From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jan 2019 16:30:00 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/netatalk:
 security bump to version 3.1.23
Message-ID: <20190101153030.3D9AB8177C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b91c8fa31e5684223d89efffa957698a4a6abded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes CVE-2018-1160: Netatalk before 3.1.12 is vulnerable to an out of
bounds write in dsi_opensess.c.  This is due to lack of bounds checking on
attacker controlled data.  A remote unauthenticated attacker can leverage
this vulnerability to achieve arbitrary code execution.

For more details, see the release notes:
http://netatalk.sourceforge.net/3.1/ReleaseNotes3.1.12.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8aaf05916c20d1fe3fafd424fdcd77726de140c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.hash | 6 +++---
 package/netatalk/netatalk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index ce78373ae3..762fcd460e 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.11/
-md5 8f79ce2a275b128ebb07188766f088fc  netatalk-3.1.11.tar.bz2
-sha1 5aa7900e6f7de3c7ee812aa1130c1245d1974586  netatalk-3.1.11.tar.bz2
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.12/
+md5 021d2330cb7f7cd2977aec46299dcc1b  netatalk-3.1.12.tar.bz2
+sha1 cc1fe1ebdbdb4da9cf82835c440e82ba28a832c5  netatalk-3.1.12.tar.bz2
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 28a87509e0..1214fc3bf5 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.11
+NETATALK_VERSION = 3.1.12
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 # For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
