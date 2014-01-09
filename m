From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jan 2014 13:32:28 +0100
Subject: [Buildroot] [git commit] grep: enable optional pcre integration
Message-ID: <20140109152751.1EF369C40E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f03606fdb434bed0d67b26555f2555ad20307e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/grep.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
