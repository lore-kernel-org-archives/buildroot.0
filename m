From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 Jun 2014 11:23:13 +0100
Subject: [Buildroot] [PATCH] pinentry: Some toolchains need -pthread in the
	linker command line
Message-ID: <1403000593-31387-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchains, like Sourcery Codebench 2013.05, need -pthread to be
added to the linker command line when linking pinentry-qt.

Fixes:
   http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/pinentry/pinentry.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 11640a6..f340169 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -39,6 +39,9 @@ endif
 
 # pinentry-qt4 backend
 ifeq ($(BR2_PACKAGE_PINENTRY_QT4),y)
+# -pthread needs to be passed for certain toolchains
+# http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/
+PINENTRY_CONF_OPT += LIBS=-pthread
 PINENTRY_CONF_OPT += --enable-pinentry-qt4
 PINENTRY_DEPENDENCIES += qt
 else
-- 
1.7.1
