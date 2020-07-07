From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 22:51:14 +0200
Subject: [Buildroot] [git commit] package/python-greenlet: enable build for
 x86_64
Message-ID: <20200707204910.00F687F9E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a3893e44114df4e5d066731e4a3a8c7f4b988c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 30f1decec2c (package/python-greenlet: enable only on supported
architectures) forgot to allow x86_64.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr: split off the x86_64 support to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-greenlet/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
index 15765f1e45..c73eeb7b15 100644
--- a/package/python-greenlet/Config.in
+++ b/package/python-greenlet/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_riscv
 	default y if BR2_sparc || BR2_sparc64
-	default y if BR2_i386
+	default y if BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_PYTHON_GREENLET
 	bool "python-greenlet"
