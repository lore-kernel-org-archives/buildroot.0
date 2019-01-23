From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 15:19:49 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/sqlite: security
 bump to version 3.25.3
Message-ID: <20190123143029.A328B8E2CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c129b068477bc5ee062ae479c332aa61b190be54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes CVE-2018-20346: SQLite before 3.25.3, when the FTS3 extension is
enabled, encounters an integer overflow (and resultant buffer overflow) for
FTS3 queries that occur after crafted changes to FTS3 shadow tables,
allowing remote attackers to execute arbitrary code by leveraging the
ability to run arbitrary SQL statements (such as in certain WebSQL use
cases), aka Magellan.

For more details, see:
https://blade.tencent.com/magellan/index_en.html
https://www.sqlite.org/releaselog/3_25_3.html
https://www.mail-archive.com/sqlite-users at mailinglists.sqlite.org/msg113218.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c4475c0a577308c81f4cddfc48b34b4d14fadf02)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index eefa31ffb7..7be42a0aca 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
 # From https://www.sqlite.org/download.html
-sha1 aedfbdc14eb700099434d6a743135743cff47393  sqlite-autoconf-3250200.tar.gz
+sha1 5d6dc7634ec59e7a6fffa8758c1e184b2522c2e5  sqlite-autoconf-3250300.tar.gz
 # Calculated based on the hash above
-sha256 da9a1484423d524d3ac793af518cdf870c8255d209e369bd6a193e9f9d0e3181  sqlite-autoconf-3250200.tar.gz
+sha256 00ebf97be13928941940cc71de3d67e9f852698233cd98ce2d178fd08092f3dd  sqlite-autoconf-3250300.tar.gz
 # Locally calculated
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 34a0b9538e..6cf5710e5d 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3250200
+SQLITE_VERSION = 3250300
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2018
 SQLITE_LICENSE = Public domain
