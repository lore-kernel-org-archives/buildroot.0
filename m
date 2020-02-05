From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 20:33:36 +0100
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 3.2.1
Message-ID: <20200205192331.8CAC28D373@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d08154442f4480aec04575c8421e86b922463f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes CVE-2020-7044:
In Wireshark 3.2.x before 3.2.1, the WASSP dissector could crash.
This was addressed in epan/dissectors/packet-wassp.c by using
>= and <= to resolve off-by-one errors.

Also change the hash file to the new spacing convention introduced
by Yann E. Morin.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/wireshark.hash | 8 ++++----
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 5635f2525b..65406b3001 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.0.txt
-sha1 6c7d9784809fb16b57ca557864f78509aaf4f82a wireshark-3.2.0.tar.xz
-sha256 4cfd33a19a454ff4002243e9d04d6afd64280a109a21ae652a192f2be2b1b66c wireshark-3.2.0.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.1.txt
+sha1  d0b8eb3e01264afb98ec151d7114ed14cf174ced  wireshark-3.2.1.tar.xz
+sha256  589f640058d6408ebbd695a80ebbd6e7bd99d8db64ecda253d27100dfd27e85b  wireshark-3.2.1.tar.xz
 
 # Locally calculated
-sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
+sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c365a9feec..1e71fe755d 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.0
+WIRESHARK_VERSION = 3.2.1
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
