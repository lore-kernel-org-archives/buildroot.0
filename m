From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 May 2013 20:40:15 +0200
Subject: [Buildroot] [git commit] python-nfc: needs toolchain with threads
	support
Message-ID: <20130510184444.7D02399C3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee377acd8713330e54ef62babbc0b4a5c040446a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-nfc uses libusb that requires a toolchain with threads support

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python-nfc/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
index c928ba1..dc46d6c 100644
--- a/package/python-nfc/Config.in
+++ b/package/python-nfc/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_PYTHON_NFC
 	bool "python-nfc"
 	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  Python module for near field communication.
 
 	  https://launchpad.net/nfcpy
+
+comment "python-nfc requires a toolchain with threads support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
