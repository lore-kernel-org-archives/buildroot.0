From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 Jan 2011 21:11:36 +0100
Subject: [Buildroot] [git commit master 1/1] sshfs: adjust make dependencies
	to match Kconfig
Message-ID: <20110124210028.CE91C8D210@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eef3d90998441d060785366d27f0080bbfc9e9c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Spotted by Thomas, thanks.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sshfs/sshfs.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 816f77a..ae837bb 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -7,6 +7,9 @@
 SSHFS_VERSION = 2.2
 SSHFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/$(SSHFS_VERSION)/sshfs-fuse
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
-SSHFS_DEPENDENCIES = libglib2 libfuse $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+SSHFS_DEPENDENCIES = \
+	libglib2 libfuse openssh \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
 $(eval $(call AUTOTARGETS,package,sshfs))
-- 
1.7.3.4
