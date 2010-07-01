From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Jul 2010 17:33:29 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile.package.in: allow
	packages to override download step
Message-ID: <20100701153712.9DCD6821E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=48cf66f1a2e2c501abeee98b7a2268b0d6d2010d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

E.G. for checkout from version control instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 16ce16a..c476de9 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -292,7 +292,7 @@ $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
-$(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
+$(2)_TARGET_SOURCE ?=		$$($(2)_DIR)/.stamp_downloaded
 $(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
-- 
1.7.1
