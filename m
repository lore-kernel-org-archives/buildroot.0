From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 18:10:23 +0100
Subject: [Buildroot] [git commit] package/brltty: depends on !BR2_STATIC_LIBS
Message-ID: <20171230171046.2E6EF810A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=391efec78a3be2c95b9a30571fbff2660cd79d6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This requirement is likely to go away in the future.  However, declaring
this fact explicitly for now fixes a number of test-pkg failures.

Signed-off-by: Mario Lang <mlang@blind.guru>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/brltty/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/brltty/Config.in b/package/brltty/Config.in
index dfd2ff4..288d9b5 100644
--- a/package/brltty/Config.in
+++ b/package/brltty/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BRLTTY
 	bool "brltty"
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	help
 	  A daemon providing access to the Linux console for a blind
 	  person using a refreshable braille display.
@@ -15,5 +16,5 @@ config BR2_PACKAGE_BRLTTY_TEXT_TABLE
 
 endif
 
-comment "brltty needs a toolchain w/ threads, wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "brltty needs a toolchain w/ dynamic lib, threads, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
