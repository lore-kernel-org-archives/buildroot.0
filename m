From: Erico Nunes <nunes.erico@gmail.com>
Date: Sat,  1 Oct 2016 13:50:24 +0200
Subject: [Buildroot] [PATCH 3/3] ltp-testsuite: make Config.in libc comment
	standard
In-Reply-To: <1475322624-20518-1-git-send-email-nunes.erico@gmail.com>
References: <1475322624-20518-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <1475322624-20518-3-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltp-testsuite was the only package to mention "non-musl" while all other
packages have it as "glibc or uClibc". This change only adjusts it to
look like all the other packages.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/ltp-testsuite/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 8475902..274b03e 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://linux-test-project.github.io
 
-comment "ltp-testsuite needs a non-musl toolchain w/ threads"
+comment "ltp-testsuite needs a glibc or uClibc toolchain w/ threads"
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
-- 
2.7.4
