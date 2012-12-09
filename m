From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 23:03:54 +0100
Subject: [Buildroot] [git commit] rt-tests: fix typo in Config.in threads
	negative logic
Message-ID: <20121209220341.AFD5E9A0E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e510b0fea65cf6e71c6e9c512204b04282973d43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
