From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:37 -0300
Subject: [Buildroot] [PATCH 30/51] bsdiff: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-31-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/bsdiff/bsdiff.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 7d2b296..eb903e0 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -11,9 +11,9 @@ BSDIFF_LICENSE = BSD-2c
 BSDIFF_LICENSE_FILES = bsdiff.c
 
 define BSDIFF_BUILD_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 		$(@D)/bsdiff.c -lbz2 -o $(@D)/bsdiff
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 		$(@D)/bspatch.c -lbz2 -o $(@D)/bspatch
 endef
 
-- 
2.7.3
