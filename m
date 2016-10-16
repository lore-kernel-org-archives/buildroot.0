From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 16 Oct 2016 09:11:32 +0200
Subject: [Buildroot] [PATCH 2/3] gcc: gcc arc supports graphite
In-Reply-To: <20161016071133.23826-1-arnout@mind.be>
References: <20161016071133.23826-1-arnout@mind.be>
Message-ID: <20161016071133.23826-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ARC version of gcc does support graphite. It was probably just
forgotten when the BR2_GCC_VERSION_ARC symbol was introduced.

While we're at it, also remove a redundant newline.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>
---
Please await confirmation from the ARC Maintainers before committing.
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
-- 
2.9.3
