From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 22:48:10 +0100
Subject: [Buildroot] [PATCH 2/9] package/znc: drop cmake workaround
In-Reply-To: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
References: <20210125214817.1177142-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125214817.1177142-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop workaround for cmake < 3.10 (not needed since commit
d4773b610a40be1d3ac7d793033abaf4eb2491ed)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/znc/znc.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 52a8d78aeb..07fced8407 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -12,11 +12,6 @@ ZNC_CPE_ID_VENDOR = znc
 ZNC_DEPENDENCIES = host-pkgconf
 ZNC_CONF_OPTS = -DWANT_CYRUS=OFF -DWANT_I18N=OFF -DWANT_PERL=OFF
 
-# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
-# disable a try_run() call in the FindThreads tests, which caused a
-# build failure when cross-compiling.
-ZNC_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
-
 ifeq ($(BR2_PACKAGE_ICU),y)
 ZNC_DEPENDENCIES += icu
 ZNC_CONF_OPTS += -DWANT_ICU=ON
-- 
2.29.2
