From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 20:10:50 +0100
Subject: [Buildroot] [git commit] package/keepalived: add optional libnftnl
 dependency
Message-ID: <20190327190725.F3DAA880D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab3673d99b59d8cb6fb062a7b893a25b08d85f65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nftables support has been added since version 2.0.11 and
https://github.com/acassen/keepalived/commit/aa12175ea638912a7789e832634d7ccf80fdf48d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keepalived/keepalived.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index fcdb43ce13..15a1b0e9f4 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -46,4 +46,11 @@ else
 KEEPALIVED_CONF_OPTS += --disable-libiptc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNFTNL),y)
+KEEPALIVED_DEPENDENCIES += libnftnl
+KEEPALIVED_CONF_OPTS += --enable-nftables
+else
+KEEPALIVED_CONF_OPTS += --disable-nftables
+endif
+
 $(eval $(autotools-package))
