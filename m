From: Alexandre Esse <alexandre.esse.dev@gmail.com>
Date: Tue, 20 Jun 2017 22:39:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/kvazaar: needs threads
Message-ID: <1497991145-10593-1-git-send-email-alexandre.esse.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixing http://autobuild.buildroot.net/results/6e1/6e1eabd691b8674f61898bc0fe734208d226f965/build-end.log

Signed-off-by: Alexandre Esse <alexandre.esse.dev@gmail.com>
---
 package/kvazaar/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kvazaar/Config.in b/package/kvazaar/Config.in
index 3377145..06ab9ac 100644
--- a/package/kvazaar/Config.in
+++ b/package/kvazaar/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_KVAZAAR
 	bool "kvazaar"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  An open-source HEVC encoder licensed under LGPLv2.1
 
 	  https://github.com/ultravideo/kvazaar
+
+comment "kvazaar needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.4
