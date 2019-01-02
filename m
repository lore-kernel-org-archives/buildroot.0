From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  3 Jan 2019 00:10:25 +0100
Subject: [Buildroot] [PATCH] package/solarus: update license.txt file hash
 and remove license_gpl.txt hash.
Message-ID: <20190102231026.8189-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license.txt file has been updated with Solarus Free Resource Pack URL.

Before version 1.6.0, the archive was downloaded from github and license_gpl.txt
file which is present in the git repository.
Since version 1.6.0, the archive is downloaded from [1] but the license_gpl.txt
file is missing.

This has been reported upstream [2].

[1] http://www.solarus-games.org
[2] https://gitlab.com/solarus-games/solarus/issues/1328

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/solarus/solarus.hash | 3 +--
 package/solarus/solarus.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/solarus/solarus.hash b/package/solarus/solarus.hash
index e4a7a3a6b6..dab8d1a1fa 100644
--- a/package/solarus/solarus.hash
+++ b/package/solarus/solarus.hash
@@ -1,5 +1,4 @@
 # Locally calculated
 sha256 d800fdf388f860732f2d40c8dd635c34fd1c452857f75bf9b3a421e3ef5ee751  solarus-1.6.0-src.tar.gz
 
-sha256 09cb24006b6a3f2698d8851dc5df4f413c1a98e20d4008bffd76ec236f14244d  license.txt
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  license_gpl.txt
+sha256 309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index 663ccb173d..d1c49af83f 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -10,7 +10,7 @@ SOLARUS_SOURCE = solarus-$(SOLARUS_VERSION)-src.tar.gz
 
 SOLARUS_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
 	CC-BY-SA-3.0 (GUI icons)
-SOLARUS_LICENSE_FILES = license.txt license_gpl.txt
+SOLARUS_LICENSE_FILES = license.txt
 
 # Install libsolarus.so
 SOLARUS_INSTALL_STAGING = YES
-- 
2.14.5
