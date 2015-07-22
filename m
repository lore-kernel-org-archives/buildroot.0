From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:08:20 +0200
Subject: [Buildroot] [git commit] setools: Disable on Blackfin and NIOS II
Message-ID: <20150722151033.BF62881EA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=140c0a4abcb455f9f3599fcd112d0f0a7d09dc69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The setools package is not currently building on either the NIOS II or
the Blackfin architectures. Disabling for now.

Fixes:
http://autobuild.buildroot.net/results/2ee84c0dc027912e059ca4ae518d6f11fd8317a7/
http://autobuild.buildroot.net/results/401e4c48f4d865b2722f284f1038e25c5d420f43/
http://autobuild.buildroot.net/results/e67ef47ea9ff4cbb012d374b3b290fb7bddf7ef3/

[Thomas: add comment explaining the dependencies.]

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/setools/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 7c85af6..981d64b 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -7,6 +7,10 @@ config BR2_PACKAGE_SETOOLS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
+	# bfin: infamous _ symbol prefix issue
+	# nios2: triggers some toolchain issue "No symbol version
+	# section for versioned symbol"
+	depends on !BR2_nios2 && !BR2_bfin
 	help
 	  SETools is an open source project designed to facilitate
 	  SELinux policy analysis. The primary tools are:
@@ -23,3 +27,4 @@ config BR2_PACKAGE_SETOOLS
 comment "setools needs a toolchain w/ threads, C++, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_nios2 && !BR2_bfin
