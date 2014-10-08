From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Oct 2014 22:00:11 +0200
Subject: [Buildroot] [PATCH] botan: add type to
	BR2_PACKAGE_BOTAN_ARCH_SUPPORTS option
Message-ID: <1412798411-18889-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 1737af367993326ee47e847bd755806c8a78ced8 ('botan: limit to
supported CPU architectures') introduced the
BR2_PACKAGE_BOTAN_ARCH_SUPPORTS with a default value, but forgot to
define a type, which leads to a kconfig warning:

  package/botan/Config.in:1:warning: config symbol defined without type

This commit fixes that by properly setting the type.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/botan/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index b9e2e3a..dc9aa05 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	bool
 	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k    || \
 		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		BR2_powerpc || BR2_powerpc64 || BR2_sparc || BR2_sh  || \
-- 
2.0.0
