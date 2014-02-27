From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2014 14:19:49 +0100
Subject: [Buildroot] [git commit] e2fsprogs: disable e4defrag for nios
Message-ID: <20140227134822.B7D7D9BB96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66a70b62b007526dcc656c92273bbadbeed802a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

e4defrag has to be disabled because of the (external) toolchain declares
the fallocate64 call in the header files but don't implement it in the
library. e4defrag defines its own fallocate64 function that throws an
error because of the previous declaration in the toolchain header.

Signed-off-by: Frank Bergmann <frank@frajasalo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index ae4da95..eb7bedb 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -50,7 +50,7 @@ config BR2_PACKAGE_E2FSPROGS_E2UNDO
 
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
-	depends on !BR2_avr32 # fallocate not implemented
+	depends on !BR2_avr32 && !BR2_nios2 # fallocate not implemented
 
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
 	bool "filefrag"
