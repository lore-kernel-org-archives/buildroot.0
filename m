From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 Feb 2012 20:52:06 +0100
Subject: [Buildroot] [git commit branch/next] e2fsprogs: disable build of
	e4defrag unless explicitly enabled
Message-ID: <20120228205411.DB4C590BB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8255618956eb8e4ed259d98aa3865510288b182
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The e2fsprogs configure script enables the build of the e4defrag
utility by default. Disable it unless BR2_PACKAGE_E2FSPROGS_E4DEFRAG
is selected.

Also the --disable-blkid option is not recognized by the configure
script. Use --disable-libblkid instead.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 912deab..f3d44f6 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -12,9 +12,10 @@ E2FSPROGS_CONF_OPT = \
 	--enable-elf-shlibs \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
 	--disable-uuidd \
-	--disable-blkid \
+	--disable-libblkid \
 	--disable-libuuid \
 	--enable-fsck \
 	--disable-e2initrd-helper \
