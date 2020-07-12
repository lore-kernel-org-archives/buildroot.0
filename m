From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Jul 2020 23:32:05 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/xvisor: needs host-dtc
Message-ID: <20200712213205.64850-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-dtc is a mandatory dependency since version 0.3.0 and
https://github.com/xvisor/xvisor/commit/e31344c9b5835c8a12bfffb3a359f343b273fab5

Fixes:
 - http://autobuild.buildroot.org/results/3f49302e7d05d666a51db0cb51365620a63e3b40

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add link on autobuilder failure

 package/xvisor/xvisor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index fe3ec05855..394ff7c80b 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -11,7 +11,7 @@ XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
 XVISOR_INSTALL_IMAGES = YES
 XVISOR_INSTALL_TARGET = NO
-XVISOR_DEPENDENCIES = host-bison host-flex
+XVISOR_DEPENDENCIES = host-bison host-dtc host-flex
 
 XVISOR_MAKE_TARGETS = all
 
-- 
2.27.0
