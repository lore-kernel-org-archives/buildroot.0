From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 16:16:03 +0100
Subject: [Buildroot] [git commit] flex: needs host-m4
Message-ID: <20130324151610.A10AE9B26D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50bcee6ad5dd2aab273f6a055367ca2c232598f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/9f5c2ad2b3d268dd82985a3a386530a12e5681ef/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/flex.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 834f0b5..59551f2 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -10,9 +10,9 @@ FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext)
+	$(if $(BR2_PACKAGE_GETTEXT),gettext) host-m4
 # we don't have a host-gettext/libintl
-HOST_FLEX_DEPENDENCIES =
+HOST_FLEX_DEPENDENCIES = host-m4
 
 ifeq ($(BR2_PACKAGE_FLEX_BINARY),y)
 # lex -> flex
