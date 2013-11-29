From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 29 Nov 2013 09:23:49 +0000
Subject: [Buildroot] [PATCH] libpfm4: disable on avr32
Message-ID: <1385717029-6381-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The perf_event_open syscall is not available on avr32. Fixes build failures
such as the following.

  http://autobuild.buildroot.net/results/38f/38fa81315be448c409b9af29f92621fcf5676f71/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libpfm4/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libpfm4/Config.in b/package/libpfm4/Config.in
index 6b491a4..3908e78 100644
--- a/package/libpfm4/Config.in
+++ b/package/libpfm4/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPFM4
 	bool "libpfm4"
+	depends on !BR2_avr32 # no perf_event_open
 	help
 	  A helper library to help encode Performance Events to use with
 	  Operating system kernels performance monitoring interfaces.
-- 
1.8.3.2
