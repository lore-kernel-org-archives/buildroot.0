From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 22 Feb 2014 23:33:30 +0100
Subject: [Buildroot] [PATCH] binutils: install libiberty
Message-ID: <1393108410-9568-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages (actually, just oprofile) need to link against libiberty.
This option just installs libiberty.a so it has no effect on the target,
therefore it's not needed to add a config option for it.

Before binutils-2.24, there was a bug in libiberty/Makefile.in that
caused libiberty to be installed regardless of the
--enable-install-libiberty option. This problem wasn't noticed before
because binutils-2.24 is not selected on any of the autobuilders: the
version can only be selected if an internal toolchain is used, and it
defaults to 2.21.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d6828f5..b5a2dc7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -51,6 +51,7 @@ endif
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 		--host=$(GNU_TARGET_NAME) \
 		--target=$(GNU_TARGET_NAME) \
+		--enable-install-libiberty \
 		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # Install binutils after busybox to prefer full-blown utilities
-- 
1.9.0
