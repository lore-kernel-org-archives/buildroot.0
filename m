From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:35:58 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: make Config.in libc comment
	standard
Message-ID: <20161003213608.7AD2081814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ebc87ecf35729be9be7c9e2f8bb93f68754d150
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ltp-testsuite was the only package to mention "non-musl" while all other
packages have it as "glibc or uClibc". This change only adjusts it to
look like all the other packages.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
