From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 14:32:08 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/tcpreplay:
 security bump to version 4.3.2
Message-ID: <20190902122759.B91E989064@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4989376f8b7ca5c9cd534cba63df2840e367f24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

This release contains bug fixes only:

 - CVE-2019-8381 memory access in do_checksum() (#538)
 - CVE-2019-8376 NULL pointer dereference get_layer4_v6() (#537)
 - CVE-2019-8377 NULL pointer dereference get_ipv6_l4proto() (#536)
 - Rename Ethereal to Wireshark (#545)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dc2067d51cfdcd839af34f407e286049c989b568)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.hash | 4 ++--
 package/tcpreplay/tcpreplay.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 31b3d3eb28..cc00bc09b1 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.3.1/tcpreplay-4.3.1.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.3.2/tcpreplay-4.3.2.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256 108924a25e616e3465139410c49cae629c338df73443dfc8fc155ea9f099c659  tcpreplay-4.3.1.tar.xz
+sha256 955aed6a40f49a5b8c1234fd0a928edc5c665d94b7755ab5769c30938e33f380  tcpreplay-4.3.2.tar.xz
 sha256 5971b0c544622f4b210a9cc56436a970685d3b0666e373c09e3cf9304db15d05  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 71e57d5bd9..5a62091f82 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.3.1
+TCPREPLAY_VERSION = 4.3.2
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
-TCPREPLAY_SOURCE = tcpreplay-4.3.1.tar.xz
+TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
 TCPREPLAY_CONF_ENV = \
