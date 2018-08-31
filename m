From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Fri, 31 Aug 2018 16:20:23 +0200
Subject: [Buildroot] [PATCH 2/3] Revert "linux/linux.mk: Use '-isystem'
 instead of '-I' in HOST_CFLAGS"
In-Reply-To: <20180831142024.27548-1-david.degrave@mind.be>
References: <20180831142024.27548-1-david.degrave@mind.be>
Message-ID: <20180831142024.27548-2-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we made the use of '-isystem' global in a previous commit for
HOST_CFLAGS, that change is no longer needed.

This reverts commit 14a842315c12983eb492dfa310a9c358b7336da6.

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a31617ca22..675e7906a8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -115,7 +115,7 @@ LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 LINUX_MAKE_FLAGS = \
-	HOSTCC="$(HOSTCC) $(patsubst -I%,-isystem %,$(HOST_CFLAGS)) $(HOST_LDFLAGS)" \
+	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-- 
2.13.6
