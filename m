From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 10:27:32 +0100
Subject: [Buildroot] [git commit] package/file: add bzip2 optional dependency
Message-ID: <20200201091708.8E53C866E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adf8751a4836d1bfba18776ced2dbfd57c6506b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bzip2 is an optional dependency since version 5.38 and
https://github.com/file/file/commit/b259a07ea95827f565faa20f0316e5b2704064f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/file/file.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index 8d0968e6b2..ffa8b8b905 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -14,6 +14,13 @@ FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 HOST_FILE_CONF_OPTS = --disable-libseccomp
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+FILE_CONF_OPTS += --enable-bzlib
+FILE_DEPENDENCIES += bzip2
+else
+FILE_CONF_OPTS += --disable-bzlib
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 FILE_CONF_OPTS += --enable-libseccomp
 FILE_DEPENDENCIES += libseccomp
