From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 22:21:06 +0200
Subject: [Buildroot] [PATCH 12/20] gawk: enable host package
In-Reply-To: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
References: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
Message-ID: <aeab9ad6d16cc335e727d988d9b30a1203bff7a3.1277237892.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
