From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 23 Apr 2017 00:49:16 +0200
Subject: [Buildroot] [PATCH v9 4/7] e2fsprogs: add explicit
	--enable/--disable configure options
In-Reply-To: <20170422224919.3257-1-arnout@mind.be>
References: <20170422224919.3257-1-arnout@mind.be>
Message-ID: <20170422224919.3257-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Arnout: don't split up the fuse2fs CONF_OPTS and DEPENDENCIES
 handling]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/e2fsprogs.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 632fdc250c..a60c69b395 100644
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
-- 
2.11.0
