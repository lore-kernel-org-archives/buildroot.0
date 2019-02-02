From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Feb 2019 15:00:13 +0100
Subject: [Buildroot] [git commit] package/aircrack-ng: add optional cmocka
 dependency
Message-ID: <20190202135913.B3BEC81171@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62af09f313a455f781594b3184fd3a52213c341e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cmocka dependency has been added in version 1.3 with
https://github.com/aircrack-ng/aircrack-ng/commit/e3a3a6db30ca99c2473928621a1ba234abcaebf3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aircrack-ng/aircrack-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index b51332ab77..64dc15a4aa 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -9,6 +9,7 @@ AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
 AIRCRACK_NG_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_CMOCKA),cmocka) \
 	$(if $(BR2_PACKAGE_LIBNL),libnl) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_PCRE),pcre) \
