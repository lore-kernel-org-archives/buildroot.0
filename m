From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 15 Mar 2018 14:47:33 -0700
Subject: [Buildroot] [PATCH] Config.in: Document BR2_CCACHE_DIR override
Message-ID: <20180315214733.7320-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This variable, like BR2_DL_DIR, is designed to be overridable from the
environment.  Unlike BR2_DL_DIR, it is not documented as such in the
Config.in help text.  Do so now.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Config.in b/Config.in
index 0002df5176..25f24b9d20 100644
--- a/Config.in
+++ b/Config.in
@@ -332,6 +332,9 @@ config BR2_CCACHE_DIR
 	default "$(HOME)/.buildroot-ccache"
 	help
 	  Where ccache should store cached files.
+	  If the Linux shell environment has defined the BR2_CCACHE_DIR
+	  environment variable, then this overrides this configuration
+	  item.
 
 config BR2_CCACHE_INITIAL_SETUP
 	string "Compiler cache initial setup"
-- 
2.14.3
