From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 23:02:07 +0100
Subject: [Buildroot] [PATCH] mimic: needs wchar support
Message-ID: <20161220220207.12933-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9f7/9f7c1af4b9fd8331672c9096821db91d5f7f3aa1/
http://autobuild.buildroot.net/results/47f/47f5ec3fabefd85e62b675142bd6728904acd5d8/

At the same time fixup space/tabs for 'help' option.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mimic/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mimic/Config.in b/package/mimic/Config.in
index 6cd4c20..757ac9e 100644
--- a/package/mimic/Config.in
+++ b/package/mimic/Config.in
@@ -1,6 +1,10 @@
+comment "mimic needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_MIMIC
 	bool "mimic"
-        help
+	depends on BR2_USE_WCHAR
+	help
           Mimic is a fast, lightweight Text-to-speech engine developed
           by Mycroft A.I. and VocaliD, based on Carnegie Mellon
           University's Flite (Festival-Lite) software. Mimic takes in
-- 
2.10.2
