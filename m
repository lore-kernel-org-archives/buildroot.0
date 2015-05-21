From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 May 2015 23:22:53 +0200
Subject: [Buildroot] [git commit] exim: enable plaintext and cram-md5
	authenticators
Message-ID: <20150521212656.D4A4C800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41793eabfd2efc13bc86622fb139b14d8a45bd89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #8126

Signed-off-by: Mirko Langisch <pud@nerdpunx.net>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index ed309de..b852793 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -46,6 +46,8 @@ define EXIM_USE_DEFAULT_CONFIG_FILE
 	$(call exim-config-change,PCRE_CONFIG,no)
 	$(call exim-config-change,HAVE_ICONV,no)
 	$(call exim-config-unset,EXIM_MONITOR)
+	$(call exim-config-change,AUTH_PLAINTEXT,yes)
+	$(call exim-config-change,AUTH_CRAM_MD5,yes)
 endef
 
 ifeq ($(BR2_PACKAGE_DOVECOT),y)
