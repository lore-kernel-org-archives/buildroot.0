From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Aug 2014 10:09:05 +0200
Subject: [Buildroot] [git commit] tftpd: depends on MMU
Message-ID: <20140814081045.0631E9D1C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ed56b83c25b9ca049612dd86f58655f6f1b27e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/3e1/3e16d8c9ae3b77393e082c3dd9b7b3de9aa040c0//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tftpd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
index 6f5916d..609b5d1 100644
--- a/package/tftpd/Config.in
+++ b/package/tftpd/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_TFTPD
 	bool "tftpd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  HPA's Trivial File Transfer Protocol (tftp) server.
