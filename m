From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Fri, 10 Dec 2010 16:45:10 +0300
Subject: [Buildroot] [PATCH 1/2] iptables: Install libs and headers to the
	staging dir
Message-ID: <1291988711-8162-1-git-send-email-serj.kalichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The iproute2 can use iptables libraries and headers.

Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
---
 package/iptables/iptables.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 1ec2c85..9fa6298 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -7,6 +7,7 @@ IPTABLES_VERSION = 1.4.10
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_DEPENDENCIES = host-pkg-config
+IPTABLES_INSTALL_STAGING = YES
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
 ifneq ($(BR2_INET_IPV6),y)
-- 
1.7.3.3
