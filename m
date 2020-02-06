From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  6 Feb 2020 10:36:28 +0100
Subject: [Buildroot] [PATCH 05/10] package/systemd: cosmetic rearrange list
 of users
In-Reply-To: <20200206093633.251413-1-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
Message-ID: <20200206093633.251413-6-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b3e83b5d3b..b6bd85f130 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -428,10 +428,12 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
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
2.24.1
