From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 09:14:22 +0200
Subject: [Buildroot] [git commit] atest: wordexp is enabled in uClibc now
Message-ID: <20170501072204.3DA8F8183D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7476fa6b26c5f9711d9418f10663154fbd003b93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package can now be used for uClibc toolchains.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atest/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/atest/Config.in b/package/atest/Config.in
index 1b357bb..9a2e342 100644
--- a/package/atest/Config.in
+++ b/package/atest/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_ATEST
 	bool "atest"
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # uclibc lacks wordexp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	depends on !BR2_bfin # libev
 	select BR2_PACKAGE_ALSA_LIB
@@ -11,6 +10,6 @@ config BR2_PACKAGE_ATEST
 
 	  https://github.com/amouiche/atest
 
-comment "atest needs a glibc or musl toolchain w/ threads"
+comment "atest needs a toolchain w/ threads"
 	depends on !BR2_bfin
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
