From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Jun 2019 18:06:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjdk: needs host-gawk
Message-ID: <20190601160620.15220-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/bb1bb1cf8b58bf28039186866ed01521114acb72

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openjdk/openjdk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index b59e26778f..318e4bade3 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -14,6 +14,7 @@ OPENJDK_LICENSE_FILES = LICENSE
 # OpenJDK requires Alsa, cups, and X11 even for a headless build.
 # host-zip is needed for the zip executable.
 OPENJDK_DEPENDENCIES = \
+	host-gawk \
 	host-openjdk-bin \
 	host-pkgconf \
 	host-zip \
-- 
2.20.1
