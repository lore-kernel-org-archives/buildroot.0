From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 21:09:22 +0100
Subject: [Buildroot] [git commit] package/ustr: fix ldconfig for host build
Message-ID: <20170110200943.005B281D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18ed2dcf6c8a80804c31003ec7d4b1330d2b2b5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host build of the ustr package also needs to not run the ldconfig to
prevent a build failure caused by the symlink creating a race condition.
Related commit for target build change was 22069232.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ustr/ustr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index b3de50b..715914c 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -26,6 +26,7 @@ USTR_INSTALL_STAGING = YES
 USTR_MAKE_OPTS = all all-shared
 
 USTR_CONF_OPTS += LDCONFIG=/bin/true
+HOST_USTR_CONF_OPTS += LDCONFIG=/bin/true
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
