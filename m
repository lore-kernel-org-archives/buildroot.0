From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Nov 2013 16:01:42 +0100
Subject: [Buildroot] [PATCH] uclibc: fix MIPS variables
Message-ID: <1384095702-5268-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_UCLIBC_MIPS_ISA hidden Config.in variable defines which uClibc
config option should be enabled for a given MIPS architecture
variant. Therefore, using lower case names doesn't work: they should
be upper case, to match uClibc config option names. This commit makes
sure the mips32, mips32r2 and mips64 builds select the appropriate
uClibc configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/uclibc/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2dbac12..82dd3aa 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -230,9 +230,9 @@ config BR2_UCLIBC_MIPS_ISA
 	default 2 if BR2_mips_2
 	default 3 if BR2_mips_3
 	default 4 if BR2_mips_4
-	default mips32 if BR2_mips_32
-	default mips32r2 if BR2_mips_32r2
-	default mips64 if BR2_mips_64
+	default MIPS32 if BR2_mips_32
+	default MIPS32R2 if BR2_mips_32r2
+	default MIPS64 if BR2_mips_64
 
 config BR2_UCLIBC_SH_TYPE
 	string
-- 
1.8.1.2
