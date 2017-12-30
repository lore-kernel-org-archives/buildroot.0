From: Mario Lang <mlang@blind.guru>
Date: Sat, 30 Dec 2017 11:48:04 +0100
Subject: [Buildroot] [PATCH 3/3] package/brltty: depends on !BR2_STATIC_LIBS
In-Reply-To: <20171230104804.16489-1-mlang@blind.guru>
References: <20171230104804.16489-1-mlang@blind.guru>
Message-ID: <20171230104804.16489-3-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This requirement is likely to go away in the future.  However, declaring
this fact explicitly for now fixes a number of test-pkg failures.

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 package/brltty/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/brltty/Config.in b/package/brltty/Config.in
index dfd2ff4428..288d9b56d8 100644
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
-- 
2.15.0
