From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 00:05:52 +0100
Subject: [Buildroot] [git commit] binutils: enable poison system directories
	option
Message-ID: <20141210230619.73BD27FA91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2621ff3bed651697cc2fd4e86538f7c528c7409c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit enables the poison system directories option, which is now
available thanks to the binutils patches that have been added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
---
 package/binutils/binutils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index b8dab5d..9a9bb94 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -68,6 +68,7 @@ HOST_BINUTILS_CONF_OPTS = --disable-multilib --disable-werror \
 			--target=$(GNU_TARGET_NAME) \
 			--disable-shared --enable-static \
 			--with-sysroot=$(STAGING_DIR) \
+			--enable-poison-system-directories \
 			$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
