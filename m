From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:01:07 +0100
Subject: [Buildroot] [PATCH 3/3] uclibc: enable Xtensa NPTL support with
	uClibc-ng
In-Reply-To: <1423947668-23312-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423947668-23312-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1423947668-23312-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contrary to mainline uClibc, uClibc-ng has support for NPTL on Xtensa,
so let's allow selecting NPTL when a uClibc version other than the
Xtensa special uClibc version is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index a8af197..3a65752 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -129,7 +129,9 @@ choice
 		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 		depends on !BR2_arc
 		depends on !BR2_bfin
-		depends on !BR2_xtensa
+		# There is NPTL support for Xtensa in uClibc-ng, but
+		# not in the main uClibc repository.
+		depends on !BR2_xtensa || !BR2_UCLIBC_VERSION_XTENSA_GIT
 		depends on !BR2_x86_i386
 endchoice
 
-- 
2.1.0
