From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 14:37:59 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] openvpn: security bump to
	version 2.4.3
Message-ID: <20170626123813.01A927FFDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdd420350ab77bb576476f5526d523cfc5d47816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes:

CVE-2017-7508 - Remotely-triggerable ASSERT() on malformed IPv6 packet

CVE-2017-7520 - Pre-authentication remote crash/information disclosure for
clients

CVE-2017-7521 - Potential double-free in --x509-alt-username

CVE-2017-7521 - Remote-triggerable memory leaks

CVE-2017-7522 - Post-authentication remote DoS when using the --x509-track
option

Details at

  https://community.openvpn.net/openvpn/wiki/VulnerabilitiesFixedInOpenVPN243

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 24f2eb1e157e2c0b08579939c293aa7c1d3d0c28)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 4 ++--
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index fe054e9..1db3a31 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 df5c4f384b7df6b08a2f6fa8a84b9fd382baf59c2cef1836f82e2a7f62f1bff9  openvpn-2.4.2.tar.xz
+# Locally calculated after checking signature
+sha256 15e15fc97f189b52aee7c90ec8355aa77469c773125110b4c2f089abecde36fb  openvpn-2.4.3.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 34b0e4b..31b6e00 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.2
+OPENVPN_VERSION = 2.4.3
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
