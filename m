From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Nov 2010 17:22:51 +0100
Subject: [Buildroot] [git commit master 1/1] linux: update paths to compiled
	cpio files
Message-ID: <20101117162314.5ED9F8E964@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f80fdd2a33aaeffb46bcbe41f8106eb0cb18c5b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linux has been using "usr/initramfs_data.cpio" for a few releases as the
generated cpio name, so the buildroot match of "...cpio.*" won't actually
clean out the previous result.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7f7bb05..8dc7dd0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -147,7 +147,7 @@ $(LINUX26_DIR)/.stamp_initramfs_rebuilt: $(LINUX26_DIR)/.stamp_installed $(BINAR
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Remove the previously generated initramfs which was empty,
 	# to make sure the kernel will actually regenerate it.
-	$(RM) -f $(@D)/usr/initramfs_data.cpio.*
+	$(RM) -f $(@D)/usr/initramfs_data.cpio*
 	# Build the kernel.
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_IMAGE_NAME)
 	# Copy the kernel image to its final destination
-- 
1.7.1
