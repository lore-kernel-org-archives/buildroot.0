From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 18 Dec 2020 23:15:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 3.4.2
Message-ID: <20201218221541.625712-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following vulnerabilities have been fixed:
 - wnpa-sec-2020-16 Kafka dissector memory leak. Bug 16739.
   CVE-2020-26418.
 - wnpa-sec-2020-17 USB HID dissector crash. Bug 16958. CVE-2020-26421.
 - wnpa-sec-2020-18 RTPS dissector memory leak. Bug 16994.
   CVE-2020-26420.
 - wnpa-sec-2020-19 Multiple dissector memory leak. Bug 17032.
   CVE-2020-26419.
 - wnpa-sec-2020-20 QUIC dissector crash Bug 17073.

https://www.wireshark.org/docs/relnotes/wireshark-3.4.1.html
https://www.wireshark.org/docs/relnotes/wireshark-3.4.2.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 667d8a371e..b0e7687e1b 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.0.txt
-sha1  6fdf4f394c287f1e21b48c5293ec1a6e6b627996  wireshark-3.4.0.tar.xz
-sha256  67e4ebbd9153fc589fd67dc21b93176674c73adc3d5a43934c3ac69d8594a8ae  wireshark-3.4.0.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.2.txt
+sha1  b33276e4e6c3d6a057da3b569b58316330a5f3e3  wireshark-3.4.2.tar.xz
+sha256  de9868729e426a469baabd8d444240d84fa5445020e92c842dd19afd0d47a4c4  wireshark-3.4.2.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 567c8cc115..84dfe74948 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.0
+WIRESHARK_VERSION = 3.4.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.29.2
