From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 00:05:52 +0100
Subject: [Buildroot] [git commit] gcc: enable poison system directories
	option
Message-ID: <20141210230619.6B24E7FA91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e0900c04c6810b6d9001cfde8a63348876bbd7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit enables the poison system directories option, which is now
available thanks to the gcc patches that have been added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
---
 package/gcc/gcc-final/gcc-final.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 46ef5c6..958b445 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -50,6 +50,7 @@ HOST_GCC_FINAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
 	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
 	$(DISABLE_LARGEFILE) \
+	--enable-poison-system-directories \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
 # Disable shared libs like libstdc++ if we do static since it confuses linking
