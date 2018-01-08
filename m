From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 20:57:25 +0100
Subject: [Buildroot] [git commit] tcf-agent: disable package for powerpc64
Message-ID: <20180108195747.3B59783574@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6067889352887f38d0fcbbb0b269dd8de1bba0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fails to build, disable powerpc64 until upstream fixed it

Fixes:
  http://autobuild.buildroot.net/results/5088f6efd44ce9b081c2c7825a7005a9cb60799d

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcf-agent/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index d2a05d0..9cd2831 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -28,8 +28,8 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
 	default "i386"       if BR2_i386 && !BR2_ARCH="i686"
 	default "x86_64"     if BR2_x86_64
 	default "powerpc"    if BR2_powerpc || BR2_powerpcle
-	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
-#	fails to build currently
+#	those architectures fail to build currently
+#	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
 #	default "microblaze" if BR2_microblaze || BR2_microblazeel
 
 config BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS
