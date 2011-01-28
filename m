From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jan 2011 15:46:50 +0100
Subject: [Buildroot] [git commit master 1/1] iproute2: ensure it gets built
	after busybox if both enabled
Message-ID: <20110128144734.66F378DCBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f199bce78c5298e1316bff8c78299dc1ee73101
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/iproute2.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index c3e9650..dfb8410 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -9,6 +9,12 @@ IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.bz2
 IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 
+# If both iproute2 and busybox are selected, make certain we win
+# the fight over who gets to have their utils actually installed.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+IPROUTE2_DEPENDENCIES += busybox
+endif
+
 # If we've got iptables enable xtables support for tc
 ifeq ($(BR2_PACKAGE_IPTABLES),y)
 IPROUTE2_DEPENDENCIES += iptables
-- 
1.7.3.4
