From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:35:02 +0200
Subject: [Buildroot] [git commit] kismet: needs mmu
Message-ID: <20131009203637.E5EC69B9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d6a640452fc88cefba2453fb2172ce589cf83de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kismet/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 8de29be..a0e7c67 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_KISMET
 	bool "kismet"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_LIBPCAP
