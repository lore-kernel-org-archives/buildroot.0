From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Oct 2017 10:08:59 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] dnsmasq: security bump to
	version 2.78
Message-ID: <20171003080408.CFE0580FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad0eab0037892669cad24c19a813fa2d0be3a5cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Supported Lua version is now 5.2.

Add licenses hash.

Fixes a number of security issues:

CVE-2017-13704 - Crash when DNS query exceeded 512 bytes (a regression
in 2.77, so technically not fixed by this bump)

CVE-2017-14491 - Heap overflow in DNS code

CVE-2017-14492 - Heap overflow in IPv6 router advertisement code

CVE-2017-14493 - Stack overflow in DHCPv6 code

CVE-2017-14494 - Information leak in DHCPv6

CVE-2017-14496 - Invalid boundary checks allows a malicious DNS queries
to trigger DoS

CVE-2017-14495 - Out-of-memory Dos vulnerability

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e77fdc90e320ff38d56d8e5c97fc783e8fbb76bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dnsmasq/dnsmasq.hash | 6 +++++-
 package/dnsmasq/dnsmasq.mk   | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index a73e911..28e2e65 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	4b92698dee19ca0cb2a8f2e48f1d2dffd01a21eb15d1fbed4cf085630c8c9f96	dnsmasq-2.76.tar.xz
+# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.78.tar.xz.asc
+sha256	89949f438c74b0c7543f06689c319484bd126cc4b1f8c745c742ab397681252b	dnsmasq-2.78.tar.xz
+# Locally calculated
+sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index e8240b9..18216a6 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.76
+DNSMASQ_VERSION = 2.78
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
@@ -58,7 +58,7 @@ DNSMASQ_MAKE_OPTS += LIBS+="-ldl"
 endif
 
 define DNSMASQ_ENABLE_LUA
-	$(SED) 's/lua5.1/lua/g' $(DNSMASQ_DIR)/Makefile
+	$(SED) 's/lua5.2/lua/g' $(DNSMASQ_DIR)/Makefile
 	$(SED) 's^.*#define HAVE_LUASCRIPT.*^#define HAVE_LUASCRIPT^' \
 		$(DNSMASQ_DIR)/src/config.h
 endef
