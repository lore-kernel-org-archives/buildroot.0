From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:07 +0200
Subject: [Buildroot] [[PATCH v2 07/14] package/mender: select
 BR2_PACKAGE_CA_CERTIFICATES
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-8-mirza.krak@northern.tech>
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

Changes in V2:
- Added #runtime to hint that this not a build dependency

 package/mender/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index aeb0b2694f..853a472ea1 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UBOOT_TOOLS # runtime
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
--
2.11.0
