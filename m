From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu,  9 May 2013 15:22:02 -0700
Subject: [Buildroot] [PATCH 2/2] python-nfc: needs toolchain with threads
	support
In-Reply-To: <1368138122-5950-1-git-send-email-gilles.talis@gmail.com>
References: <1368138122-5950-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1368138122-5950-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-nfc uses libusb that requires a toolchain with threads support

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
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
-- 
1.7.4.1
