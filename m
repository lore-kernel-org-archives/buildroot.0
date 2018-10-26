From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 19:49:48 +0200
Subject: [Buildroot] [git commit] tar: adjust Config.in comment dependency
Message-ID: <20181026174805.88EF889073@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a3ef05520a6764fae0277a36014b011765ac3d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 916b21a7fbf266f452b8dc4116133cc57fdad269 ("package/tar:
Depends on MMU"), BR2_PACKAGE_TAR depends on BR2_USE_MMU. However, the
Config.in comment does not take into account this dependency, an
inconsistency which is fixed by this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tar/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tar/Config.in b/package/tar/Config.in
index b0be7a389f..caf12d6f16 100644
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_TAR
 
 comment "tar needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
