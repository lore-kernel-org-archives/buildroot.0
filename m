From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jun 2017 23:55:39 +0200
Subject: [Buildroot] [git commit] boot/syslinux: drop patch 0008,
	not needed after gnu-efi update
Message-ID: <20170630215940.B49737F9B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=967ef5af9e570419145849a50915ac4c2573b31b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to the bump of gnu-efi from 3.0.5 to 3.0.6, patch 0008 in the
syslinux package is no longer needed. More specifically, it's commit
bf07e8141777e5a2d67ec8447084215224bdad4b in upstream gnu-efi that
fixed the underlying issue.

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
[Thomas: add better commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ..._BASE_CODE-struct-has-been-renamed-to-EFI.patch | 30 ----------------------
 1 file changed, 30 deletions(-)

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
-Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
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
