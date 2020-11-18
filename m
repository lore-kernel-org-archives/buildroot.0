From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2020 17:58:14 +0100
Subject: [Buildroot] [git commit] package/gvfs: show warning when
 BR2_STATIC_LIBS=y
Message-ID: <20201118164552.5599C8673B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c8a6d3aa66b93b1e0320f0160938314c1915534
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4266c9f54f (package/gvfs: needs dynamic library) updated the
dependency of gvfs, but inverted the comment dependency, causing it to only
be shown if !static - Fix that.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Reviewed-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 5a6b3e73ec..68ad291436 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -20,4 +20,4 @@ config BR2_PACKAGE_GVFS
 comment "gvfs needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_STATIC_LIBS
+		BR2_STATIC_LIBS
