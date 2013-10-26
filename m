From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 19:04:42 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: update description for
	users
Message-ID: <20131027072650.AD1689BB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cce5baa8ee8eb9bbe27448aa75b67719431bf9e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch clarifies the message shown to users in the legacy menu.
It explicitly mentions the need to save the configuration before disabling the
legacy options.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy |   24 ++++++++++++++++++++----
 1 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 18224a0..237b8d0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -69,11 +69,27 @@ menu "Legacy config options"
 
 if BR2_LEGACY
 comment "Your old configuration uses legacy options that no  "
-comment "longer exist in buildroot.                          "
-comment "Please look at the options which have been selected "
-comment "and read their help text.                           "
-comment "As long as these options stay selected, the build   "
+comment "longer exist in buildroot, as indicated in the menu "
+comment "below. As long as these options stay selected, or in"
+comment "case of string options are non-empty, the build     "
 comment "will fail.                                          "
+comment "*                                                   "
+comment "Where possible, an automatic conversion from old to "
+comment "new symbols has been performed. Before making any   "
+comment "change in this legacy menu, make sure to exit the   "
+comment "configuration editor a first time and save the      "
+comment "configuration. Otherwise, the automatic conversion  "
+comment "of symbols will be lost.                            "
+comment "*                                                   "
+comment "After this initial save, reopen the configuration   "
+comment "editor, inspect the options selected below, read    "
+comment "their help texts, and verify/update the new         "
+comment "configuration in the corresponding configuration    "
+comment "menus. When everything is ok, you can disable the   "
+comment "legacy options in the menu below. Once you have     "
+comment "disabled all legacy options, this text will         "
+comment "disappear and you will be able to start the build.  "
+comment "*                                                   "
 comment "Note: at some point in the future, the oldest legacy"
 comment "options will be removed, and configuration files    "
 comment "that still have those options set, will fail to     "
