From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2014 14:22:37 +0100
Subject: [Buildroot] [git commit] feh: needs mmu
Message-ID: <20140215132302.0944E9CA3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6892c69e8fbc57cb2204fa32638b6affcf7fc62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/8f4/8f447412460e404aa723242dd8281b40317a017b/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/feh/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/feh/Config.in b/package/feh/Config.in
index 31e7239..f85612e 100644
--- a/package/feh/Config.in
+++ b/package/feh/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FEH
 	bool "feh"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_IMLIB2_PNG
