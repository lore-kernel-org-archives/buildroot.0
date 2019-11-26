From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 23:23:10 +0100
Subject: [Buildroot] [git commit branch/next] package/libargon2: add missing
 Config.in for the !BR2_STATIC_LIBS dependency
Message-ID: <20191126221539.BEB2E815A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40641072f8bf8b93a6244b7b789a4eca80fa4796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libargon2/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
index aea861ab4c..6bba74cfb2 100644
--- a/package/libargon2/Config.in
+++ b/package/libargon2/Config.in
@@ -6,3 +6,7 @@ config BR2_PACKAGE_LIBARGON2
 	  A modern password hashing algorithm
 
 	  https://password-hashing.net/#argon2
+
+comment "libargon needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
