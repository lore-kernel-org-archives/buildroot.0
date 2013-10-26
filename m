From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 19:05:10 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: add separator to
	description for users
Message-ID: <20131027072650.B3D909BBC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a25e4a4c4c01bf55177d2716b6adeb4ce4ac376e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When legacy symbols are selected, the menuconfig shows the explanation for
users, immediately followed by the line "Legacy options removed in 2013.08".
In order to visually keep these apart, we introduce a separator.

Note that a line with all spaces is not correctly shown by menuconfig (the
width will not be kept at 80 characters, so the output is '***   ***').
A dashed line seemed a logical alternative, and with another dashed line on
top, the description becomes a block.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 237b8d0..6cdd4e3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -68,6 +68,7 @@ comment "Legacy detected: check the content of the menu below"
 menu "Legacy config options"
 
 if BR2_LEGACY
+comment "----------------------------------------------------"
 comment "Your old configuration uses legacy options that no  "
 comment "longer exist in buildroot, as indicated in the menu "
 comment "below. As long as these options stay selected, or in"
@@ -94,6 +95,7 @@ comment "Note: at some point in the future, the oldest legacy"
 comment "options will be removed, and configuration files    "
 comment "that still have those options set, will fail to     "
 comment "build, or run, in unpredictable ways.               "
+comment "----------------------------------------------------"
 endif
 
 ###############################################################################
