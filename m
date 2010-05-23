From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 May 2010 23:37:16 +0200
Subject: [Buildroot] [git commit master] mutt: needs WCHAR support in
	toolchain
Message-ID: <20100523213851.C5D3B12F5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=78cff154eaf2e240464d24964ea1a92fa9b68297
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contrary to the comment in Config.in, mutt isn't broken when wchar
is enabled - In fact, it doesn't build without it.

Add BR2_USE_WCHAR dependency to make this clear.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mutt/Config.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/mutt/Config.in b/package/mutt/Config.in
index d345dfe..754979a 100644
--- a/package/mutt/Config.in
+++ b/package/mutt/Config.in
@@ -1,8 +1,11 @@
 config BR2_PACKAGE_MUTT
-	bool "mutt (BROKEN for wchar; FIXME!)"
+	bool "mutt"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	help
 	  Mutt is a sophisticated text-based Mail User Agent (MUA)
 
 	  http://www.mutt.org/
 
+comment "mutt requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
-- 
1.6.3.3
