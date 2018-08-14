From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 01:13:36 +0200
Subject: [Buildroot] [PATCH 7/8] package/mender: select
 BR2_PACKAGE_CA_CERTIFICATES
In-Reply-To: <20180814231337.19114-1-mirza.krak@northern.tech>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
Message-ID: <20180814231337.19114-8-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mender uses TLS to community with the management server,
and if CA signed certificates are used we must have
the ca-certificates package installed to be able to
verify these.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/mender/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 6fa9079b1d..f5a1a74110 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_UBOOT_TOOLS
 	depends on BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
+	select BR2_PACKAGE_CA_CERTIFICATES
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
-- 
2.18.0
