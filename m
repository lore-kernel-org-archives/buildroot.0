From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:42 -0000
Subject: [Buildroot] [git commit branch/next] bison: m4 needs MMU
Message-ID: <20120802195233.D7AFA96AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae446b2ea386ddc06644ef15b26bd06f16f3cbc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/0bb659881ed6a01745f596f00da9acbef02a4c31/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bison/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bison/Config.in b/package/bison/Config.in
index da0ac3f..1a485c4 100644
--- a/package/bison/Config.in
+++ b/package/bison/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_BISON
 	bool "bison"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_M4
+	# m4 uses fork()
+	depends on BR2_USE_MMU
 	help
 	  General-purpose parser generator that converts a
 	  grammar description for an LALR context-free grammar into a C
