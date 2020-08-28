From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 23:44:10 +0200
Subject: [Buildroot] [git commit] package/powertop: bump version to 2.13
Message-ID: <20200902161637.42BC585EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68cf4136bbe29832be38a91b8aaa74ae3862dc0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also separate the fields in the hash file by two spaces and add pgp
signature check.

Since we're now using the default value for POWERTOP_SOURCE, drop this
variable definition.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/powertop/powertop.hash | 8 +++++---
 package/powertop/powertop.mk   | 3 +--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/powertop/powertop.hash b/package/powertop/powertop.hash
index a3261789d2..fc8f3cc52f 100644
--- a/package/powertop/powertop.hash
+++ b/package/powertop/powertop.hash
@@ -1,3 +1,5 @@
-# Locally-generated hash
-sha256	ae68c913784f78b497076e0b1d588f59854a66c074690d545dae7956e4f5d64f	powertop-v2.11-1-g7ef7f79.tar.gz
-sha256	b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259	COPYING
+# Locally calculated after checking pgp signature
+# https://01.org/sites/default/files/downloads/powertop-2.13.tar.gz.asc.txt
+# using key 22E8F306C8FA4BAA2A5F36F3A0303B060918941C
+sha256  a65f992ca4a419bc73b623651060eb9fc00c5a86fa03556358cd9db011ef3178  powertop-2.13.tar.gz
+sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 3dbc015cef..c3e8d2549c 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-POWERTOP_VERSION = 2.11
+POWERTOP_VERSION = 2.13
 POWERTOP_SITE = https://01.org/sites/default/files/downloads
-POWERTOP_SOURCE = powertop-v$(POWERTOP_VERSION)-1-g7ef7f79.tar.gz
 POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES)
 POWERTOP_LICENSE = GPL-2.0
