From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Aug 2014 15:06:44 +0200
Subject: [Buildroot] [PATCH 11/12] binutils: enable poison system
	directories option
In-Reply-To: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1408540005-26934-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit enables the poison system directories option, which is now
available thanks to the binutils patches that have been added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 4888eeb..ecbd40d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -72,6 +72,7 @@ HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 			--target=$(GNU_TARGET_NAME) \
 			--disable-shared --enable-static \
 			--with-sysroot=$(STAGING_DIR) \
+			--enable-poison-system-directories \
 			$(BINUTILS_DISABLE_GDB_CONF_OPT) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
-- 
2.0.0
