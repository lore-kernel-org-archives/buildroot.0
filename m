From: Martin Hicks <mort@bork.org>
Date: Tue, 1 Feb 2011 20:53:05 +0100
Subject: [Buildroot] [git commit master 1/1] Enable ccache for kernel compile
Message-ID: <20110201203534.882F28EE4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d10e46fb7623673b590faac2a90dccea475a7e3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just needed to pass in ccache as a prefix to the CROSS_TARGET variable.

Signed-off-by: Martin Hicks <mort@bork.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d3c06db..2bc2efe 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -23,7 +23,7 @@ LINUX26_MAKE_FLAGS = \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
-	CROSS_COMPILE=$(TARGET_CROSS) \
+	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	LZMA="$(LZMA)"
 
 # Get the real Linux version, which tells us where kernel modules are
-- 
1.7.3.4
