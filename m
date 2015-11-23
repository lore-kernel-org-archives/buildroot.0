From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:58 +0100
Subject: [Buildroot] [PATCH 28/51] core: include arch-specific definitions
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <27d324d4dd8cf582d83a362c27a883764d833467.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow architectures to define variables and helper macros.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 947f941..bfb6379 100644
--- a/Makefile
+++ b/Makefile
@@ -408,6 +408,9 @@ include Makefile.legacy
 endif
 
 include package/Makefile.in
+# arch/arch.mk.* must be after package/Makefile.in because it may need to
+# complement variables defined therein, like BR_NO_CHECK_HASH_FOR.
+-include $(wildcard arch/arch.mk.*)
 include support/dependencies/dependencies.mk
 
 include toolchain/*.mk
-- 
1.9.1
