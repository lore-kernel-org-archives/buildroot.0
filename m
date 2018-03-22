From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:50:42 +0100
Subject: [Buildroot] [git commit] tpm2-tss: declare dependency on a
 toolchain with C++
Message-ID: <20180322230316.97A9E838A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=319078d5dec8388f13a863546cf7ee2d79880d98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 1.4.0 still contains some C++ code. This has already changed on
upstream, so future versions will drop the dependency on a C++ compiler.

[Peter: fix indentation, add dependency to config option]
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index ebf0fd262d..7a757bd70a 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBURIPARSER
 	help
 	  OSS implementation of the Trusted Computing Group's (TCG) TPM2
@@ -29,3 +30,6 @@ config BR2_PACKAGE_TPM2_TSS
 	    Microsoft software TPM2 simulator.
 
 	  https://github.com/tpm2-software/tpm2-tss
+
+comment "tpm2-tss needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
