From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 23:04:14 +0100
Subject: [Buildroot] [git commit] package/brltty: depends on BR2_USE_MMU due
 to calls to fork()
Message-ID: <20180101220427.B7651839BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0344e6b3dd43d3af3709b9eb10910c57afffe314
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/489dd7a19911b45ae7b0f1eade63def793e03ade

Signed-off-by: Mario Lang <mlang@blind.guru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/brltty/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/brltty/Config.in b/package/brltty/Config.in
index 288d9b5..48ceb04 100644
--- a/package/brltty/Config.in
+++ b/package/brltty/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_BRLTTY
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # fork()
 	help
 	  A daemon providing access to the Linux console for a blind
 	  person using a refreshable braille display.
@@ -17,4 +18,5 @@ config BR2_PACKAGE_BRLTTY_TEXT_TABLE
 endif
 
 comment "brltty needs a toolchain w/ dynamic lib, threads, wchar"
+	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
