From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 Feb 2012 14:06:23 +0100
Subject: [Buildroot] [git commit] ipsec-tools: add option for dead peer
	detection support
Message-ID: <20120210130757.21B0B90A56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f37b7823e521f7989f8f35b5182330335ac9e530
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ipsec-tools/Config.in      |    5 +++++
 package/ipsec-tools/ipsec-tools.mk |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 8a5f3d1..d4c62c6 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -33,6 +33,11 @@ config BR2_PACKAGE_IPSEC_TOOLS_FRAG
 	  Enable IKE fragmentation, which is a workaround for
 	  broken routers that drop fragmented packets
 
+config BR2_PACKAGE_IPSEC_TOOLS_DPD
+	bool "Enable DPD (Dead Peer Detection)"
+	help
+	  Enable dead peer detection support
+
 config BR2_PACKAGE_IPSEC_TOOLS_STATS
 	default y
 	bool "Enable statistics logging function."
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 9781f3b..d7f8e35 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -38,6 +38,12 @@ else
 IPSEC_TOOLS_CONF_OPT+= --disable-frag
 endif
 
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_DPD), y)
+IPSEC_TOOLS_CONF_OPT+= --enable-dpd
+else
+IPSEC_TOOLS_CONF_OPT+= --disable-dpd
+endif
+
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_STATS), y)
 IPSEC_TOOLS_CONF_OPT+= --enable-stats
 else
