From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 29 Aug 2013 14:59:17 +0200
Subject: [Buildroot] [PATCH 2 of 9 v3] Config.in.legacy: update description
	for users
In-Reply-To: <patchbomb.1377781155@argentina>
References: <patchbomb.1377781155@argentina>
Message-ID: <059f93a8442115bd3455.1377781157@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch clarifies the message shown to users in the legacy menu.
It explicitly mentions the need to save the configuration before disabling the
legacy options.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---

(v3): new patch in this series

 Config.in.legacy |  19 +++++++++++++++----
 1 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -69,11 +69,22 @@ menu "Legacy config options"
 
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
+comment "Where possible, an automatic conversion from old to "
+comment "new symbols has been performed. Please inspect the  "
+comment "options selected below, read their help texts, and  "
+comment "verify/update the new configuration in the          "
+comment "corresponding configuration menus.                  "
+comment "Before making any change in this legacy menu, make  "
+comment "sure to exit the configuration editor a first time  "
+comment "and save the configuration. Otherwise, the automatic"
+comment "conversion of symbols will be lost. After the       "
+comment "initial save and the verification of the new        "
+comment "configuration, you can disable the legacy options in"
+comment "the menu below.                                     "
 comment "Note: at some point in the future, the oldest legacy"
 comment "options will be removed, and configuration files    "
 comment "that still have those options set, will fail to     "
