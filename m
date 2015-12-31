From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 10:36:33 +0100
Subject: [Buildroot] [git commit] nodejs: version 5.X needs host GCC >= 4.8
Message-ID: <20151231093641.8B58B8275D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f6093ae7637f1c9f56f0db07e2ee85dabb075f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/4589dd076585d6472ad1e65926ffe68343b94422
http://autobuild.buildroot.org/results/e3147c0d9c9eb9f58773b75c8cb4ea49df483611
and many more.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 008fbbf..3dfccac 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -48,12 +48,14 @@ config BR2_PACKAGE_NODEJS_0_10_X
 config BR2_PACKAGE_NODEJS_5_X
 	bool "v5.3.0"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_USE_WCHAR
 
 comment "v5.3.0 needs a toolchain w/ gcc >= 4.8, wchar"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 
 endchoice
 
