From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 22:05:04 +0200
Subject: [Buildroot] [git commit] dnsmasq: bump to version 2.63
Message-ID: <20120920205953.8A2D999670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a3ceeed719d54fc664f3d4909e0f693d43a34b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/dnsmasq.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index e92a554..203a2e2 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,11 +4,13 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.62
+DNSMASQ_VERSION = 2.63
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
 DNSMASQ_MAKE_OPT += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
+DNSMASQ_LICENSE = Dual GPLv2/GPLv3
+DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 
 ifneq ($(BR2_INET_IPV6),y)
 	DNSMASQ_COPTS += -DNO_IPV6
