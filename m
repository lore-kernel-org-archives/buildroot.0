From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Jun 2013 00:17:18 +0200
Subject: [Buildroot] [git commit] dash: needs mmu
Message-ID: <20130624222131.D2D9E9B17E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2be905282af5c1b049eab778c0b9cb76e3c1d4db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/9ff/9ffde0aaa717efb6a5c0ef1e4e7f2cdd0621c150/

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dash/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dash/Config.in b/package/dash/Config.in
index 20970aa..e06087e 100644
--- a/package/dash/Config.in
+++ b/package/dash/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DASH
 	bool "dash"
+	depends on BR2_USE_MMU # fork()
 	help
 	  The Debian/Linux port of the NetBSD version of
 	  ash (the Almquist SHell).
