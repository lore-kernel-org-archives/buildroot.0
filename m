From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 18:41:21 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/python-greenlet:
 really enable for i386
Message-ID: <20200720163849.3AAF884054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d58f4a202bc02bb085a6b655389df7dcc6f78f70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Commit 30f1decec2c (package/python-greenlet: enable only on supported
architectures) mis-typed the architecture name fox 286-32: BR2_x86
doesn't exist in buildroot; it is BR2_i386.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - just do the s/x86/i386/ fix for easy backport
  - x86_64 split off to its own patch
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b29eadf903be27caee24c12755efbc3bd10bd31a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-greenlet/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
index 44ab96b488..15765f1e45 100644
--- a/package/python-greenlet/Config.in
+++ b/package/python-greenlet/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_riscv
 	default y if BR2_sparc || BR2_sparc64
-	default y if BR2_x86
+	default y if BR2_i386
 
 config BR2_PACKAGE_PYTHON_GREENLET
 	bool "python-greenlet"
