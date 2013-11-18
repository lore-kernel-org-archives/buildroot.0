From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 18 Nov 2013 08:30:18 +0000
Subject: [Buildroot] [PATCH] e2fsprogs: disable e4defrag on avr32
Message-ID: <1384763418-2695-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The fallocate syscall is not available on avr32. This is needed by the e4defrag
utility, so we disable this on avr32.

Fixes build failures such as the following.

  http://autobuild.buildroot.net/results/dcb/dcb4e5c6981a9299a2eb18e325d4de621846afdb/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/e2fsprogs/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 16d3671..1d1e174 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -49,6 +49,7 @@ config BR2_PACKAGE_E2FSPROGS_E2UNDO
 
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
+	depends on !BR2_avr32 # fallocate not implemented
 
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
 	bool "filefrag"
-- 
1.8.3.2
