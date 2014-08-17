From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:29:46 +0200
Subject: [Buildroot] [PATCH 07/24 v5] manual: document dependencies on
	atomic operations
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <fa8f747100cacb85a0a9263abd4b26ec34e6c880.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Anton Kolesov <anton.kolesov@synopsys.com>

Add atomic operations to the list of generic dependencies.

Since this is an architecture option, there is no comment string to be
added.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
[yann.morin.1998 at free.fr: use the new arch-option; remove comment string]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-directory.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 93e6a3e..fd9460c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -219,6 +219,11 @@ use in the comment.
 ** Dependency symbol: +BR2_USE_MMU+
 ** Comment string: no comment to be added
 
+* Atomic instructions (whereby the architecture has instructions to
+  perform some operations atomically, like LOCKCMPXCHG on x86)
+** Dependency symbol: +BR2_ARCH_HAS_ATOMICS+
+** Comment string: no comment to be added
+
 * Kernel headers
 ** Dependency symbol: +BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y+, (replace
    +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
-- 
1.9.1
