From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:14:06 +0200
Subject: [Buildroot] [PATCH 04/13] busybox: get default paths from
	BR2_PROJECT_DIR
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231406.17317.12771.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index dedcf18..020e5c2 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,6 +40,7 @@ config BR2_BUSYBOX_VERSION
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
+	default "$(PROJECT_DIR)/busybox.config" if BR2_PROJECT_DIR != ""
 	default "package/busybox/busybox-1.20.x.config" if BR2_PACKAGE_BUSYBOX_SNAPSHOT
 	default "package/busybox/busybox-1.18.x.config" if BR2_BUSYBOX_VERSION_1_18_X
 	default "package/busybox/busybox-1.19.x.config" if BR2_BUSYBOX_VERSION_1_19_X
