From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Fri, 17 Sep 2010 14:09:48 +0200
Subject: [Buildroot] [git commit master 1/1] Revert "Makefile.package.in:
	allow packages to override download step"
Message-ID: <20100917121200.6ADB88B3CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1475384413f2db15bceb69c8c56454319c3ce5e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 48cf66f1a2e2c501abeee98b7a2268b0d6d2010d.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 6f584a7..58b417b 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -402,7 +402,7 @@ $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
-$(2)_TARGET_SOURCE ?=		$$($(2)_DIR)/.stamp_downloaded
+$(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
 $(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
-- 
1.7.1
