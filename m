From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 20:01:36 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] Config.in: Document
 BR2_CCACHE_DIR override
Message-ID: <20180407175148.E641F8106F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d780f2514ff194d0f6bed12f1b92a6fc69ba7c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This variable, like BR2_DL_DIR, is designed to be overridable from the
environment.  Unlike BR2_DL_DIR, it is not documented as such in the
Config.in help text.  Do so now.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ad980ccc3639baa2e517c4d36e836b71ab9f5b8f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
