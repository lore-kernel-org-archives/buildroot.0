From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Jan 2014 22:46:08 +0100
Subject: [Buildroot] [PATCH 3 of 5 v2] flex: change config text of 'target
	binary' option
In-Reply-To: <patchbomb.1390254365@argentina>
References: <patchbomb.1390254365@argentina>
Message-ID: <6d5af3ef7cde496c01cc.1390254368@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The buildroot manual contains a list of deprecated items, with their config
title text, and the location in the config menu. If the config text does not
mention a package name, this can be confusing.

For example, the symbol BR2_PACKAGE_FLEX_BINARY has as text:
'Install tool in the target', which outside of the flex context makes no
sense at all.

To make sure the deprecated packages list in the manual is understandable,
rename the (deprecated) flex 'target binary' config option.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: new patch based on feedback from Arnout Vandecappelle

 package/flex/Config.in |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/flex/Config.in b/package/flex/Config.in
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_FLEX
 if BR2_PACKAGE_FLEX
 
 config BR2_PACKAGE_FLEX_BINARY
-	bool "Install tool in the target"
+	bool "Install flex binary on target"
 	# needs fork()
 	depends on BR2_USE_MMU
 	# runtime dependency
