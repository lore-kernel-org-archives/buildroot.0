From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 18 Nov 2010 05:24:43 -0500
Subject: [Buildroot] [PATCH] linux: add shorter shortcuts
Message-ID: <1290075883-30494-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We only have one Linux kernel package, and "linux26-" is an anachronism
in today's world.  So add useful "linux-%" shortcuts to the "linux26-%".

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 linux/linux.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index fb858b0..4ab519b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -188,3 +188,6 @@ endif
 endif
 
 endif
+
+linux-%:
+	$(MAKE) $(subst linux-,linux26-,$@)
-- 
1.7.3.2
