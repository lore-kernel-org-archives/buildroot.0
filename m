From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 11:04:14 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/libraw: needs
 autoreconf
Message-ID: <20201103095148.4DB3E81133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a27f6cb5f4454e3b4d7ebf50120124554e01c1b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

configure is older than configure.ac in official libraw 0.20.2 tarball:
https://github.com/LibRaw/LibRaw/issues/353

Fixes:
 - http://autobuild.buildroot.org/results/abef2ac14a959093a6391cad28e738558e15ceec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 082d0fea3deab17634a6b29e80579417440a6181)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libraw/libraw.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index acfa4dbe37..7f79000fd3 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -14,6 +14,8 @@ LIBRAW_CONF_OPTS += \
 LIBRAW_LICENSE = LGPL-2.1 or CDDL-1.0
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL README.md
 LIBRAW_DEPENDENCIES = host-pkgconf
+# https://github.com/LibRaw/LibRaw/issues/353
+LIBRAW_AUTORECONF = YES
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
 
