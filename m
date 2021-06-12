From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:39:35 +0200
Subject: [Buildroot] [git commit] package/heirloom-mailx: requires DES and
 RC2 support in openssl
Message-ID: <20210612210930.3513C8D343@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4032dc6becc18b6bec5885b3ec28d6bed8bb8dd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES and RC2 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/2da419416da0cc34b65c89aa966b327640a177e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/heirloom-mailx/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/heirloom-mailx/Config.in b/package/heirloom-mailx/Config.in
index 87664b489e..c5b0bcbea7 100644
--- a/package/heirloom-mailx/Config.in
+++ b/package/heirloom-mailx/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_HEIRLOOM_MAILX
 	# uses fork()
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Heirloom mailx (previously known as nail) is a mail user
 	  agent for Unix systems.
