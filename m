From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Aug 2014 10:05:53 +0200
Subject: [Buildroot] [git commit] procps-ng: Depends on MMU
Message-ID: <20140814081044.F19129D1C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96527e6d524c766415f4cd815bf21080d196622f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/f24/f24aa16857e91fb6b03f9ac7ab0442fedcab8546//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/procps-ng/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 7463fa8..43e8758 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PROCPS_NG
 	bool "procps-ng"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
