From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 Aug 2020 23:10:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: security bump to
 version 3.3.4
Message-ID: <20200827211003.217299-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2019-5163: An exploitable denial-of-service vulnerability
  exists in the UDPRelay functionality of Shadowsocks-libev 3.3.2. When
  utilizing a Stream Cipher and a local_address, arbitrary UDP packets
  can cause a FATAL error code path and exit. An attacker can send
  arbitrary UDP packets to trigger this vulnerability.
- Fix CVE-2019-5164: An exploitable code execution vulnerability exists
  in the ss-manager binary of Shadowsocks-libev 3.3.2. Specially crafted
  network packets sent to ss-manager can cause an arbitrary binary to
  run, resulting in code execution and privilege escalation. An attacker
  can send network packets to trigger this vulnerability.

Also update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/shadowsocks-libev/shadowsocks-libev.hash | 8 ++++----
 package/shadowsocks-libev/shadowsocks-libev.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index 76928ebb48..cc7993a54f 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha256 677356a5ed6b5ae9e32a898061db2587158ff27e245db03f4bde9b006ef12dc9 shadowsocks-libev-3.3.3.tar.gz
+sha256  fce47a956fad0c30def9c71821bcec450a40d3f881548e31e66cedf262b89eb1  shadowsocks-libev-3.3.4.tar.gz
 
 # License files, locally calculated
-sha256 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
-sha256 c41a4bc2c4c43e4daa3051e77e31b2d5c8500498afaeac6d831d55a4bb8de3fb  libbloom/LICENSE
-sha256 4fa2ada54f8c0410ec243265378242ffe862386d5ac517f8dd30a1911d25ae93  libcork/COPYING
+sha256  736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
+sha256  c41a4bc2c4c43e4daa3051e77e31b2d5c8500498afaeac6d831d55a4bb8de3fb  libbloom/LICENSE
+sha256  4fa2ada54f8c0410ec243265378242ffe862386d5ac517f8dd30a1911d25ae93  libcork/COPYING
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 4b0b963eef..3ba4cb875c 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOWSOCKS_LIBEV_VERSION = 3.3.3
+SHADOWSOCKS_LIBEV_VERSION = 3.3.4
 SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
-- 
2.28.0
