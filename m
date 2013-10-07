From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 09:05:04 +0200
Subject: [Buildroot] [git commit] util-inux: MKINSTALLDIRS workaround is
	needed for host install as well
Message-ID: <20131007070740.7E3CB9B97A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f628f2e80f20a6eb2d8bc3b20b5c3413a687d4b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/3c8/3c8c78a5c0421b9079190ddf97b366fc7f0c0859

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a3ee4cd..4db1e52 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -105,3 +105,4 @@ $(eval $(host-autotools-package))
 # one, so it disappears
 UTIL_LINUX_INSTALL_STAGING_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
 UTIL_LINUX_INSTALL_TARGET_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
+HOST_UTIL_LINUX_INSTALL_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
