From: Lahoudere Fabien <fabienlahoudere.pro@gmail.com>
Date: Tue,  3 Mar 2015 13:27:53 +0100
Subject: [Buildroot] [PATCH 1/1] Fix barebox compilation issue with 64bit
	kernel
Message-ID: <1425385673-2462-1-git-send-email-fabienlahoudere.pro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Lahoudere Fabien <fabienlahoudere.pro@gmail.com>
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
