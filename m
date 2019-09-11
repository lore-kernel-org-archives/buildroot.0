From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Sep 2019 19:22:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/kompexsqlite: fixup the 'v' prefix
 in the version
Message-ID: <20190911172256.30003-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for the kompexsqlite version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
KOMPEXSQLITE_SOURCE and not KOMPEXSQLITE_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.23.0.rc1
