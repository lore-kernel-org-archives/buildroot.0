From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 26 Jan 2015 20:24:20 +0100
Subject: [Buildroot] [PATCH 5/5] package/libungif: deprecate package
In-Reply-To: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1422300260-5361-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be replaced with giflib.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libungif/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libungif/Config.in b/package/libungif/Config.in
index e8c301c..012ef76 100644
--- a/package/libungif/Config.in
+++ b/package/libungif/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBUNGIF
 	bool "libungif"
+	depends on !BR2_PACKAGE_GIFLIB
+	depends on BR2_DEPRECATED_SINCE_2015_02 # giflib
 	help
 	  libungif is a library for handling the uncompressed GIF image format.
 
-- 
1.7.10.4
