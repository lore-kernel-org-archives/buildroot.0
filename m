From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Nov 2015 00:18:39 +0100
Subject: [Buildroot] [PATCH 3/3] nodejs: version 4.X needs host GCC >= 4.8
In-Reply-To: <1448147919-5463-1-git-send-email-arnout@mind.be>
References: <1448147919-5463-1-git-send-email-arnout@mind.be>
Message-ID: <1448147919-5463-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/3fd1d18f0535bb8b969f808a5837c4a8111e69b9
http://autobuild.buildroot.org/results/72b80a434547931e1deb6f0ba793a6d68accc9a2

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nodejs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5128901..992e7a8 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -51,10 +51,12 @@ config BR2_BR2_PACKAGE_NODEJS_0_12_X
 config BR2_BR2_PACKAGE_NODEJS_4_X
 	bool "v4.1.2"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "v4.1.2 needs a toolchain w/ gcc >= 4.8"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 endchoice
-- 
2.6.2
