From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:35:00 +0200
Subject: [Buildroot] [git commit] civetweb: needs mmu
Message-ID: <20131009203637.D63789A45E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5e44382cd59d48d3fe952bc62525b44de6b999e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/civetweb/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
index f7a31f5..55c138a 100644
--- a/package/civetweb/Config.in
+++ b/package/civetweb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CIVETWEB
 	bool "civetweb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Full featured embedded web server with Lua support.
 
