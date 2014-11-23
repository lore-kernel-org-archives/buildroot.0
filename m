From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:39:05 +0100
Subject: [Buildroot] [PATCH 33/51] iostat: remove legacy code
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-34-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some custom iostat-source target was mistakenly left in place when the
iostat package was migrated to gentargets in commit
ee77963588b09babfd71befb0b5eb9fd1e776bbc, back 4 years ago. This
commit removes this unnecessary custom target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iostat/iostat.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 2080e56..dd2a579 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -9,8 +9,6 @@ IOSTAT_SITE = http://www.linuxinsight.com/files
 IOSTAT_LICENSE = GPL
 IOSTAT_LICENSE_FILES = LICENSE
 
-iostat-source: $(DL_DIR)/$(IOSTAT_SOURCE)
-
 define IOSTAT_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
-- 
2.1.0
