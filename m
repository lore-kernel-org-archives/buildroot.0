From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Apr 2015 00:41:32 +0200
Subject: [Buildroot] [git commit] ipmiutil: only make available for x86
Message-ID: <20150404224203.64C81818DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b38f10c074be00c9bcc90330ce302f3b41d6b2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

IPMI is a Intel/PC spec, so it doesn't make much sense to build on !x86 -
And ipmiutil uses sys/io.h and inb()/outb() which isn't supported on all
architectures, so limit to x86 like we do for acpid.

Fixes:
http://autobuild.buildroot.net/results/b2b/b2b50be359431b828e60c2ffdcd0fa1ca1cd5605/
http://autobuild.buildroot.net/results/f63/f63a25d6faca407da7332b2806300baadbe33326/
http://autobuild.buildroot.net/results/92f/92f54495f7f2a4b70aff18c094baa71adb0f5985/
http://autobuild.buildroot.net/results/f21/f21958c19f145baf83ebbb02b8526f1a58ea25ec/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipmiutil/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ipmiutil/Config.in b/package/ipmiutil/Config.in
index b6a1760..2500583 100644
--- a/package/ipmiutil/Config.in
+++ b/package/ipmiutil/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IPMIUTIL
 	bool "ipmiutil"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_x86_64 || BR2_i386
 	select BR2_PACKAGE_OPENSSL
 	help
 	  The ipmiutil package provides easy-to-use utilities to view
@@ -14,3 +15,4 @@ config BR2_PACKAGE_IPMIUTIL
 comment "ipmiutil needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_x86_64 || BR2_i386
