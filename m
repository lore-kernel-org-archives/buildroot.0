From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2014 23:17:26 +0100
Subject: [Buildroot] [PATCH 4/4] toolchain: do not allow locale generation
	when locale support is not available
In-Reply-To: <1415917046-14446-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1415917046-14446-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1415917046-14446-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the C library being used is uClibc, the locale support can be
disabled. In this case, it does not make sense to show the "Generate
locales" option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 683c143..ad04d64 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -69,7 +69,7 @@ config BR2_GENERATE_LOCALE
 	string "Generate locale data"
 	default ""
 	depends on \
-		BR2_TOOLCHAIN_BUILDROOT_UCLIBC || \
+		(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && BR2_ENABLE_LOCALE) || \
 		BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Generate support for a list of locales. Locales can be
-- 
2.1.0
