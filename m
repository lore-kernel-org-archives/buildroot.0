From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 31 Jan 2016 10:26:30 -0300
Subject: [Buildroot] [PATCH] Revert "package/openvpn: bump version to 2.3.10"
Message-ID: <1454246790-8381-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openvpn 2.3.10 doesn't work with polarssl 1.2.x, hence this bump breaks
builds for the polarssl backend.

This reverts commit 06f3e7904f13ec08492fcc7f6e7287a90eac6347.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openvpn/openvpn.hash | 4 ++--
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 7197258..4ab916e 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	c54dbf91d47b9533fac3b94d2b5719bdbe0d081fe8245184f91ef8a871d22003	openvpn-2.3.10.tar.xz
+# Locally calculated after checking pgp signature
+sha256	52f16bef3a02369682f1464fbd2821070c98d0bd993f4c46c764e87375abdcc1 	openvpn-2.3.9.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 5565e59..58da86b 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.10
+OPENVPN_VERSION = 2.3.9
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
-- 
2.4.10
