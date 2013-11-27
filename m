From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Nov 2013 15:09:26 -0300
Subject: [Buildroot] [PATCH 1/3] toolchain/buildroot: default to eglibc for
	mips64
Message-ID: <1385575768-21670-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc only works well for O32 ABI on mips64, so default to eglibc that
works just fine with N32 & N64 ABIs as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 81593f1..94df0ff 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -5,6 +5,7 @@ source "package/linux-headers/Config.in.host"
 
 choice
 	prompt "C library"
+	default BR2_TOOLCHAIN_BUILDROOT_EGLIBC if BR2_mips64 || BR2_mips64el
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
-- 
1.8.3.2
