From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 12:02:40 +0200
Subject: [Buildroot] [git commit branch/next] package/libsepol/Config.in:
 Add policy version 33
Message-ID: <20210521093436.CFC58817D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fd41b6d46385ecf5ed2f3e2867213d060f207bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Policy version 33 was added starting with kernel 5.8.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Matthew Weber <matthew.weber@collins.com>
Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsepol/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 6c66809c9e..04af880e67 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -11,6 +11,7 @@ if BR2_PACKAGE_LIBSEPOL
 
 config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	int "Policy version"
+	default 33 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
 	default 32 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 	default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
@@ -29,7 +30,8 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	  >= 3.14 < 4.3    29
 	  >= 4.3 < 4.13    30
 	  >= 4.13 < 5.5    31
-	  >= 5.5           32
+	  >= 5.5 < 5.8     32
+	  >= 5.8           33
 
 endif
 
