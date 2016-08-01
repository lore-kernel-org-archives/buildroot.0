From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 23:01:20 +0200
Subject: [Buildroot] [git commit] uclibc: disable PIE for microblaze
Message-ID: <20160801210149.98B46819EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd00d6d8a424644ebcaad1f587524f901cde1f48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PIE is not supported at the moment for uClibc-ng/microblaze.
Fixes:
http://autobuild.buildroot.net/results/a5848753eb0e2b0ddf55e226c45b85fd3a1c84f3/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index e5777c0..0d9c39b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -19,7 +19,7 @@ config BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_TOOLCHAIN_USES_UCLIBC
 	bool
-	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_m68k && !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_m68k && !BR2_microblaze && !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_USES_MUSL
 	bool
