From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2016 12:42:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libbroadvoice: Not available on
	BR2_arc
Message-ID: <1453030930-30782-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only available buildroot-toolchain for arc is gcc-4.8 which has a
bug when compiling libbroadvoice:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049

This patch can be removed when gcc-4.9+ is available for arc.

Fixes
http://autobuild.buildroot.net/results/4a1/4a1fd92d1ce4963d3e282ea2dc8f0f6c5db4f1e1/
http://autobuild.buildroot.net/results/ce3/ce3be7d27489647a98d8932c5bcabd08c845187b/
http://autobuild.buildroot.net/results/988/988bd189bab37a03c037160d6758774d4aa6c8a0/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbroadvoice/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libbroadvoice/Config.in b/package/libbroadvoice/Config.in
index d695df0..740342e 100644
--- a/package/libbroadvoice/Config.in
+++ b/package/libbroadvoice/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LIBBROADVOICE
 	bool "libbroadvoice"
+	# broken with gcc-4.8 which is the only available toolchain on arc
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049
+	depends on !BR2_arc
 	help
 	  broadvoice - a library for the BroadVoice 16 and 32 speech
 	  codecs
-- 
2.7.0.rc3
