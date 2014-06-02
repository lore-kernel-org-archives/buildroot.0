From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 14:02:25 +0200
Subject: [Buildroot] [git commit] rpm: needs mmu
Message-ID: <20140602120252.C00C99CE82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f404a7d03f0489a27eca605ac1c369525d5abd74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/7fa/7fa2bd8e464c6708095ec4038b6f3d534b10dd82/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index de06141..2492616 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,9 +1,11 @@
 comment "rpm needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 
 config BR2_PACKAGE_RPM
 	bool "rpm"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_OPENSSL
