From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jun 2013 21:29:35 +0200
Subject: [Buildroot] [git commit] mutt: needs mmu
Message-ID: <20130611193507.871709AC6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31e75f2213637948b512512ca2725fd67de65be1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/8ce/8ceec55fa8358d8821f2deaf3440f5b06270db6a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mutt/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mutt/Config.in b/package/mutt/Config.in
index 754979a..bb97cb0 100644
--- a/package/mutt/Config.in
+++ b/package/mutt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MUTT
 	bool "mutt"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Mutt is a sophisticated text-based Mail User Agent (MUA)
