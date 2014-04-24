From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 12:16:40 +0200
Subject: [Buildroot] [git commit] smack: fix dependencies comment
Message-ID: <20140424101653.ECB609C9B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e187d7720d55b979857d7a11d7cbac773f72e0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment should show when any of these conditions is not met.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/smack/Config.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/smack/Config.in b/package/smack/Config.in
index 55e9d2e..3f26cae 100644
--- a/package/smack/Config.in
+++ b/package/smack/Config.in
@@ -30,5 +30,4 @@ config BR2_PACKAGE_SMACK
 	  https://github.com/smack-team/smack
 
 comment "smack needs a toolchain w/ dynamic library, headers >= 3.0"
-	depends on BR2_PREFER_STATIC_LIB
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
