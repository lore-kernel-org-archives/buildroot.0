From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Dec 2012 09:52:06 +0100
Subject: [Buildroot] [git commit] libcurl: needs MMU
Message-ID: <20121219085645.666969A3B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9229b82d6326ea425a258b91a9f0157ef6b223b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/5a502f16ad94a410ca21c9a7f223d6c12086bbb5/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcurl/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 1d6d08e..10ee0e4 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCURL
 	bool "libcurl"
+	depends on BR2_USE_MMU # Uses fork()
 	help
 	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
 	  and Dict servers, using any of the supported protocols.
