From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:43:19 +0100
Subject: [Buildroot] [PATCH 13/16] elf2flt: disable Werror to avoid build
	issues
In-Reply-To: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458164602-16983-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the debugging printf use incorrect formats, which cause some
warnings. Due to the use of -Werror by default, the build breaks
unnecessarily. Therefore, disable -Werror when building elf2flt.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elf2flt/elf2flt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 796313b..eb0baad 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -18,7 +18,8 @@ HOST_ELF2FLT_CONF_OPTS = \
 	--with-binutils-include-dir=$(HOST_BINUTILS_DIR)/include/ \
 	--with-libbfd=$(HOST_BINUTILS_DIR)/bfd/libbfd.a \
 	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
-	--target=$(GNU_TARGET_NAME)
+	--target=$(GNU_TARGET_NAME) \
+	--disable-werror
 
 HOST_ELF2FLT_LIBS = -lz
 
-- 
2.6.4
