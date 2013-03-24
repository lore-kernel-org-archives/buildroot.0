From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:31 +0100
Subject: [Buildroot] [PATCH 07/22] gcc: add missing $(Q)
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a missing $(Q) in front of a MESSAGE call, which leads to the
message being displayed but also the command that shows the message.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index db9715a..1b7f222 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -211,7 +211,7 @@ endif
 
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(call MESSAGE,"Downloading gcc")
+	$(Q)$(call MESSAGE,"Downloading gcc")
 	$(call DOWNLOAD,$(GCC_SITE)/$(GCC_SOURCE))
 
 gcc-unpacked: $(GCC_DIR)/.patched
-- 
1.7.9.5
