From: Raphael Poggi <poggi.raph@gmail.com>
Date: Fri, 12 Aug 2016 13:11:26 +0200
Subject: [Buildroot] [PATCH] barebox: fix ARCH value for arm64
Message-ID: <1471000286-50321-1-git-send-email-poggi.raph@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Raphael Poggi <poggi.raph@gmail.com>
---
 boot/barebox/barebox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 832297e..b02751d 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -61,6 +61,8 @@ else ifeq ($$(KERNEL_ARCH),x86_64)
 $(1)_ARCH = x86
 else ifeq ($$(KERNEL_ARCH),powerpc)
 $(1)_ARCH = ppc
+else ifeq ($$(KERNEL_ARCH), arm64)
+$(1)_ARCH = arm
 else
 $(1)_ARCH = $$(KERNEL_ARCH)
 endif
-- 
2.1.0
