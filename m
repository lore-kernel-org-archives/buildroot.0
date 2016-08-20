From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 16:07:57 +0200
Subject: [Buildroot] [git commit branch/next] glibc: add version 2.24
Message-ID: <20160820140947.B6D7C8211A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c69921eced469ade6c98a6c1c9771ebc3d67beb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/Config.in  | 12 ++++++++++++
 package/glibc/glibc.hash |  1 +
 2 files changed, 13 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index f86822d..de95cb2 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -22,6 +22,17 @@ config BR2_GLIBC_VERSION_2_23
 	# No support for pthread barriers on < v9 ISA
 	depends on !BR2_sparc
 
+config BR2_GLIBC_VERSION_2_24
+	bool "2.24"
+	# No support for pthread barriers on < v9 ISA
+	depends on !BR2_sparc
+	# Linux 3.2 or later kernel headers are required on all arches.
+	# See: https://sourceware.org/ml/libc-alpha/2016-08/msg00212.html
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+
+comment "glibc-2.24 needs kernel headers >= 3.2"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+
 endchoice
 
 endif
@@ -30,3 +41,4 @@ config BR2_GLIBC_VERSION_STRING
 	string
 	default "2.22" if BR2_GLIBC_VERSION_2_22
 	default "2.23" if BR2_GLIBC_VERSION_2_23
+	default "2.24" if BR2_GLIBC_VERSION_2_24
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 052f281..befe80c 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,3 +1,4 @@
 # Locally calculated after checking pgp signature (glibc)
 sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
 sha256	94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9	glibc-2.23.tar.xz
+sha256	99d4a3e8efd144d71488e478f62587578c0f4e1fa0b4eed47ee3d4975ebeb5d3	glibc-2.24.tar.xz
