From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 17:20:39 +0200
Subject: [Buildroot] [git commit] mono: disable for sparc/sparc64
Message-ID: <20160424152044.64D13818DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9844d1b6aa0bad0a038f1b9a974883fd3e07c28c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems mono isn't supported for sparc32, see configure.ac
for some comments about it. Tried with sparc64, but this
doesn't compile either.
So disable for sparc for now.

Fixes following autobuild issues:
http://autobuild.buildroot.org/?reason=mono-4.2.2.30

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
