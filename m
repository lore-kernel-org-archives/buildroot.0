From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Oct 2020 07:25:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: fix host build
Message-ID: <20201001052550.106879-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 52c5c6050c5359288ca48c85024aebd169fab258 disabled debuginfod on
target but not on host resulting in the following build failure:

configure: error: dependencies not found, use --disable-libdebuginfod to disable or --enable-libdebuginfod=dummy to build a (bootstrap) dummy library.

Fixes:
 - http://autobuild.buildroot.org/results/97713c7e281313826067af559337832f22c3cb09

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/elfutils/elfutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 3615a16cd0..28f86c2fab 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -50,6 +50,7 @@ endif
 
 # disable for now, needs "distro" support
 ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
+HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
 
 ELFUTILS_CONF_ENV += \
 	LDFLAGS="$(ELFUTILS_LDFLAGS)"
-- 
2.28.0
