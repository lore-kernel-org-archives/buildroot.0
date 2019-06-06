From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 22:26:51 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/busybox: add
 dependency on dosfstools
Message-ID: <20190606202959.01FF38122B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2080a2f2f39cf0d1cbe761105dbfd7766a5b2aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

dosfstools and busybox may each install mkfs.vfat, so dosfstools must
be installed before busybox.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ca42df21110b5e32f76caea8d1664bdbf213be76)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5c5a8ea839..179af6aea3 100644
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
