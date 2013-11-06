From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  6 Nov 2013 11:01:12 +0000
Subject: [Buildroot] [PATCH] connman: disable on avr32
Message-ID: <1383735672-24550-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The inotify_init1 syscall is not available on avr32. Fixes build failures
such as the following.

  http://autobuild.buildroot.net/results/0d8/0d8e7bd8bd3f227fabfb0d5feb59a5d316026d3f

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/connman/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index c74618a..efb2486 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_GNUTLS
+	depends on !BR2_avr32 # no inotify_init1
 	depends on !BR2_UCLIBC_VERSION_0_9_32
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
-- 
1.8.3.2
