From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 15:27:52 +0200
Subject: [Buildroot] [git commit] screen: needs mmu
Message-ID: <20130917132814.6F2CA9ADA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fe9d4e232fe0c8668de9bb44b2988b45e5ae0ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/screen/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/screen/Config.in b/package/screen/Config.in
index c232392..b5876e8 100644
--- a/package/screen/Config.in
+++ b/package/screen/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SCREEN
 	bool "screen"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Screen is a full-screen window manager that multiplexes a physical
