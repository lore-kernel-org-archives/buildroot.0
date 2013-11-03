From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun,  3 Nov 2013 09:53:28 +0000
Subject: [Buildroot] [PATCH] libcap-ng: disable_on_avr32
Message-ID: <1383472408-1598-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Thread-local storage is not available in the avr32 toolchain, so libcap-ng
must be disabled on avr32. Fixed build failures such as the following.

  http://autobuild.buildroot.net/results/05f/05f73cb74ee7bfb1c337100312726de034366a7d/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libcap-ng/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index d1663cd..008bf51 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCAP_NG
 	bool "libcap-ng"
+	depends on !BR2_avr32 # TLS not available
 	help
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
-- 
1.8.3.2
