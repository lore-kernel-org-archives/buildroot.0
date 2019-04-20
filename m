From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 22:15:37 +0200
Subject: [Buildroot] [git commit] package/lrzsz: fix build with NLS
Message-ID: <20190420201216.43B4D8E66E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3229cd16bdc4eaedd4e6d1087d804b8093b12d5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/77e3ea00ca2c20d9fe284d31bbdf2b72956eae9f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lrzsz/lrzsz.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 25ecf3dead..6c68232852 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -9,6 +9,8 @@ LRZSZ_SITE = http://www.ohse.de/uwe/releases
 LRZSZ_CONF_OPTS = --disable-timesync
 LRZSZ_LICENSE = GPL-2.0+
 LRZSZ_LICENSE_FILES = COPYING
+LRZSZ_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+LRZSZ_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 define LRZSZ_POST_CONFIGURE_HOOKS
 	$(SED) "s/-lnsl//;" $(@D)/src/Makefile
