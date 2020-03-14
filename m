From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:25:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/dnsmasq: drop
 wchar dependency on IDN option
Message-ID: <20200314171827.52FB9837B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c6bf83800db07235afe16c455d2e14cd1745ee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

wchar dependency on IDN option has been added with commit
126a2e75f5948b30f842862906fca8ed99ffff26 because of libintl

However libintl dependency has been dropped with commit
bbcbed1829057121f9f9459f62f913626206e823 so remove unneeded wchar
dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a895bd3426d3f80327600becdc40e46ae6c33a40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
