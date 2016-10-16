From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:20:02 +0200
Subject: [Buildroot] [git commit] gcc: gcc arc supports graphite
Message-ID: <20161016103710.1B10880649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d3bbfc7dff770e481f4070f4bf9769d1f52b0ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARC version of gcc does support graphite. It was probably just
forgotten when the BR2_GCC_VERSION_ARC symbol was introduced.

While we're at it, also remove a redundant newline.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 22d221c..514c21b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -38,9 +38,9 @@ choice
 		bool "gcc arc (6.x)"
 		# Only supported architecture
 		depends on BR2_arc
+		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
-
 	config BR2_GCC_VERSION_4_9_X
 		bool "gcc 4.9.x"
 		# Broken or unsupported architectures
