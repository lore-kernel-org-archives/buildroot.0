From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:28 +0200
Subject: [Buildroot] [PATCH 17/30] package/matchbox-startup-monitor: add
	misisng dependency
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <d6c5dc5f48792b116eef4284d919fdc5b96ea293.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox-startup-monitor build-depends on startup-notifications, but
does not select it.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox-startup-monitor/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/matchbox/matchbox-startup-monitor/Config.in b/package/matchbox/matchbox-startup-monitor/Config.in
index 4dd088f..92a1241 100644
--- a/package/matchbox/matchbox-startup-monitor/Config.in
+++ b/package/matchbox/matchbox-startup-monitor/Config.in
@@ -1,2 +1,3 @@
 config BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR
 	bool
+	select BR2_PACKAGE_STARTUP_NOTIFICATION
-- 
1.9.1
