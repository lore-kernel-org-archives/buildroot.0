From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 10:07:05 +0200
Subject: [Buildroot] [git commit] package/ne10: drop arch-related comment
Message-ID: <20200503075435.B320B90DD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de70d9b933c23b88b7b6f07561a62fd813274e9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e845f9364c2b8 ("ne10: bump to v1.2.1") removed arm arch
dependency from the comment. This comment is only relevant to arm.

Furthermore, if a target does not have a NEON unit, there is
nothing a user can do about that condition in Buildroot. Showing
a comment would not be useful, and we're not usually showing any
arch-related comment.

Cc: Cody Guldner <cody.guldner@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[yann.morin.1998 at free.fr: drop the comment, explain why]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ne10/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/ne10/Config.in b/package/ne10/Config.in
index 68cb7f4cb3..a84ac18c92 100644
--- a/package/ne10/Config.in
+++ b/package/ne10/Config.in
@@ -15,6 +15,3 @@ config BR2_PACKAGE_NE10
 	  both assembler and NEON implementations.
 
 	  http://projectne10.github.io/Ne10/
-
-comment "ne10 needs a toolchain w/ neon"
-	depends on !BR2_PACKAGE_NE10_ARCH_SUPPORTS
