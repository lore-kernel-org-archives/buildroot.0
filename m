From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Sep 2019 16:02:02 +0200
Subject: [Buildroot] [git commit] package/kompexsqlite: fixup the 'v' prefix
 in the version
Message-ID: <20190914135746.D8BB38E069@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=047f4bf128558ad64bfa65173bf2c24c565a86ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for the kompexsqlite version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
KOMPEXSQLITE_SOURCE and not KOMPEXSQLITE_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kompexsqlite/kompexsqlite.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kompexsqlite/kompexsqlite.mk b/package/kompexsqlite/kompexsqlite.mk
index 51b80aa86b..92a4ddc22a 100644
--- a/package/kompexsqlite/kompexsqlite.mk
+++ b/package/kompexsqlite/kompexsqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KOMPEXSQLITE_VERSION = v1.10.12-1
-KOMPEXSQLITE_SOURCE = $(KOMPEXSQLITE_VERSION).tar.gz
+KOMPEXSQLITE_VERSION = 1.10.12-1
+KOMPEXSQLITE_SOURCE = v$(KOMPEXSQLITE_VERSION).tar.gz
 KOMPEXSQLITE_SITE = https://github.com/Aethelflaed/kompex-sqlite-wrapper/archive
 KOMPEXSQLITE_INSTALL_STAGING = YES
 KOMPEXSQLITE_LICENSE = LGPL-3.0+ (wrapper), Public Domain (bundled sqlite)
