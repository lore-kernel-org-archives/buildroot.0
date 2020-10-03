From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 09:01:34 +0200
Subject: [Buildroot] [git commit] package/librelp: needs threads
Message-ID: <20201003065707.CFE2981262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad96530fa4be47efdd454ca2bd4b9161ad6affc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/e09f6eb989388cec2dab06391a8b6580aa0ff118

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librelp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/librelp/Config.in b/package/librelp/Config.in
index d1f1f9ed7e..c0ae5fbe89 100644
--- a/package/librelp/Config.in
+++ b/package/librelp/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBRELP
 	bool "librelp"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Reliable Event Logging Protocol library
 
 	  https://www.rsyslog.com/librelp/
+
+comment "librelp needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
