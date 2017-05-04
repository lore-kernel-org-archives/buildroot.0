From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:32:42 +0200
Subject: [Buildroot] [git commit] e2fsprogs: add explicit --enable/--disable
	configure options
Message-ID: <20170504203649.20DDA80300@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ae2a571381b849334b27a2b063705834c292367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Arnout: don't split up the fuse2fs CONF_OPTS and DEPENDENCIES
 handling]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 632fdc2..a60c69b 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -40,12 +40,12 @@ HOST_E2FSPROGS_CONF_OPTS = \
 E2FSPROGS_CONF_OPTS = \
 	--bindir=/bin \
 	--sbindir=/sbin \
-	$(if $(BR2_STATIC_LIBS),,--enable-elf-shlibs) \
-	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
-	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
-	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
+	$(if $(BR2_STATIC_LIBS),--disable-elf-shlibs,--enable-elf-shlibs) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),--enable-debugfs,--disable-debugfs) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),--enable-imager,--disable-imager) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),--enable-defrag,--disable-defrag) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_FSCK),--enable-fsck,--disable-fsck) \
-	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),--enable-resizer,--disable-resizer) \
 	--disable-uuidd \
 	--disable-libblkid \
 	--disable-libuuid \
