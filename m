From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 19:24:43 +0200
Subject: [Buildroot] [git commit] ltrace: remove bogus comment in Config.in
 file
Message-ID: <20180520172349.E2C14812D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f711e71c21f23c98d56ec8ea8a1778f049a2d1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit dfaa18af00dfcff71a0159adaafb0880e58fa6a1 ("ltrace: disable
on mips/mipsel"), ltrace was disabled on mips/mipsel due to build
issues, and a comment was added in the Config.in file to explain that
even though ltrace has mips/mipsel support, it isn't enabled because
it doesn't build.

Then, in commit d23cce19c299e3010ba2dca84ab4ad35eff3cdbb ("ltrace:
enable for mips/mipsel"), the build of ltrace on mips/mipsel was
re-enabled, because it has been fixed upstream.

However, the comment in the Config.in comment was not removed in this
commit. Due to this, we have a comment that says "we don't allow
enabling ltrace on mips/mipsel" and the line right below precisely
allows to enable ltrace on mips/mipsel.

Fix this inconsistency by removing the no longer valid comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ltrace/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 4d5fb723d6..3a46b6a4f6 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -3,10 +3,6 @@ config BR2_PACKAGE_LTRACE
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
-	# ltrace normally has mips/mipsel support, but it's currently
-	# broken (error: 'struct ltelf' has no member named
-	# 'relplt_count'). Issue reported upstream at
-	# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=756764.
 	depends on (BR2_i386 || BR2_arm || BR2_mips || BR2_mipsel \
 		|| BR2_powerpc || BR2_sparc || BR2_x86_64 || BR2_xtensa)
 	select BR2_PACKAGE_ELFUTILS
