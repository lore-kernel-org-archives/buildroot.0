From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  1 Dec 2014 22:55:12 +0100
Subject: [Buildroot] [PATCHv2 11/12] binutils: enable poison system
	directories option
In-Reply-To: <1417470913-1280-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470913-1280-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417470913-1280-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit enables the poison system directories option, which is now
available thanks to the binutils patches that have been added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

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
 
-- 
2.1.0
