From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Feb 2011 09:22:24 -0300
Subject: [Buildroot] [PATCH 5/5] dnsmasq: idn support requires wchar
In-Reply-To: <1296649344-12456-1-git-send-email-gustavo@zacarias.com.ar>
References: <1296649344-12456-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1296649344-12456-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

IDN support requires wchar, otherwise libintl will fail to build.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
