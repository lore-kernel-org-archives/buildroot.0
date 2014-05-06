From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 May 2014 07:42:44 -0300
Subject: [Buildroot] [PATCH] toolchain/buildroot: default to uClibc
Message-ID: <1399372964-7973-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise we're getting musl for everything except those who have a
default (mips64*).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 1bd3f92..216f9db 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -22,6 +22,7 @@ source "package/linux-headers/Config.in.host"
 
 choice
 	prompt "C library"
+	default BR2_TOOLCHAIN_UCLIBC
 	default BR2_TOOLCHAIN_BUILDROOT_EGLIBC if BR2_mips64 || BR2_mips64el
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
-- 
1.8.5.5
