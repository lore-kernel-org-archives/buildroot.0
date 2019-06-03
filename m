From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jun 2019 08:12:49 +0200
Subject: [Buildroot] [git commit] package/busybox: add dependency on
 dosfstools
Message-ID: <20190603061321.391DD8D793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca42df21110b5e32f76caea8d1664bdbf213be76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dosfstools and busybox may each install mkfs.vfat, so dosfstools must
be installed before busybox.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 67b91500e9..e606068a90 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -32,6 +32,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_DEBIANUTILS),debianutils) \
 	$(if $(BR2_PACKAGE_DIFFUTILS),diffutils) \
 	$(if $(BR2_PACKAGE_DOS2UNIX),dos2unix) \
+	$(if $(BR2_PACKAGE_DOSFSTOOLS),dosfstools) \
 	$(if $(BR2_PACKAGE_E2FSPROGS),e2fsprogs) \
 	$(if $(BR2_PACKAGE_FBSET),fbset) \
 	$(if $(BR2_PACKAGE_GAWK),gawk) \
