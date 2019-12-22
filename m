From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 14:06:17 +0100
Subject: [Buildroot] [git commit] package/libnfc: drop leftover comment
Message-ID: <20191222125713.957D08D57E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=891801fbb395cb41025e5f92caa4e4716ab50362
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 1a49188a694 (package/libnfc: add sub-options to enable
individual drivers), the dependency on threads was moved down to
the individual drivers that need it, and libnfc as a whole lost
that dependency.

However, the global comment was not removed. Do so now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnfc/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index 014ab94ce8..14084dc889 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -75,6 +75,3 @@ config BR2_PACKAGE_LIBNFC_EXAMPLES
 	select BR2_PACKAGE_READLINE
 
 endif
-
-comment "libnfc needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
