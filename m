From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 11:37:36 +0100
Subject: [Buildroot] [git commit branch/next] uclibc: enable NPTL for or1k
Message-ID: <20171130103101.1A79482122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0a1ad9d6b7e2e23f9e29c607276491a7ede108b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With 1.0.27 NPTL for or1k is improved and can be used
by default.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 3b4f91d..47f25b5 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -48,7 +48,7 @@ choice
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
 	depends on BR2_USE_MMU
-	depends on !BR2_m68k && !BR2_microblaze && !BR2_or1k
+	depends on !BR2_m68k && !BR2_microblaze
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
