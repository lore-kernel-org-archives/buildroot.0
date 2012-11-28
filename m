From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Nov 2012 10:39:05 -0800
Subject: [Buildroot] [git commit] hiawatha: needs mmu
Message-ID: <20121128184035.B6DE19729E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=737d92d9c271093e76a47d1e7c90b3c1e315f16a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hiawatha/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 431a9fa..ac0aa10 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_HIAWATHA
 	bool "hiawatha"
+	# needs fork()
+	depends on BR2_USE_MMU
 	help
 	  Hiawatha is a webserver for Unix and has been built with
 	  security in mind. This resulted in a highly secure
