From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 21:34:00 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/wireshark:
 security bump to version 2.6.15
Message-ID: <20200314205530.EA28183C96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=944350a5ebc5aea41fc6b5510c28673e62b46e0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

2.6.13:
- CVE-2019-19553: In Wireshark 3.0.0 to 3.0.6 and 2.6.0 to 2.6.12, the CMS
  dissector could crash.  This was addressed in
  epan/dissectors/asn1/cms/packet-cms-template.c by ensuring that an object
  identifier is set to NULL after a ContentInfo dissection.

2.6.15:
- CVE-2020-9428: In Wireshark 3.2.0 to 3.2.1, 3.0.0 to 3.0.8, and 2.6.0 to
  2.6.14, the EAP dissector could crash.  This was addressed in
  epan/dissectors/packet-eap.c by using more careful sscanf parsing.

- CVE-2020-9430: In Wireshark 3.2.0 to 3.2.1, 3.0.0 to 3.0.8, and 2.6.0 to
  2.6.14, the WiMax DLMAP dissector could crash.  This was addressed in
  plugins/epan/wimax/msg_dlmap.c by validating a length field.

- CVE-2020-9431: In Wireshark 3.2.0 to 3.2.1, 3.0.0 to 3.0.8, and 2.6.0 to
  2.6.14, the LTE RRC dissector could leak memory.  This was addressed in
  epan/dissectors/packet-lte-rrc.c by adjusting certain append operations.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 6474e166de..d064600657 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.11.txt
-sha256 29751581c8549562957940e68f0b9410a499616c91c1768195bc02def13f5a85  wireshark-2.6.11.tar.xz
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.15.txt
+sha256 889f94d2e2419afe9fb2c3c552bca165ce144cab413bae99f14b575a4d479638  wireshark-2.6.15.tar.xz
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index bf924cadd1..eb3ca1d339 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.6.11
+WIRESHARK_VERSION = 2.6.15
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
