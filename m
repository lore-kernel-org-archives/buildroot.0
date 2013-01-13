From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 20:31:40 +0100
Subject: [Buildroot] [git commit] hiawatha: needs threads
Message-ID: <20130113193536.F06A299347@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6649d6da3f36e973e87d8a73c9618b3215e16253
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/9bb3bdb9de43fc6bab119674885df2a28e5559ee/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hiawatha/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index ac0aa10..fbed1bc 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -1,7 +1,11 @@
+comment "hiawatha requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_HIAWATHA
 	bool "hiawatha"
 	# needs fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Hiawatha is a webserver for Unix and has been built with
 	  security in mind. This resulted in a highly secure
