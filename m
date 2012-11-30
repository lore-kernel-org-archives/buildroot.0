From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:07:35 -0800
Subject: [Buildroot] [git commit] legacy: BR2_PACKAGE_LIBINTL is replaced by
	gettext
Message-ID: <20121130201153.ACEF299347@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26803e88013ca7e30153952435d110f5da8c88ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 04ccb92..7ddc6ea 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -48,6 +48,21 @@ if BR2_LEGACY_CHECK_2012_11
 # Legacy options from 2012.08
 #
 
+config BR2_PACKAGE_GETTEXT_STATIC
+	bool "libgettext.a is now selected by BR2_PREFER_STATIC_LIB"
+	select BR2_LEGACY
+	help
+	  To build a static gettext library, select BR2_PREFER_STATIC_LIB.
+
+
+config BR2_PACKAGE_LIBINTL
+	bool "libintl"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GETTEXT
+	help
+	  libintl is now installed by selecting BR2_PACKAGE_GETTEXT. This now
+	  only installs the library, not the executables.
+
 config BR2_PACKAGE_INPUT_TOOLS_EVTEST
 	bool "input-tools evtest is now a separate package evtest"
 	select BR2_LEGACY
