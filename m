From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jan 2011 07:56:22 +0100
Subject: [Buildroot] [git commit master 1/1] iptables: remove redundant
	--disable-ipv6
Message-ID: <20110111081431.E05218A4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e012748b25e2f9675aca79ab39de1843ed9b3008
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Is automatically handled by the autotargets infrastructure.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iptables/iptables.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index b06ab71..8652de4 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -12,9 +12,6 @@ IPTABLES_AUTORECONF = YES
 IPTABLES_DEPENDENCIES = host-pkg-config
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
-ifneq ($(BR2_INET_IPV6),y)
-IPTABLES_CONF_OPT += --disable-ipv6
-endif
 
 define IPTABLES_TARGET_SYMLINK_CREATE
 	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables
-- 
1.7.2.2
