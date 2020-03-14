From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 20:19:00 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/wireshark:
 security bump to version 3.0.9
Message-ID: <20200314192101.1489E83C10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9b907b9882d29df6f1b6cd869698bb53b483c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security issues:

3.0.7:
- CVE-2019-19553: In Wireshark 3.0.0 to 3.0.6 and 2.6.0 to 2.6.12, the CMS
  dissector could crash.  This was addressed in
  epan/dissectors/asn1/cms/packet-cms-template.c by ensuring that an object
  identifier is set to NULL after a ContentInfo dissection.

3.0.8:
- CVE-2020-7045: In Wireshark 3.0.x before 3.0.8, the BT ATT dissector could
  crash.  This was addressed in epan/dissectors/packet-btatt.c by validating
  opcodes.

3.0.9:
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
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 403def6460..6671da8b71 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.5.txt
-sha1 82883e96ee247d3fcacb0cafa0bed9112824ee3a wireshark-3.0.5.tar.xz
-sha256 c551fce475c49cea317ccbf9d22404bc827dde9cee0ccdf6648bfed3ecd9f820 wireshark-3.0.5.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.9.txt
+sha1 60d5dfeac1b75d813ffee049ca3fd393e9c9890f wireshark-3.0.9.tar.xz
+sha256 bb4697ead91824b1fa33ffbe6643f6193459a66c906910a7611d5b26ff32aa04 wireshark-3.0.9.tar.xz
 
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1be6a4e81c..a17d0ca170 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.0.5
+WIRESHARK_VERSION = 3.0.9
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
