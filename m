From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Jan 2011 14:41:24 -0300
Subject: [Buildroot] [PATCH 3/4] iptables: install to staging
In-Reply-To: <1294681285-1205-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294681285-1205-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294681285-1205-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install iptables to staging so we can build iproute2 with filtering.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iptables/iptables.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 1ec2c85..b06ab71 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -3,9 +3,12 @@
 # iptables
 #
 #############################################################
+
 IPTABLES_VERSION = 1.4.10
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
+IPTABLES_INSTALL_STAGING = YES
+IPTABLES_AUTORECONF = YES
 IPTABLES_DEPENDENCIES = host-pkg-config
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
@@ -13,8 +16,6 @@ ifneq ($(BR2_INET_IPV6),y)
 IPTABLES_CONF_OPT += --disable-ipv6
 endif
 
-IPTABLES_AUTORECONF = YES
-
 define IPTABLES_TARGET_SYMLINK_CREATE
 	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables
 	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables-save
-- 
1.7.3.4
