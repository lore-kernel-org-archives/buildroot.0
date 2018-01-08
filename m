From: Norbert Lange <nolange79@gmail.com>
Date: Mon,  8 Jan 2018 14:40:45 +0100
Subject: [Buildroot] [PATCH 1/1] tcf-agent: disable package for powerpc64
Message-ID: <20180108134045.12578-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fails to build, disable powerpc64 until upstream fixed it

Fixes:
  http://autobuild.buildroot.net/results/5088f6efd44ce9b081c2c7825a7005a9cb60799d

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/tcf-agent/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index d2a05d0974..8932157d86 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -28,8 +28,8 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
 	default "i386"       if BR2_i386 && !BR2_ARCH="i686"
 	default "x86_64"     if BR2_x86_64
 	default "powerpc"    if BR2_powerpc || BR2_powerpcle
-	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
 #	fails to build currently
+#	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
 #	default "microblaze" if BR2_microblaze || BR2_microblazeel
 
 config BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS
-- 
2.15.1
