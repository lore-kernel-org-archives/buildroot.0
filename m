From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jul 2014 15:07:26 +0200
Subject: [Buildroot] [git commit] pinentry: Some toolchains need -pthread in
	the linker command line
Message-ID: <20140704144657.6DDA29D187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23c48fd8b851591f416d3d9ac8363370c13a6e75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some toolchains, like Sourcery Codebench 2013.05, need -pthread to be
added to the linker command line when linking pinentry-qt.

Fixes:
   http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
