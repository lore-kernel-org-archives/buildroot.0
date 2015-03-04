From: Fabien Lahoudere <fabienlahoudere.pro@gmail.com>
Date: Wed,  4 Mar 2015 15:50:46 +0100
Subject: [Buildroot] [PATCH 1/1] barebox: fix compilation on x86-64
	architecture
Message-ID: <1425480646-30970-1-git-send-email-fabienlahoudere.pro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Barebox uses KERNEL_ARCH to derive BAREBOX_ARCH, but doesn't
currently handle the case of the x86-64 architecture. In this
case KERNEL_ARCH is x86_64, but BAREBOX_ARCH should be x86
nonetheless.

Signed-off-by: Fabien Lahoudere <fabienlahoudere.pro@gmail.com>
---
 boot/barebox/barebox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 0fb7cec..626ff9a 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -41,6 +41,8 @@ endif
 
 ifeq ($(KERNEL_ARCH),i386)
 BAREBOX_ARCH = x86
+else ifeq ($(KERNEL_ARCH),x86_64)
+BAREBOX_ARCH = x86
 else ifeq ($(KERNEL_ARCH),powerpc)
 BAREBOX_ARCH = ppc
 else
-- 
2.1.4
