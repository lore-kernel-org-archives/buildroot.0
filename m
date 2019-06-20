From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 15:58:22 +0200
Subject: [Buildroot] [git commit] package/dnsmasq: drop wchar dependency on
 IDN option
Message-ID: <20190620135752.5AB42822B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a895bd3426d3f80327600becdc40e46ae6c33a40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wchar dependency on IDN option has been added with commit
126a2e75f5948b30f842862906fca8ed99ffff26 because of libintl

However libintl dependency has been dropped with commit
bbcbed1829057121f9f9459f62f913626206e823 so remove unneeded wchar
dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dnsmasq/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 262aca688e..cec68a9eba 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -29,7 +29,6 @@ config BR2_PACKAGE_DNSMASQ_DNSSEC
 
 config BR2_PACKAGE_DNSMASQ_IDN
 	bool "IDN support"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBIDN
 	help
 	  Enable IDN support in dnsmasq.
