From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Nov 2011 17:31:17 +0000
Subject: [Buildroot] [PATCH] clean-for-rebuild: also remove images_installed
	stamp
Message-ID: <1321378277-5625-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Without this, a linux-rebuild or bootloader-rebuild will not install
the rebuilt image in the images directory.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.package.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index b5ef57b..bd9ceb5 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -603,6 +603,7 @@ endif
 			rm -f $$($(2)_TARGET_BUILD)
 			rm -f $$($(2)_TARGET_INSTALL_STAGING)
 			rm -f $$($(2)_TARGET_INSTALL_TARGET)
+			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 			rm -f $$($(2)_TARGET_INSTALL_HOST)
 
 $(1)-rebuild:		$(1)-clean-for-rebuild all
-- 
1.7.7.2
