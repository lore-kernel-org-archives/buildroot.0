From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Mar 2020 22:49:45 +0100
Subject: [Buildroot] [git commit] package/wireshark: security bump to v3.2.2
Message-ID: <20200302213852.5E62E8F138@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d4a99d56e10bb7b159658dd050a7519e9d98968
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following CVEs:
 - CVE-2020-9428:
   In Wireshark 3.2.0 to 3.2.1, 3.0.0 to 3.0.8, and 2.6.0 to 2.6.14,
   the EAP dissector could crash. This was addressed in
   epan/dissectors/packet-eap.c by using more careful sscanf parsing.

 - CVE-2020-9429:
   In Wireshark 3.2.0 to 3.2.1, the WireGuard dissector could crash.
   This was addressed in epan/dissectors/packet-wireguard.c by
   handling the situation where a certain data structure intentionally
   has a NULL value.

 - CVE-2020-9430:
   In Wireshark 3.2.0 to 3.2.1, 3.0.0 to 3.0.8, and 2.6.0 to 2.6.14,
   the WiMax DLMAP dissector could crash.
   This was addressed in plugins/epan/wimax/msg_dlmap.c by validating
   a length field.

 - CVE-2020-9431:
   In Wireshark 3.2.0 to 3.2.1, 3.0.0 to 3.0.8, and 2.6.0 to 2.6.14,
   the LTE RRC dissector could leak memory. This was addressed in
   epan/dissectors/packet-lte-rrc.c by adjusting certain append operations.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 65406b3001..8b8261840a 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.1.txt
-sha1  d0b8eb3e01264afb98ec151d7114ed14cf174ced  wireshark-3.2.1.tar.xz
-sha256  589f640058d6408ebbd695a80ebbd6e7bd99d8db64ecda253d27100dfd27e85b  wireshark-3.2.1.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.2.txt
+sha1  9cc54a56e9c2ed77e1bc436d9ae2f7bba68d26f8  wireshark-3.2.2.tar.xz
+sha256  5f5923ef4c3fee370ed0ca1bb324f37c246015eba4a7e74ab95d9208feeded79  wireshark-3.2.2.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1e71fe755d..ead6b164ed 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.1
+WIRESHARK_VERSION = 3.2.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
