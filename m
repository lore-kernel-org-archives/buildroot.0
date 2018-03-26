From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 22:26:02 +0200
Subject: [Buildroot] [git commit] Config.in: Document BR2_CCACHE_DIR override
Message-ID: <20180326202606.2A19D83C43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad980ccc3639baa2e517c4d36e836b71ab9f5b8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable, like BR2_DL_DIR, is designed to be overridable from the
environment.  Unlike BR2_DL_DIR, it is not documented as such in the
Config.in help text.  Do so now.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Config.in b/Config.in
index 037ea2265b..a74b24ae45 100644
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
