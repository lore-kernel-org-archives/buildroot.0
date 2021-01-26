From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jan 2021 18:25:26 +0100
Subject: [Buildroot] [PATCH 2/2] package/gerbera: needs xpath in pugixml
In-Reply-To: <20210126172526.2133034-1-fontaine.fabrice@gmail.com>
References: <20210126172526.2133034-1-fontaine.fabrice@gmail.com>
Message-ID: <20210126172526.2133034-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/0fcd0ce167c04f788bf1b9414ae5e7677691c7cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gerbera/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 5025b3753f..a07bcc5c57 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_GERBERA
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBUPNP if !BR2_PACKAGE_LIBNPUPNP
 	select BR2_PACKAGE_PUGIXML
+	select BR2_PACKAGE_PUGIXML_XPATH_SUPPORT
 	select BR2_PACKAGE_SPDLOG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
-- 
2.29.2
