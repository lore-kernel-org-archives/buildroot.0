From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:57:45 +0100
Subject: [Buildroot] [git commit] tpm2-abrmd: declare dependency on a
 toolchain with C++
Message-ID: <20180322230316.B9E8A838A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=003269a6692d146ca9c8a94f965244cf11f58738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It depends on tpm2-tss, whose current version contains C++ code.

[Peter: add dependency to config option]
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
index 31c5ae7d6b..25c27c0abb 100644
--- a/package/tpm2-abrmd/Config.in
+++ b/package/tpm2-abrmd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_ABRMD
 	bool "tpm2-abrmd"
+	depends on BR2_INSTALL_LIBSTDCPP # tpm2-tss
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
@@ -20,6 +21,7 @@ config BR2_PACKAGE_TPM2_ABRMD
 
 	  https://github.com/tpm2-software/tpm2-abrmd
 
-comment "tpm2-abrmd needs a toolchain w/ wchar, threads"
+comment "tpm2-abrmd needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
