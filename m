From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:58:59 +0100
Subject: [Buildroot] [git commit] package/keepalived: drop autoreconf
Message-ID: <20190318215558.E59B6890D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5068a6838150be65d3381a0b1de744a7ec126983
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 78d4ddbf3b416885d2e99b32363b174755f9bb30 removed all patches so
autoreconf is not needed anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keepalived/keepalived.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index fc6b01521d..fcdb43ce13 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -10,8 +10,6 @@ KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CONF_OPTS = --disable-hardening
-# We're patching configure.ac
-KEEPALIVED_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
