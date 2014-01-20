From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2014 22:20:59 +0100
Subject: [Buildroot] [git commit] libbluray: needs threads
Message-ID: <20140120212458.B1BEE9A988@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4879ca7f039a0a5a8b47cde1d236443a11545b8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/2bc/2bc0ce057e54bd6ff7f9ade115c389648a2df2eb/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbluray/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libbluray/Config.in b/package/libbluray/Config.in
index eeb93dc..2571f5c 100644
--- a/package/libbluray/Config.in
+++ b/package/libbluray/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBBLURAY
 	bool "libbluray"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libbluray is a client library for accessing bluray disks.
 
 	  http://www.videolan.org/developers/libbluray.html
+
+comment "libbluray needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
