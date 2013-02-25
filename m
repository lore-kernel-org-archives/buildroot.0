From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Feb 2013 12:51:40 +0100
Subject: [Buildroot] [git commit] spawn-fcgi: needs mmu
Message-ID: <20130225115314.CE3AA9ACC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eda24e12a5e95753d6cebf082109951681ab6905
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/cb6605b223642e647981e697f17d89bb97e223a6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/spawn-fcgi/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/spawn-fcgi/Config.in b/package/spawn-fcgi/Config.in
index 34cbbb1..59791e8 100644
--- a/package/spawn-fcgi/Config.in
+++ b/package/spawn-fcgi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SPAWN_FCGI
 	bool "spawn-fcgi"
+	depends on BR2_USE_MMU # fork()
 	help
 	  FastCGI process spawner.
 	  Project split from lighttpd.
