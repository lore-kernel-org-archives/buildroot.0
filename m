From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jun 2016 16:48:39 +0200
Subject: [Buildroot] [git commit] dhcpcd: security bump to version 6.11.0
Message-ID: <20160614144910.EECAC807E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=806249cb7a204d19bbe8d63f80b9a55ea453e700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-7913: The print_option function in dhcp-common.c in dhcpcd
through 6.10.2 misinterprets the return value of the snprintf function, which
allows remote DHCP servers to execute arbitrary code or cause a denial of
service (memory corruption) via a crafted message.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.hash | 2 +-
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index ea05f86..7d01ab8 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	284abf8c3be0580bbac5eaca95359346ab0d78d4072317b6ce87cc68f2e8ae7b	dhcpcd-6.10.1.tar.xz
+sha256	31c2cd327657f11c427fe5044f74c5b942e70450fa43ceabf4b25f3fd4999959	dhcpcd-6.11.0.tar.xz
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 5d1388d..0cb9118 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.10.1
+DHCPCD_VERSION = 6.11.0
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
