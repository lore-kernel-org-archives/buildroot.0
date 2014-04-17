From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:54:01 +0200
Subject: [Buildroot] [git commit] openpgm: requires compiler intrinsics not
	available with Blackfin ADI toolchains
Message-ID: <20140417215459.E1D619C845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53e5b44c153321ef125b8bc03ceba8571bbbbe29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/3bd/3bda860a269dd9a4e38533cc9350892c68102618/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openpgm/Config.in |    6 +++++-
 package/zeromq/Config.in  |    3 +++
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
index 8d67639..a9d0cc8 100644
--- a/package/openpgm/Config.in
+++ b/package/openpgm/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_OPENPGM
 	bool "openpgm"
-	depends on !BR2_avr32 # toolchain lacks required intrinsics
+	# The following toolchains lack required compiler intrinsics
+	depends on !BR2_avr32
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index 1c53f7e..a02f4ab 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -32,6 +32,9 @@ if BR2_PACKAGE_ZEROMQ
 config BR2_PACKAGE_ZEROMQ_PGM
 	bool "PGM/EPGM support"
 	depends on !BR2_avr32 # openpgm
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # openpgm
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # openpgm
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 # openpgm
 	select BR2_PACKAGE_OPENPGM
 	help
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)
