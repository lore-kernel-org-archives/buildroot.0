From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 21:28:21 +0100
Subject: [Buildroot] [git commit] erlang: fix comment dependencies
Message-ID: <20150104202932.6D4147F998@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe430adc2868f6317bab8e73625a0f32181b7ad7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment was missing the dependency on BR2_USE_MMU, and was using
'depends on !BR2_TOOLCHAIN_HAS_THREADS && BR2_STATIC_LIBS' while it
should in fact be '!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS',
since we want show the comment *either* when we don't have threads
*or* when we are building a purely static lib system.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 51c72cb..625b7c1 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,6 +1,7 @@
 comment "erlang needs a toolchain w/ threads, shared library"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS && BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
