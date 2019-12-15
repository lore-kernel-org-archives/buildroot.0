From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Dec 2019 14:13:56 +0100
Subject: [Buildroot] [PATCH v3,1/3] package/solarus: bump to version 1.6.2
Message-ID: <20191215131358.3637959-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to gitlab to retrieve latest version

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3:
 - Use tar.bz2 tarball

Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Fix SOLARUS_SITE (missing '-/' in URL)

 package/solarus/solarus.hash | 2 +-
 package/solarus/solarus.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/solarus/solarus.hash b/package/solarus/solarus.hash
index dab8d1a1fa..3092b13507 100644
--- a/package/solarus/solarus.hash
+++ b/package/solarus/solarus.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 d800fdf388f860732f2d40c8dd635c34fd1c452857f75bf9b3a421e3ef5ee751  solarus-1.6.0-src.tar.gz
+sha256 c14cd97bad6e12310b938d90abd4e8ebdd0abb403cdcc015d5add82dfc5a085b  solarus-v1.6.2.tar.bz2
 
 sha256 309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index fd7bbea2c7..c1c2519693 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-SOLARUS_VERSION = 1.6.0
-SOLARUS_SITE = http://www.solarus-games.org/downloads/solarus
-SOLARUS_SOURCE = solarus-$(SOLARUS_VERSION)-src.tar.gz
+SOLARUS_VERSION = 1.6.2
+SOLARUS_SITE = \
+	https://gitlab.com/solarus-games/solarus/-/archive/v$(SOLARUS_VERSION)
+SOLARUS_SOURCE = solarus-v$(SOLARUS_VERSION).tar.bz2
 
 SOLARUS_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
 	CC-BY-SA-3.0 (GUI icons)
-- 
2.24.0
