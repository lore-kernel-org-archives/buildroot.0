From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 19 Dec 2010 19:37:29 +0100
Subject: [Buildroot] [PATCH 2/2] linux: fix linux-% shortcut targets
In-Reply-To: <1292783849-8766-1-git-send-email-bjorn.forsman@gmail.com>
References: <1292783849-8766-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <1292783849-8766-2-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linux-% shortcut targets (short for linux26-%) ignores the ouput dir
$(O) so that 'make O=output.arm linux-menuconfig' is actually run in the
default $(O) directory output/ and not in output.arm/. Fix by passing on
$(O).

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6636a35..68d2d6d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -200,4 +200,4 @@ endif
 endif
 
 linux-%:
-	$(MAKE) $(subst linux-,linux26-,$@)
+	$(MAKE) O=$(O) $(subst linux-,linux26-,$@)
-- 
1.7.1
