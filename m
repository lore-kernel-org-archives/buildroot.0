From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Fri, 30 Jun 2017 12:58:36 +0200
Subject: [Buildroot] [PATCH 2/2] boot/syslinux: Drop patch 0008,
	integrated in the dependency upstream
In-Reply-To: <1498820316-2715-1-git-send-email-benoit.allard@greenbone.net>
References: <1498820316-2715-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <1498820316-2715-2-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 ..._BASE_CODE-struct-has-been-renamed-to-EFI.patch | 30 ----------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 boot/syslinux/0008-The-EFI_PXE_BASE_CODE-struct-has-been-renamed-to-EFI.patch

diff --git a/boot/syslinux/0008-The-EFI_PXE_BASE_CODE-struct-has-been-renamed-to-EFI.patch b/boot/syslinux/0008-The-EFI_PXE_BASE_CODE-struct-has-been-renamed-to-EFI.patch
deleted file mode 100644
index c5ed38a..0000000
--- a/boot/syslinux/0008-The-EFI_PXE_BASE_CODE-struct-has-been-renamed-to-EFI.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 6e25d11a062ef49c8add24476cf1bb74aa67e906 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
-Date: Fri, 9 Jun 2017 11:56:27 +0200
-Subject: [PATCH] The EFI_PXE_BASE_CODE struct has been renamed to
- EFI_PXE_BASE_CODE_PROTOCOL
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
----
- efi/pxe.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/efi/pxe.c b/efi/pxe.c
-index 6e59109..8060dff 100644
---- a/efi/pxe.c
-+++ b/efi/pxe.c
-@@ -90,7 +90,7 @@ struct embedded_dhcp_options embedded_dhcp_options =
- void net_parse_dhcp(void)
- {
-     EFI_PXE_BASE_CODE_MODE *mode;
--    EFI_PXE_BASE_CODE *bc;
-+    EFI_PXE_BASE_CODE_PROTOCOL *bc;
-     unsigned int pkt_len = sizeof(EFI_PXE_BASE_CODE_PACKET);
-     EFI_STATUS status;
-     uint8_t hardlen;
--- 
-2.1.4
-
-- 
2.1.4
