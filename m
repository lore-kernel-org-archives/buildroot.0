From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Dec 2010 12:33:04 -0300
Subject: [Buildroot] [PATCH] sqlite: use new upstream file versioning
	convention
Message-ID: <1293463984-20467-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream decided to change the file naming convention.

sqlite-amalgamation is now sqlite-autoconf

For a given version, say, 3.7.4 (W.X.Y) upstream now uses WXXYYZZ with Z
reserved for minor fix versions, all zero padded.
Thus 3.7.4 is 3070400, 3.7.4.1 would be 3070401.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
