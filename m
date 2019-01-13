From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 22:27:26 +0100
Subject: [Buildroot] [git commit] packag/fdk-aac: enable for aarch64
Message-ID: <20190113214626.DD69B8CA73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb6bbdb39673862dc34458b9849b1765f6c94b54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for this architecture was added in upstream commit
1d686c3a23f3ae286ef964ab62199be96e4ad1dc.

Take this opportunity to reformat how the
BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS option is described.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
[Thomas: reformat BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fdk-aac/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
index 111de41ca4..26e060b93d 100644
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -1,9 +1,12 @@
 # These are the architectures supported by FDK AAC
 config BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
 	bool
-	default y if BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
-		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		BR2_powerpc || BR2_sh
+	default y if BR2_aarch64
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc
+	default y if BR2_sh
 
 config BR2_PACKAGE_FDK_AAC
 	bool "fdk-aac"
