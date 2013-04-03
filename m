From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Apr 2013 22:42:15 +0200
Subject: [Buildroot] [git commit] dtach: needs mmu
Message-ID: <20130403204841.3CD769B467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=204b1d61d061012ce42534eaaef12fa24d141a16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b07f6f05552aa9c8850ec8d9f67b2aa666dffbf4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dtach/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dtach/Config.in b/package/dtach/Config.in
index 033536b..bea112b 100644
--- a/package/dtach/Config.in
+++ b/package/dtach/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DTACH
 	bool "dtach"
+	depends on BR2_USE_MMU # fork()
 	help
 	  dtach is a tiny program that emulates the detach feature of screen,
 	  allowing you to run a program in an environment that is protected
