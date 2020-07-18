From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 13:43:23 +0200
Subject: [Buildroot] [git commit] package/systemd: cosmetic rearrange list
 of users
Message-ID: <20200718113954.3A2A782B56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3346d78384c9732affb4149f941c74c369b7c1d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Group the udev users first, to make clear which software
requires them.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1a8eb86e53..0890ac3ac0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -483,10 +483,12 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
 endef
 
 define SYSTEMD_USERS
+	# udev user groups
 	- - input -1 * - - - Input device group
-	- - systemd-journal -1 * - - - Journal
 	- - render -1 * - - - DRI rendering nodes
 	- - kvm -1 * - - - kvm nodes
+	# systemd user groups
+	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
 	$(SYSTEMD_COREDUMP_USER)
 	$(SYSTEMD_NETWORKD_USER)
