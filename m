From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 24 Apr 2016 15:51:26 +0200
Subject: [Buildroot] [PATCH] mono: disable for sparc/sparc64
Message-ID: <20160424135125.GA8887@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems mono isn't supported for sparc32, see configure.ac
for some comments about it. Tried with sparc64, but this
doesn't compile either.
So disable for sparc for now.

Fixes following autobuild issues:
http://autobuild.buildroot.org/?reason=mono-4.2.2.30

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/mono/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index cf18a03..d45ad37 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
-		      BR2_mipsel || BR2_powerpc || BR2_sparc || BR2_x86_64)
+		      BR2_mipsel || BR2_powerpc || BR2_x86_64)
 
 config BR2_PACKAGE_MONO
 	bool "mono"
-- 
2.1.4
