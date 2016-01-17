From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2016 14:53:16 +0100
Subject: [Buildroot] [PATCH v2] package/libbroadvoice: Broken on BR2_arc
	with gcc <= 4.8
Message-ID: <1453038796-7041-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please read this bug report for details:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049

Fixes
http://autobuild.buildroot.net/results/4a1/4a1fd92d1ce4963d3e282ea2dc8f0f6c5db4f1e1/
http://autobuild.buildroot.net/results/ce3/ce3be7d27489647a98d8932c5bcabd08c845187b/
http://autobuild.buildroot.net/results/988/988bd189bab37a03c037160d6758774d4aa6c8a0/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: changed logic to "material implication" (Arnout, Mason)

 package/libbroadvoice/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libbroadvoice/Config.in b/package/libbroadvoice/Config.in
index d695df0..3301ba8 100644
--- a/package/libbroadvoice/Config.in
+++ b/package/libbroadvoice/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LIBBROADVOICE
 	bool "libbroadvoice"
+	# broken with gcc <= 4.8 on arc
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049
+	depends on !BR2_arc || BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  broadvoice - a library for the BroadVoice 16 and 32 speech
 	  codecs
-- 
2.7.0.rc3
