From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:43:55 +0100
Subject: [Buildroot] [git commit] nettle: use the BR2_ARM_CPU_ARM* options
Message-ID: <20141106233446.6FB8CB1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=461f08072f0ae06c98ae5e72ef2dbb266a2672f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust the nettle package to use the BR2_ARM_CPU_ARM* option to
disable the usage of assembly code on ARMv4 and ARMv5.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nettle/nettle.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index e73a718..a25bb24 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -15,7 +15,7 @@ NETTLE_LICENSE_FILES = COPYING.LIB
 NETTLE_CONF_OPTS = --disable-openssl
 
 # ARM assembly requires v6+ ISA
-ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
+ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5),y)
 NETTLE_CONF_OPTS += --disable-assembler
 endif
 
