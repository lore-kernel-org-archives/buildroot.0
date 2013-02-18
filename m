From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 18 Feb 2013 08:37:37 -0300
Subject: [Buildroot] [PATCH] ntfs-3g: needs mmu
Message-ID: <1361187457-8689-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The internal libfuse-lite implementation uses it, and since the external
full-blown libfuse also requires it there's no other choice.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntfs-3g/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index 1d3e2fb..be19a57 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NTFS_3G
 	bool "ntfs-3g"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU
 	help
 	  The NTFS-3G driver is an open source, freely available
 	  read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD,
-- 
1.7.12.4
