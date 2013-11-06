From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 11:53:43 +0100
Subject: [Buildroot] [git commit] nettle: disable openssl support for
	(unused) examples
Message-ID: <20131106105440.27BB89BAD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58417d942c2a99ec5cb8ca93302444594850f81b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Works around a linker issue when statically linking:

http://autobuild.buildroot.net/results/e3f43fed8f57c52e07e20055f11680f8200fb65e/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nettle/nettle.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index e86d3e8..c23b4fa 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -10,6 +10,9 @@ NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = LGPLv2.1+
 NETTLE_LICENSE_FILES = COPYING.LIB
+# don't include openssl support for (unused) examples as it has problems
+# with static linking
+NETTLE_CONF_OPT = --disable-openssl
 
 # ARM assembly requires v6+ ISA
 ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_arm10t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
