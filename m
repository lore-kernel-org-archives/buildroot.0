From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 26 Apr 2019 18:56:12 +0200
Subject: [Buildroot] [PATCH v3,
 3/4] package/bind: don't enable server by default
In-Reply-To: <20190426165613.31812-1-fontaine.fabrice@gmail.com>
References: <20190426165613.31812-1-fontaine.fabrice@gmail.com>
Message-ID: <20190426165613.31812-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't enable server by default as dhcp will now select bind to use the
bind libraries

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 60546f691b..6d4ee2e6d7 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -28,7 +28,6 @@ if BR2_PACKAGE_BIND
 
 config BR2_PACKAGE_BIND_SERVER
 	bool "Install server components"
-	default y
 	help
 	  Install server components (named, lwresd)
 
-- 
2.20.1
