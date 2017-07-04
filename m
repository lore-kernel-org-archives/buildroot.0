From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 14:23:15 +0200
Subject: [Buildroot] [git commit] libmad: add security patch from debian
Message-ID: <20170704122032.2DB3881E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6369a06150b9a2991807c0418a7f0a865ef6c084
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

CVE-2017-8372 - The mad_layer_III function in layer3.c in Underbit MAD
libmad 0.15.1b, if NDEBUG is omitted, allows remote attackers to cause a
denial of service (assertion failure and application exit) via a crafted
audio file.

CVE-2017-8373 - The mad_layer_III function in layer3.c in Underbit MAD
libmad 0.15.1b allows remote attackers to cause a denial of service
(heap-based buffer overflow and application crash) or possibly have
unspecified other impact via a crafted audio file.

CVE-2017-8374 - The mad_bit_skip function in bit.c in Underbit MAD libmad
0.15.1b allows remote attackers to cause a denial of service (heap-based
buffer over-read and application crash) via a crafted audio file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmad/libmad.hash | 1 +
 package/libmad/libmad.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/libmad/libmad.hash b/package/libmad/libmad.hash
index 1e55556..173399f 100644
--- a/package/libmad/libmad.hash
+++ b/package/libmad/libmad.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690  libmad-0.15.1b.tar.gz
+sha256  0e21f2c6b19337d0b237dacc04f7b90a56be7f359f4c9a2ee0b202d9af0cfa69  frame_length.diff
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 0bb64da..0729b1e 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -10,6 +10,8 @@ LIBMAD_INSTALL_STAGING = YES
 LIBMAD_LIBTOOL_PATCH = NO
 LIBMAD_LICENSE = GPL-2.0+
 LIBMAD_LICENSE_FILES = COPYING
+LIBMAD_PATCH = \
+	https://sources.debian.net/data/main/libm/libmad/0.15.1b-8/debian/patches/frame_length.diff
 
 define LIBMAD_PREVENT_AUTOMAKE
 	# Prevent automake from running.
