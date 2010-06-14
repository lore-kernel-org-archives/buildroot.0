From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: add a check to
	verify that BR2_TARGET_AT91BOOTSTRAP_BOARD is set
Message-ID: <20100614203442.5F5BA804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8704da32fa5d6fe5e890b274eef9b1e93a238d28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 1d1091e..b71df89 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -90,3 +90,8 @@ at91bootstrap-dirclean:
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
 TARGETS+=at91bootstrap
 
+# we NEED a board name
+ifeq ($(AT91BOOTSTRAP_BOARD),)
+$(error No AT91Bootstrap board name set. Check your BR2_TARGET_AT91BOOTSTRAP_BOARD setting)
+endif
+endif
-- 
1.7.1
