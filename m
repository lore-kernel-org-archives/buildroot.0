From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 15:36:11 +0100
Subject: [Buildroot] [git commit] package/tpm2-tss: rename tpm2-tss
 libraries in the help text
Message-ID: <20190309203433.42AA48E2C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb9c137660aaa8751d67862b3dd8ef14d80b7b08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since tpm2-tss version 2.0.0, tpm2 libraries have been renamed.

libsapi renamed to libtss2-sys
https://github.com/tpm2-software/tpm2-tss/commit/5f0ab55d4e46077cb8f0c53a76c5ebd15a088d26

libtcti-device renamed to libtss2-tcti-device
libtcti-socket renamed to libtss2-tcti-mssim
https://github.com/tpm2-software/tpm2-tss/commit/b8584accbd96e38eaea250e31ed3ea580d2bca27

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-tss/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 2fb5b0f213..2d619750f8 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_TPM2_TSS
 	    variants may be useful for integration into event-driven
 	    programming environments. Both the synchronous and
 	    asynchronous API are exposed through a single library:
-	    libsapi.
+	    libtss2-sys.
 
 	  * TPM Command Transmission Interface (TCTI) that is described
 	    in the same specification. This API provides a standard
@@ -26,10 +26,10 @@ config BR2_PACKAGE_TPM2_TSS
 	    implementing the TCTI API will be implemented as a way to
 	    abstract various platform specific IPC mechanisms. Currently
 	    this repository provides two TCTI implementations:
-	    libtcti-device and libtcti-socket.  The prior should be used
-	    for direct access to the TPM through the Linux kernel
-	    driver. The later implements the protocol exposed by the
-	    Microsoft software TPM2 simulator.
+	    libtss2-tcti-device and libtss2-tcti-mssim. The prior should
+	    be used for direct access to the TPM through the Linux
+	    kernel driver. The later implements the protocol exposed by
+	    the Microsoft software TPM2 simulator.
 
 	  https://github.com/tpm2-software/tpm2-tss
 
