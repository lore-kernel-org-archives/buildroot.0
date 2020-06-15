From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 09:20:44 +0200
Subject: [Buildroot] [PATCH v2 04/14] package/systemd: cosmetic rearrange
 list of users
In-Reply-To: <20200615072055.2083-1-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
Message-ID: <20200615072055.2083-5-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Group the udev users first, to make clear which software
requires them.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/systemd/systemd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ead4e70f95..6629c933cd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -499,10 +499,12 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
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
-- 
2.27.0
