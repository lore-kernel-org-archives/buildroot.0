From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 14:55:52 +0100
Subject: [Buildroot] [PATCH] package/glibc: bump version for post-2.30
 security fixes
Message-ID: <20191213135552.27664-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerability:

- CVE-2019-19126: ld.so failed to ignore the LD_PREFER_MAP_32BIT_EXEC
  environment variable during program execution after a security
  transition, allowing local attackers to restrict the possible mapping
  addresses for loaded libraries and thus bypass ASLR for a setuid
  program.  Reported by Marcin Ko?cielnicki.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../glibc.hash                                                  | 2 +-
 package/glibc/glibc.mk                                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename package/glibc/{2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1 => 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91}/glibc.hash (70%)

diff --git a/package/glibc/2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1/glibc.hash b/package/glibc/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/glibc.hash
similarity index 70%
rename from package/glibc/2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1/glibc.hash
rename to package/glibc/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/glibc.hash
index 276cd6f7c0..4283ea04b4 100644
--- a/package/glibc/2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1/glibc.hash
+++ b/package/glibc/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  5abb12ac8b756ec900c9d800860041a7920c6b335338af1cba15bab20d54119f  glibc-2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1.tar.gz
+sha256  fe1ca8099bc2cda997d8a585f1a512e59df56c52c9c7363a4058da2725c8f4a9  glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 1b38f8aedb..c77105ec61 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -16,7 +16,7 @@ GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-GLIBC_VERSION = 2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1
+GLIBC_VERSION = 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.20.1
