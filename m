From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 10:14:17 +0200
Subject: [Buildroot] [git commit] ltrace: disable on mips/mipsel
Message-ID: <20140815090111.3BC909D3E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfaa18af00dfcff71a0159adaafb0880e58fa6a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ltrace currently doesn't build on mips/mipsel, and it's an upstream
issue that has been reported. Until it get fixed, let's disable ltrace
for mips/mipsel.

Fixes:

  http://autobuild.buildroot.org/results/43a/43a8fc7075f52eab74ebfee4c9f25dd2b886e75e/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltrace/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 4d1acfa..8cabfa2 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
-	depends on (BR2_i386 || BR2_arm || BR2_mips || BR2_mipsel \
+	# ltrace normally has mips/mipsel support, but it's currently
+	# broken (error: 'struct ltelf' has no member named
+	# 'relplt_count'). Issue reported upstream at
+	# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=756764.
+	depends on (BR2_i386 || BR2_arm \
 		|| BR2_powerpc || BR2_sparc || BR2_x86_64)
 	select BR2_PACKAGE_LIBELF
 	select BR2_PACKAGE_ELFUTILS
