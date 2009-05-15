From: Michael Roth <mroth@nessie.de>
Date: Fri, 15 May 2009 13:05:33 +0200
Subject: [Buildroot] [PATCH] sqlite3: Bump version and switch to
	'amalgamation'-mode
Message-ID: <1242385533-19611-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumped to new sqlite version with speed improvements,
bug fixes and enhanced query optimizer.

Additionally, switched to the 'amalgamation'-tar.gz
because the traditional tar.gz for 3.6.14 is broken.

Anyway, the 'amalgamation' is recommended and the
traditionally tar.gz is not supported anymore by
the SQlite developers.

See:
	http://www.sqlite.org/download.html
	http://www.sqlite.org/amalgamation.html

Closes #333.

Reported-By: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/database/sqlite/sqlite.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/database/sqlite/sqlite.mk b/package/database/sqlite/sqlite.mk
index 9f10f1e..7acf439 100644
--- a/package/database/sqlite/sqlite.mk
+++ b/package/database/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.6.13
-SQLITE_SOURCE = sqlite-$(SQLITE_VERSION).tar.gz
+SQLITE_VERSION = 3.6.14
+SQLITE_SOURCE = sqlite-amalgamation-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
 SQLITE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-- 
1.6.0.6
