From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 21:57:43 +0100
Subject: [Buildroot] [git commit] flex: change config text of 'target
	binary' option
Message-ID: <20140121205928.2BA1D9C545@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08506501b0bab41dad7f07bc0cbf10ed90eb645e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The buildroot manual contains a list of deprecated items, with their config
title text, and the location in the config menu. If the config text does not
mention a package name, this can be confusing.

For example, the symbol BR2_PACKAGE_FLEX_BINARY has as text:
'Install tool in the target', which outside of the flex context makes no
sense at all.

To make sure the deprecated packages list in the manual is understandable,
rename the (deprecated) flex 'target binary' config option.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flex/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/flex/Config.in b/package/flex/Config.in
index 194b6a2..9ac600d 100644
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
