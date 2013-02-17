From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 17 Feb 2013 22:35:28 +0100
Subject: [Buildroot] [PATCH] gettext: add host-gettext
In-Reply-To: <51214BB2.4090907@mind.be>
References: <51214BB2.4090907@mind.be>
Message-ID: <1361136928-2077-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

host-gettext is required for the autotools macros used by modem-manager.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I noticed that gettext uses ncurses if available, but there is no dependency
or --disable in the .mk file...
---
 package/gettext/gettext.mk |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 204af10..d69b1c8 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -55,4 +55,18 @@ endef
 GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TOOLS
 GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TESTS
 
+HOST_GETTEXT_CONF_OPT +=  \
+	--disable-libasprintf \
+	--disable-acl \
+	--disable-openmp \
+	--disable-rpath \
+	--disable-java \
+	--disable-native-java \
+	--disable-csharp \
+	--disable-relocatable \
+	--without-emacs \
+	--disable-nls \
+	--disable-curses
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
