From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 12:55:35 +0200
Subject: [Buildroot] [git commit] socketcand: needs mmu
Message-ID: <20130911110611.DB7D39B6F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd7606117f20d9e51c9da0aecbd937039496acfd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/socketcand/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/socketcand/Config.in b/package/socketcand/Config.in
index 72315c0..b836f55 100644
--- a/package/socketcand/Config.in
+++ b/package/socketcand/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SOCKETCAND
 	bool "socketcand"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Socketcand is a daemon that provides access to CAN interfaces
 	  on a machine via a network interface.
