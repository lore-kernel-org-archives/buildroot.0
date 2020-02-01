From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 10:27:21 +0100
Subject: [Buildroot] [git commit] package/file: add xz optional dependency
Message-ID: <20200201091708.7CA6E867D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e70be6d290a157897d2d9335991f99e967013d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xz is an optional dependency since version 5.38 and
https://github.com/file/file/commit/b259a07ea95827f565faa20f0316e5b2704064f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/file/file.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index 3ae7c85976..8d0968e6b2 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -21,5 +21,12 @@ else
 FILE_CONF_OPTS += --disable-libseccomp
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+FILE_CONF_OPTS += --enable-xzlib
+FILE_DEPENDENCIES += xz
+else
+FILE_CONF_OPTS += --disable-xzlib
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
