From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Apr 2014 23:47:31 +0200
Subject: [Buildroot] [git commit] gcc: arc: bump to arc-4.8-R3 release
Message-ID: <20140429223019.D460F9CA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e94c5210fedb40424d6675faa9c015889553f87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes several internal compiler errors including:
http://autobuild.buildroot.net/results/2858bb1ca1d12955c837da5a8b7d69c587a75646/
http://autobuild.buildroot.net/results/85deef67654019a630d6cbc37f3dbbbc071aad38/

Support for the GCC built-in atomic functions is also added and is enabled
with option -matomic. Atomic built-ins require LLOCK/SCOND instructions to
be enabled in the ARC 700 CPU.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6c2f753..2fe5ca5 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -98,7 +98,7 @@ config BR2_GCC_VERSION
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.0"     if BR2_GCC_VERSION_4_9_X
-	default "c6227bc154124e270f15793deddfa3fe18f7db54" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-4.8-R3" if BR2_GCC_VERSION_4_8_ARC
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
