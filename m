From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 22:40:12 +0100
Subject: [Buildroot] [git commit] uclibc: fix MIPS variables
Message-ID: <20131110223451.C1C819BB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab0ff59ee5b2a0b5a910e72f4f558f001380b248
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_UCLIBC_MIPS_ISA hidden Config.in variable defines which uClibc
config option should be enabled for a given MIPS architecture
variant. Therefore, using lower case names doesn't work: they should
be upper case, to match uClibc config option names. This commit makes
sure the mips32, mips32r2 and mips64 builds select the appropriate
uClibc configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
