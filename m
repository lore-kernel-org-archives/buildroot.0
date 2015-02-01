From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:25:46 +0100
Subject: [Buildroot] [git commit] ipsec-tools: remove useless spaces in
	conditions
Message-ID: <20150201222634.222F8805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0c4ee62c0edad02d2e7d846d8489c625a76d774
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We typically use:

ifeq ($(BR2_...),y)

and not:

ifeq ($(BR2_...), y)

So this commit aligns the ipsec-tools package with this common
practice.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipsec-tools/ipsec-tools.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 56e2bed..9454c4e 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -25,43 +25,43 @@ IPSEC_TOOLS_CONF_OPTS = \
 	  --disable-gssapi \
 	  --with-kernel-headers=$(STAGING_DIR)/usr/include
 
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT), y)
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-adminport
 else
 IPSEC_TOOLS_CONF_OPTS += --disable-adminport
 endif
 
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_NATT), y)
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_NATT),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-natt
 else
 IPSEC_TOOLS_CONF_OPTS += --disable-natt
 endif
 
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_FRAG), y)
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_FRAG),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-frag
 else
 IPSEC_TOOLS_CONF_OPTS += --disable-frag
 endif
 
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_DPD), y)
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_DPD),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-dpd
 else
 IPSEC_TOOLS_CONF_OPTS += --disable-dpd
 endif
 
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_STATS), y)
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_STATS),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-stats
 else
 IPSEC_TOOLS_CONF_OPTS += --disable-stats
 endif
 
-ifneq ($(BR2_PACKAGE_IPSEC_TOOLS_READLINE), y)
+ifneq ($(BR2_PACKAGE_IPSEC_TOOLS_READLINE),y)
 IPSEC_TOOLS_CONF_OPTS += --without-readline
 else
 IPSEC_DEPENDENCIES += readline
 endif
 
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_HYBRID), y)
+ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_HYBRID),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-hybrid
 else
 IPSEC_TOOLS_CONF_OPTS += --disable-hybrid
