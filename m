From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:18 +0200
Subject: [Buildroot] [git commit] bsdiff: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.CC84D81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7c7b5570534a9ca2dc81666b9481e1ce29ce411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
