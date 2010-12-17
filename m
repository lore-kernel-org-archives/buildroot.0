From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: no board name
	check when 'make source' is used
Message-ID: <20101217160159.87C848E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2ff655c2e13c8075b5a52f12c3b89c8f996426a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.2.2
