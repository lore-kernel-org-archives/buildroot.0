From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Feb 2013 22:47:57 +0100
Subject: [Buildroot] [git commit] thttpd: needs mmu
Message-ID: <20130217221225.3B9669AB4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c111e4a3920fda9d300d211643d22bf7c06720d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/0b73d2b45a5bac94b65893725de46d87a9626b37/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/thttpd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/thttpd/Config.in b/package/thttpd/Config.in
index 172a2d6..d359785 100644
--- a/package/thttpd/Config.in
+++ b/package/thttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_THTTPD
 	bool "thttpd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  thttpd is a simple, small, portable, fast, and secure HTTP server
 
