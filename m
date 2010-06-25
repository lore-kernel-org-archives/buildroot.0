From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Jun 2010 12:31:51 +0200
Subject: [Buildroot] [git commit master 1/1] gawk: enable host package
Message-ID: <20100625103241.F032881DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=58b653ee24e6e1221e21c145cbda0fdf507a07ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gawk/gawk.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 35c487c..7ed7f9d 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -9,6 +9,7 @@ GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_TARGET_BINS = awk gawk igawk pgawk
 
 $(eval $(call AUTOTARGETS,package,gawk))
+$(eval $(call AUTOTARGETS,package,gawk,host))
 
 $(GAWK_HOOK_POST_INSTALL): $(GAWK_TARGET_INSTALL_TARGET)
 	ln -sf /usr/bin/gawk $(TARGET_DIR)/usr/bin/awk
-- 
1.7.1
