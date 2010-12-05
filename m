From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:51 +0100
Subject: [Buildroot] [PATCH 20/55] at91bootstrap: no board name check when
	'make source' is used
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7b33a471d0e9647dc4d616cff80844c93ee4821c.1291582351.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index bfffe11..3d4308e 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -56,8 +56,11 @@ at91bootstrap-dirclean:
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
 TARGETS+=at91bootstrap
 
-# we NEED a board name
+# we NEED a board name unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(AT91BOOTSTRAP_BOARD),)
 $(error No AT91Bootstrap board name set. Check your BR2_TARGET_AT91BOOTSTRAP_BOARD setting)
 endif
 endif
+
+endif
-- 
1.7.0.4
