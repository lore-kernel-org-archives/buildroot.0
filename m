From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Nov 2014 20:53:56 +0100
Subject: [Buildroot] [git commit] x264: disable opencl support
Message-ID: <20141119195652.C9FDE7F89A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7450386ae9b6d48bf13d1d8a9853b50d9e767c28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't have anything providing opencl support in Buildroot, so this is
just dead code.  More importantly, it uses dlopen so it breaks on completely
static configurations.

Fixes:
http://autobuild.buildroot.net/results/51b/51bd1464fe85f3fcdc5beb095cb1cdbfa413ec24/
http://autobuild.buildroot.net/results/694/694032b21c386c9eb50ba76aa32428bcd5cf9214/
http://autobuild.buildroot.net/results/097/0979f12e50d2413c702147408572b01e6bc700f2/
http://autobuild.buildroot.net/results/d9c/d9c46ca92bc349b42673a60f1b66d6df99d26545/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/x264.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 1846f04..7060ac1 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -42,6 +42,7 @@ define X264_CONFIGURE_CMDS
 		--cross-prefix="$(TARGET_CROSS)" \
 		--disable-ffms \
 		--enable-static \
+		--disable-opencl \
 		$(X264_CONF_OPTS) \
 	)
 endef
