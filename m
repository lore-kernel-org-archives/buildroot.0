From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 2 Feb 2011 22:44:21 +0100
Subject: [Buildroot] [git commit master 1/1] dnsmasq: idn support requires
	wchar
Message-ID: <20110202214454.15F468F34A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=126a2e75f5948b30f842862906fca8ed99ffff26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

IDN support requires wchar, otherwise libintl will fail to build.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index a8d0d9a..e9c4870 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_DNSMASQ_DHCP
 config BR2_PACKAGE_DNSMASQ_IDN
 	bool "IDN support (BIG!)"
 	depends on BR2_PACKAGE_DNSMASQ
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBINTL
 	select BR2_PACKAGE_LIBIDN
 	help
-- 
1.7.3.4
