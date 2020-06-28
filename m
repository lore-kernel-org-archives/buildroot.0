From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 28 Jun 2020 12:01:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: drop --{en,
 dis}able-libiptc option
Message-ID: <20200628100122.257040-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--{en,dis}able-libiptc has been dropped since version 2.1.0 and
https://github.com/acassen/keepalived/commit/05443e1efa3569fcd39a548c6c78b832b79bcf4e

So replace it by --{en,dis}able-iptables

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keepalived/keepalived.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index f2b5206419..803d111293 100644
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
-- 
2.26.2
