From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:33 -0000
Subject: [Buildroot] [git commit branch/next] dnsmasq: host-pkg-config is
	needed for lua support as well
Message-ID: <20120802195232.2B60F96FE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9950d485cd8c16dc84d2e9eca5f4f586c1b717c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.org/results/94d67f02c81639e1586d1c21a7e3b183a6ab50a2

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/dnsmasq.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 2e3575c..4aa7cfb 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -42,11 +42,9 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
-	DNSMASQ_DEPENDENCIES += lua
+	DNSMASQ_DEPENDENCIES += lua host-pkg-config
 	DNSMASQ_MAKE_OPT += LDFLAGS+="-ldl"
-endif
 
-ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
 define DNSMASQ_ENABLE_LUA
 	$(SED) 's/lua5.1/lua/g' $(DNSMASQ_DIR)/Makefile
 	$(SED) 's^.*#define HAVE_LUASCRIPT.*^#define HAVE_LUASCRIPT^' \
