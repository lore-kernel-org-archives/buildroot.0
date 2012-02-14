From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Feb 2012 23:30:55 +0100
Subject: [Buildroot] [git commit] mxml: Use correct paths when installing
	into staging.
Message-ID: <20120214223534.42ED290A9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d54dc133e19051c24c58b327eda6b9f496f876e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DSTROOT option passed for the staging install would install
into the target directory, which is not what was intended.

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mxml/mxml.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index fb73670..c05c3a7 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -7,9 +7,9 @@ MXML_VERSION = 2.6
 MXML_SITE = http://ftp.easysw.com/pub/mxml/2.6
 MXML_INSTALL_STAGING = YES
 
-MXML_INSTALL_STAGING_OPT = DSTROOT=$(TARGET_DIR) install
+MXML_INSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) install
 MXML_INSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) install
-MXML_UNINSTALL_STAGING_OPT = DSTROOT=$(TARGET_DIR) uninstall
+MXML_UNINSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) uninstall
 MXML_UNINSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) uninstall
 
 $(eval $(call AUTOTARGETS))
