From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:03:04 +0200
Subject: [Buildroot] [git commit] package/znc: fix build with cmake < 3.10
Message-ID: <20191002185903.BBA9B81476@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30fc06f6a8b54b853a26290a6a0c74435ac4956e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/991dd1d74f00f027a905d2ec3ad1a1b2b723f978

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/znc/znc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 78e1410b68..54dc63f4ea 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -11,6 +11,11 @@ ZNC_LICENSE_FILES = LICENSE
 ZNC_DEPENDENCIES = host-pkgconf
 ZNC_CONF_OPTS = -DWANT_CYRUS=OFF -DWANT_I18N=OFF -DWANT_PERL=OFF
 
+# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
+# disable a try_run() call in the FindThreads tests, which caused a
+# build failure when cross-compiling.
+ZNC_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
+
 ifeq ($(BR2_PACKAGE_ICU),y)
 ZNC_DEPENDENCIES += icu
 ZNC_CONF_OPTS += -DWANT_ICU=ON
