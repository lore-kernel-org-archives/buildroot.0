From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Jan 2014 09:12:29 -0300
Subject: [Buildroot] [PATCH] grep: enable optional pcre integration
Message-ID: <1389269549-14970-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/grep/grep.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 6a039d9..ee6de39 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -18,6 +18,12 @@ GREP_CONF_ENV += LIBS=-liconv
 GREP_DEPENDENCIES += libiconv
 endif
 
+# link with pcre if enabled
+ifeq ($(BR2_PACKAGE_PCRE),y)
+GREP_CONF_OPT += --enable-perl-regexp
+GREP_DEPENDENCIES += pcre
+endif
+
 # Full grep preferred over busybox grep
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 GREP_DEPENDENCIES += busybox
-- 
1.8.3.2
