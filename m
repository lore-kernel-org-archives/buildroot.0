From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 12:27:33 +0200
Subject: [Buildroot] [git commit] aiccu: needs mmu
Message-ID: <20130918102802.E31429B7D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d804657a2cf04020d58d9661f00edc2c4b5d19c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/549/549bc89aeaa0ebf9162fc5853cb637f4f70d0b51/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/aiccu/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index 15959b1..9cff8cc 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_AICCU
 	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GNUTLS
 	help
 	  SixXS Automatic IPv6 Connectivity Client Utility
