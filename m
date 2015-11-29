From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:30:34 +0100
Subject: [Buildroot] [git commit] libnet: disable for musl toolchains
Message-ID: <20151201232124.4EE4C821F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0e6d657d48487081db2738b93fa8b33ec1e2c7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnet/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libnet/Config.in b/package/libnet/Config.in
index 7186972..8a88128 100644
--- a/package/libnet/Config.in
+++ b/package/libnet/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_LIBNET
 	bool "libnet"
+	# Build with musl fails due to header issues
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  libnet provides a portable framework for low-level network
 	  packet construction.
 
 	  http://sourceforge.net/projects/libnet-dev
+
+comment "libnet needs a (e)glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
