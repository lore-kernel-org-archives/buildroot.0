From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Jul 2015 21:54:04 -0300
Subject: [Buildroot] [PATCH 2/2] qemu/configs: enable DRM+QXL for x86 and
	x86_64
In-Reply-To: <1436403244-1367-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436403244-1367-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436403244-1367-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allows for nicer framebuffer emulation under Qemu with the QXL xorg
driver.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/x86/linux-4.1.config    | 2 ++
 board/qemu/x86_64/linux-4.1.config | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/board/qemu/x86/linux-4.1.config b/board/qemu/x86/linux-4.1.config
index ce19f81..5b64416 100644
--- a/board/qemu/x86/linux-4.1.config
+++ b/board/qemu/x86/linux-4.1.config
@@ -18,3 +18,5 @@ CONFIG_SND_HDA_INTEL=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_DRM=y
+CONFIG_DRM_QXL=y
diff --git a/board/qemu/x86_64/linux-4.1.config b/board/qemu/x86_64/linux-4.1.config
index ce19f81..5b64416 100644
--- a/board/qemu/x86_64/linux-4.1.config
+++ b/board/qemu/x86_64/linux-4.1.config
@@ -18,3 +18,5 @@ CONFIG_SND_HDA_INTEL=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_DRM=y
+CONFIG_DRM_QXL=y
-- 
2.3.6
