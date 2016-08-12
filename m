From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Aug 2016 17:42:19 +0200
Subject: [Buildroot] [PATCH] package/weston: fix patch
Message-ID: <1471016539-23386-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The newly iontroduced patch was created against weston's master branch,
but was not rebased correctly on top of the release we are using, hence
it does not apply because files have been moved since the release.

Fixes:
    http://autobuild.buildroot.org/results/5fb/5fbfd26d05a0ccaf4a70a100a7499cedea83ce6f/
    http://autobuild.buildroot.org/results/769/76976fbfc2162c2c671a52eafdad82df6d25a660/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch b/package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch
index 32db32f..b391147 100644
--- a/package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch
+++ b/package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch
@@ -16,10 +16,10 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  libweston/compositor-rdp.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/libweston/compositor-rdp.c b/libweston/compositor-rdp.c
+diff --git a/src/compositor-rdp.c b/src/compositor-rdp.c
 index 11f5f05..ee81300 100644
---- a/libweston/compositor-rdp.c
-+++ b/libweston/compositor-rdp.c
+--- a/src/compositor-rdp.c
++++ b/src/compositor-rdp.c
 @@ -58,7 +58,7 @@
  #	define NSC_RESET(C, W, H) nsc_context_reset(C, W, H)
  #	define RFX_RESET(C, W, H) rfx_context_reset(C, W, H)
-- 
2.7.4
