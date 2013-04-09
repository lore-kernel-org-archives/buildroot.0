From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 9 Apr 2013 14:29:48 +0800
Subject: [Buildroot] [PATCH v3 7/7] package: Introduce NOMMU symbol
In-Reply-To: <1365488988-21604-1-git-send-email-sonic.adi@gmail.com>
References: <1365488988-21604-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1365488988-21604-7-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

v3-changes:
none

v2-changes:
none

v1-chagnes:
- Introduce NOMMU symbol __NOMMU__

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/Makefile.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index a8bf36b..3a26b09 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -103,6 +103,10 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
+ifneq ($(BR2_USE_MMU), y)
+TARGET_CFLAGS += -D__NOMMU__
+endif
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
 else
-- 
1.7.0.4
