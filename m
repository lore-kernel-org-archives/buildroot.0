From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:54 +0100
Subject: [Buildroot] [PATCH 24/51] package/gcc-initial: ignore from
	legal-info output
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <a0dffe2393f00890462bfd00634b3c05697adc12.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc-inital is a pure host package, and just an intermediate step before
the final gcc. It uses the same sources, so has the exact same licensing
terms, so we can just ignore it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-initial/gcc-initial.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 02537cf..4c2f098 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -8,6 +8,8 @@ HOST_GCC_INITIAL_VERSION = $(HOST_GCC_COMMON_VERSION)
 HOST_GCC_INITIAL_SITE = $(HOST_GCC_COMMON_SITE)
 HOST_GCC_INITIAL_SOURCE = $(HOST_GCC_COMMON_SOURCE)
 
+HOST_GCC_INITIAL_REDISTRIBUTE = IGNORE
+
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_COMMON_EXCLUDES)
-- 
1.9.1
