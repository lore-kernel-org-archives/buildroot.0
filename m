From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  6 Nov 2013 19:45:10 +0000
Subject: [Buildroot] [PATCH] avr32: pass target arch to gcc
Message-ID: <1383767110-32444-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

As suggested with Alexander Lukichev and Thomas Petazzoni on the mailing list,
only one of the two avr32 microarchitectures is relevant for Buildroot: avr32
Linux implies the avr32b microarchitecure, as used in the ap7000.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 arch/Config.in.avr32 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
index 199c150..8429589 100644
--- a/arch/Config.in.avr32
+++ b/arch/Config.in.avr32
@@ -3,3 +3,6 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	default "BIG"
+
+config BR2_GCC_TARGET_ARCH
+	default "ap"
-- 
1.8.3.2
