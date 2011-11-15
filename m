From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Nov 2011 20:54:53 +0100
Subject: [Buildroot] [git commit] clean-for-rebuild: also remove
	images_installed stamp
Message-ID: <20111115195517.793CA8F533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6fb91bf7ae609f9690e89c77902d0daf7687c3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this, a linux-rebuild or bootloader-rebuild will not install
the rebuilt image in the images directory.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
