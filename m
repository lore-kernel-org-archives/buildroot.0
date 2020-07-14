From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:16:23 +0200
Subject: [Buildroot] [git commit] package/keepalived: drop --{en,
 dis}able-libiptc option
Message-ID: <20200714131237.6102A85F6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fcee496df262fcc304ad22738441df35a960a67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--{en,dis}able-libiptc has been dropped since version 2.1.0 and
https://github.com/acassen/keepalived/commit/05443e1efa3569fcd39a548c6c78b832b79bcf4e

So replace it by --{en,dis}able-iptables

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keepalived/keepalived.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 2c78b2d811..df1ab6d306 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -41,9 +41,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_IPTABLES),y)
 KEEPALIVED_DEPENDENCIES += iptables
-KEEPALIVED_CONF_OPTS += --enable-libiptc
+KEEPALIVED_CONF_OPTS += --enable-iptables
 else
-KEEPALIVED_CONF_OPTS += --disable-libiptc
+KEEPALIVED_CONF_OPTS += --disable-iptables
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNFTNL),y)
