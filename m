From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  9 Dec 2012 18:48:45 -0300
Subject: [Buildroot] [PATCH] rt-tests: fix typo in Config.in threads
	negative logic
Message-ID: <1355089725-12019-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rt-tests/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index c253339..0999ebf 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -17,4 +17,4 @@ config BR2_PACKAGE_RT_TESTS
 	  http://rt.wiki.kernel.org
 
 comment "rt-tests requires a toolchain with threads support"
-	!BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.8.6
