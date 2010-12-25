From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Dec 2010 22:33:20 +0100
Subject: [Buildroot] [git commit master 1/1] grep: fix build when libiconv
	is enabled
Message-ID: <20101225213352.6EEC48E2D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=28f77123de67834dee88d2c092c0f4b0770d6af2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/grep/grep.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index e323b1d..bfc9116 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -9,4 +9,10 @@ GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
+# link with iconv if enabled
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+GREP_CONF_ENV += LIBS=-liconv
+GREP_DEPENDENCIES += libiconv
+endif
+
 $(eval $(call AUTOTARGETS,package,grep))
-- 
1.7.2.2
