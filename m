From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 9 Mar 2017 11:25:29 +0000
Subject: [Buildroot] [PATCH] firejail: fix logic for comment
Message-ID: <20170309112529.52513-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

firejail depends on !uClibc, so the "firejail needs !uClibc" comment
should be displayed when we do have uClibc. Right now the logic is just
the other way around, so flip it.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/firejail/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/firejail/Config.in b/package/firejail/Config.in
index 8c5338e..1742b65 100644
--- a/package/firejail/Config.in
+++ b/package/firejail/Config.in
@@ -16,4 +16,4 @@ config BR2_PACKAGE_FIREJAIL
 
 comment "firejail needs a glibc or musl toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.10.2
