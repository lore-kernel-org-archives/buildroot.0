From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:36:36 +0100
Subject: [Buildroot] [git commit] firejail: fix logic for comment
Message-ID: <20170309203641.402D88226B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bccf48634d58a0368667d0c58a17bbb0e6d331db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

firejail depends on !uClibc, so the "firejail needs !uClibc" comment
should be displayed when we do have uClibc. Right now the logic is just
the other way around, so flip it.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
