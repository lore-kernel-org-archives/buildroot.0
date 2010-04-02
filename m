From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Apr 2010 12:40:32 +0200
Subject: [Buildroot] [git commit master] findutils: show comment if wchar
	isn't enabled
Message-ID: <20100402104211.AA9CF8A500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5b44556925b1ca0ef01dda0389e885089ae2df57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/findutils/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/findutils/Config.in b/package/findutils/Config.in
index 25a13c6..bbe2cc1 100644
--- a/package/findutils/Config.in
+++ b/package/findutils/Config.in
@@ -6,3 +6,6 @@ config BR2_PACKAGE_FINDUTILS
 	  common 'find', 'xargs', 'locate', and 'updatedb' binaries.
 
 	  http://www.gnu.org/software/findutils/findutils.html
+
+comment "findutils requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
-- 
1.6.3.3
