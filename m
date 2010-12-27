From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Dec 2010 21:34:55 +0100
Subject: [Buildroot] [git commit master 1/1] sqlite: use new upstream file
	versioning convention
Message-ID: <20101227203508.728138EB73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cf2d05b9a3bfb0821ab89d189bf91e48b737e63f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream decided to change the file naming convention.

sqlite-amalgamation is now sqlite-autoconf

For a given version, say, 3.7.4 (W.X.Y) upstream now uses WXXYYZZ with Z
reserved for minor fix versions, all zero padded.
Thus 3.7.4 is 3070400, 3.7.4.1 would be 3070401.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sqlite/sqlite.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 8b0e13e..7b3a983 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.7.4
-SQLITE_SOURCE = sqlite-amalgamation-$(SQLITE_VERSION).tar.gz
+SQLITE_VERSION = 3070400
+SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
 
-- 
1.7.2.2
