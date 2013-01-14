From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 23:06:42 +0100
Subject: [Buildroot] [git commit] minicom: uses fork()
Message-ID: <20130114220647.090A79A0B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a066f31a05bb8a357b04269011de5995d81f53df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/83db7c1e6edcfae7edd220a9accb99cb96649feb

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/minicom/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/minicom/Config.in b/package/minicom/Config.in
index a8a2635..8bbb2b3 100644
--- a/package/minicom/Config.in
+++ b/package/minicom/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MINICOM
 	bool "minicom"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_NCURSES
 	help
