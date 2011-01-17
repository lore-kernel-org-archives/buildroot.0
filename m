From: Elias Woods <eliaswoods@gmail.com>
Date: Mon, 17 Jan 2011 02:17:25 -0500
Subject: [Buildroot] [PATCH 2/2] Add libjson-glib to make menu
In-Reply-To: <1295248645-3677-1-git-send-email-EliasWoods@gmail.com>
References: <1295248645-3677-1-git-send-email-EliasWoods@gmail.com>
Message-ID: <1295248645-3677-2-git-send-email-EliasWoods@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 48f245c..0f21fb6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -328,6 +328,11 @@ source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libglib2/Config.in"
+if BR2_PACKAGE_LIBGLIB2
+menu "glib addons"
+source "package/libjson-glib/Config.in"
+endmenu
+endif
 source "package/liboil/Config.in"
 source "package/libsigc/Config.in"
 source "package/startup-notification/Config.in"
-- 
1.7.1
