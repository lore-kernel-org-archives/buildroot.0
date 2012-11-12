From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 12 Nov 2012 21:08:32 +0100
Subject: [Buildroot] [PATCH for-2012.11 5/5] legacy: BR2_PACKAGE_LIBINTL is
	replaced by gettext
In-Reply-To: <1352750912-16012-1-git-send-email-arnout@mind.be>
References: <1352750912-16012-1-git-send-email-arnout@mind.be>
Message-ID: <1352750912-16012-6-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

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
-- 
1.7.10.4
