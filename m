From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 May 2016 21:51:24 +0200
Subject: [Buildroot] [git commit] x264: needs madvise(),
	disable for bfin external toolchain
Message-ID: <20160502195405.4704A802F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63cd7b84a331dcba7c53a375cc33f53b6b48474a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

x264 uses madvise() which is not available in the bfin external toolchain.

Fixes:
http://autobuild.buildroot.net/results/837/837fd5a63d59b5c65818ec005a565cb7741a1cdd/

[Peter: Issue is specific to bfin toolchain, so only disable for that one]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x264/Config.in b/package/x264/Config.in
index be3ab3f..7bf2319 100644
--- a/package/x264/Config.in
+++ b/package/x264/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_X264
 	bool "x264"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX # madvise()
 	help
 	  x264 is a free software library and application for
 	  encoding video streams into the H.264/MPEG-4 AVC
