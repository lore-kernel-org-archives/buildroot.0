From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 18:35:19 -0300
Subject: [Buildroot] [PATCH 1/2] toolchain/buildroot: default to glibc where
	possible/convenient
Message-ID: <1425418520-23282-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Default to glibc over eglibc where it's possible and/or convenient.
Since the eglibc project is basically gone and merged with glibc it
doesn't make sense to keep defaulting to it for architectures that
aren't uClibc-capable.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-buildroot/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 1b9f3a3..d4e3bcc 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -23,7 +23,8 @@ source "package/linux-headers/Config.in.host"
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_UCLIBC
-	default BR2_TOOLCHAIN_BUILDROOT_EGLIBC if BR2_mips64 || BR2_mips64el
+	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_aarch64 || BR2_microblaze \
+		|| BR2_mips64 || BR2_mips64el || BR2_powerpc64
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
-- 
2.0.5
