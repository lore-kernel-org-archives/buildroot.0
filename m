From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Mar 2016 08:45:05 +0100
Subject: [Buildroot] [git commit] Revert "pulseview: needs boost
	atomic/date_time as well"
Message-ID: <20160326074733.070F381767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e321586e3e282903c5bf294eb7fa1ed4a6b17e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit b0864b0c416c35625d8d7c2ab3cf6040aa174b8d.

As reported by Bernd and Gustavoz, this was caused by a cmake bug which has
been fixed in 3.5.1, so this is no longer needed:

http://public.kitware.com/pipermail/cmake/2016-March/063085.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseview/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index bc14ea0..bbbfd76 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -7,8 +7,6 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5SVG
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
