From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Nov 2018 23:18:28 +0100
Subject: [Buildroot] [git commit] ngrep: fix static build
Message-ID: <20181105222005.8ED72814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16db3937c09e6aaa914e3e05f8472323e2e088a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 54eeb08d6498e54cc77e212e4f9873b579f76638 wrongly replaced
`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs` by
"$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs"

Fixes:
 - http://autobuild.buildroot.org/results/3dd8c768beef075494d6be7eff4cbb57b5ec8a41

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngrep/ngrep.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index 41d08d9f26..d17792cda0 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -13,7 +13,7 @@ NGREP_INSTALL_STAGING = YES
 NGREP_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
-NGREP_CONF_ENV += LIBS="$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs"
+NGREP_CONF_ENV += LIBS=`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 
 NGREP_CONF_OPTS = \
