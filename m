From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 23:18:25 +0100
Subject: [Buildroot] [git commit] pkg-infra: fix missing 3993 for
	AUTOTARGET's SUBDIR
Message-ID: <20120122222047.38D1690358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0252d7e39bd8c0b536c53f018661cb56cefb9f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure <pkg>_SUBDIR gets resolved late, so that E.G. the default values
for host packages are taken into consideration.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 0f9b2c6..64e0730 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -93,7 +93,7 @@ $(2)_CLEAN_OPT			?= clean
 $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
 $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
 
-$(2)_SRCDIR                     = $$($(2)_DIR)/$($(2)_SUBDIR)
+$(2)_SRCDIR                     = $$($(2)_DIR)/$$($(2)_SUBDIR)
 
 #
 # Configure step. Only define it if not already defined by the package
