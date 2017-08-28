From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Aug 2017 20:56:35 +0300
Subject: [Buildroot] [PATCH] dnsmasq: fix build without NLS
Message-ID: <ac762b8a4d2444aa2a914c80e419fab74b5a735a.1503942995.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dnsmasq i18n support requires NLS for the provided gettext utilities.
Locale support, OTOH, is not required.

Fixes:
http://autobuild.buildroot.net/results/d45/d453aff1ce1f5e1d380bd7692a4a0565505027a3/
http://autobuild.buildroot.net/results/fb7/fb7844a239472eb48c18778aa7d515552ccfb4b9/
http://autobuild.buildroot.net/results/d85/d856ec3e6b28bd723176bb892a56dff5262a6b92/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dnsmasq/dnsmasq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 00a59dac0113..63295ce41090 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -35,7 +35,7 @@ ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
 DNSMASQ_DEPENDENCIES += libidn $(TARGET_NLS_DEPENDENCIES)
 DNSMASQ_MAKE_OPTS += LIBS+=$(TARGET_NLS_LIBS)
 DNSMASQ_COPTS += -DHAVE_IDN
-DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
+DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
-- 
2.14.1
