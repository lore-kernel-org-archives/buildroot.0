From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] libglade: convert old-style
	hook to new-style hook
Message-ID: <20100916113821.B48648AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=428b533655e3f134b5cfeb40948360eab968d50c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglade/libglade.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 31a579e..67e621b 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -9,9 +9,11 @@ LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/
 LIBGLADE_INSTALL_STAGING = YES
 LIBGLADE_DEPENDENCIES = host-pkg-config libglib2 libgtk2 atk libxml2
 
-$(eval $(call AUTOTARGETS,package,libglade))
-
-$(LIBGLADE_HOOK_POST_INSTALL):
+define LIBGLADE_INSTALL_FIX
 	rm -rf $(TARGET_DIR)/usr/share/xml/libglade \
 	       $(TARGET_DIR)/usr/bin/libglade-convert
-	touch $@
+endef
+
+LIBGLADE_POST_INSTALL_TARGET_HOOKS += LIBGLADE_INSTALL_FIX
+
+$(eval $(call AUTOTARGETS,package,libglade))
-- 
1.7.1
