From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:26:58 +0100
Subject: [Buildroot] [git commit] package/ssdp-responder: fix CPE variables
Message-ID: <20210125201144.A78A98384E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8beee9309f3c02d4b073fb952746e86109a5df7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:simple_service_discovery_protocol_responder_project:simple_service_discovery_protocol_responder
is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asimple_service_discovery_protocol_responder_project%3Asimple_service_discovery_protocol_responder

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ssdp-responder/ssdp-responder.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index f2478e99b1..3fee4c2006 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -8,7 +8,9 @@ SSDP_RESPONDER_VERSION = 1.8
 SSDP_RESPONDER_SITE = https://github.com/troglobit/ssdp-responder/releases/download/v$(SSDP_RESPONDER_VERSION)
 SSDP_RESPONDER_LICENSE = ISC
 SSDP_RESPONDER_LICENSE_FILES = LICENSE
-SSDP_RESPONDER_CPE_ID_VENDOR = troglobit
+SSDP_RESPONDER_CPE_ID_VENDOR = \
+	simple_service_discovery_protocol_responder_project
+SSDP_RESPONDER_CPE_ID_PRODUCT = simple_service_discovery_protocol_responder
 SSDP_RESPONDER_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
