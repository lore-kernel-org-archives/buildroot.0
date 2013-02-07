From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Feb 2013 19:20:30 +0100
Subject: [Buildroot] [git commit] proxychains-ng: needs threads
Message-ID: <20130207182101.292E596E73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=124c4e040af817951ceb67bab04e2575269c827a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also capitalize help text while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/proxychains-ng/Config.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/proxychains-ng/Config.in b/package/proxychains-ng/Config.in
index 6fcebde..99e49bd 100644
--- a/package/proxychains-ng/Config.in
+++ b/package/proxychains-ng/Config.in
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_PROXYCHAINS_NG
 	bool "proxychains-ng"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  force any tcp connections to flow through a proxy (or proxy chain)
+	  Force any tcp connections to flow through a proxy (or proxy chain)
 
 	  https://github.com/rofl0r/proxychains
 
+comment "proxychains-ng needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
