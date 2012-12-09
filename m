From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Dec 2012 19:13:58 +0100
Subject: [Buildroot] [PATCH 3/8] rt-tests: requires thread support in the
	toolchain
In-Reply-To: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3b534b03d272d7da09743acab71910ab1acb6592.1355076808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rt-tests package extensively use threads, so this package should
only be available if the toolchain has thread support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rt-tests/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index e645266..337c020 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
-- 
1.7.9.5
