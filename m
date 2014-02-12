From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Feb 2014 18:34:03 +0100
Subject: [Buildroot] [PATCH] package/elfutils: disable for avr32
Message-ID: <1392226443-10660-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Disable elfutils for avr32, because:
  - elfutils uses canonicalize_file_name, which came after uClibc-0.9.31.
  - avr32 uses a toolchain with uClibc-0.9.31

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 47cd63d..588c29d 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -7,6 +7,9 @@ config BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	# canonicalize_file_name() not available on uClibc 0.9.31, used
+	# only for AVR32
+	depends on !BR2_avr32
 	help
 	  Libraries/utilities to handle ELF objects (drop in
 	  replacement for libelf).
-- 
1.8.1.2
