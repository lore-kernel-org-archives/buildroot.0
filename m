From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:26:51 +0100
Subject: [Buildroot] [git commit] package/pcm-tools: fix build with GCC 4.8.2
Message-ID: <20181216153346.4984D84333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3be4e5532f0fa798bddbfe28f17a67ef9d338c0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add "-std=c++11" to CXXFLAGS, forcing C++ 2011 standard (it's
experimental in GCC 4.8.2 but goot enough to build pcm-tools).

Fixes:

  http://autobuild.buildroot.net/results/cf3c79f0c94be8a184d532570bdb1893090316a3/

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcm-tools/pcm-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index c0d6d8bc52..6d5938f94e 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -16,6 +16,7 @@ PCM_TOOLS_EXE_FILES = \
 define PCM_TOOLS_BUILD_CMDS
 	touch $(@D)/daemon-binaries
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
 		UNAME=Linux HOST=_LINUX
 endef
 
