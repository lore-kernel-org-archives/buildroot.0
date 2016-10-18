From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Oct 2016 14:26:30 +0300
Subject: [Buildroot] [PATCH 1/3] wireshark: use https for download and
	homepage link
Message-ID: <a6f0bcffe24a338538c4da2f04091967593fa058.1476789992.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Saves a redirect.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wireshark/Config.in    | 2 +-
 package/wireshark/wireshark.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index defeb4b3e479..4982c1f8d53d 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_WIRESHARK
 	help
 	  Network traffic sniffer and protocol decoder.
 
-	  http://www.wireshark.org
+	  https://www.wireshark.org
 
 comment "wireshark needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 8dc72da940d7..e71b419d8773 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -6,7 +6,7 @@
 
 WIRESHARK_VERSION = 2.2.1
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
-WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
+WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
 WIRESHARK_DEPENDENCIES = host-pkgconf libpcap libglib2
-- 
2.9.3
