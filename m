From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 22:48:16 +0100
Subject: [Buildroot] [git commit] pulseview: needs boost atomic/date_time as
	well
Message-ID: <20160325215140.07917800F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0864b0c416c35625d8d7c2ab3cf6040aa174b8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/15e/15ebb8bc2b50080c37c635462a5faf63f038f014/
http://autobuild.buildroot.net/results/2ac/2ac1c2fb79a46605be829ddfd44db671ba229f26/

From the cmake log:

  Could not find the following Boost libraries:

          boost_date_time
          boost_atomic

  Some (but not all) of the required Boost libraries were found.  You may
  need to install these additional Boost libraries.  Alternatively, set
  BOOST_LIBRARYDIR to the directory containing Boost libraries or BOOST_ROOT
  to the location of Boost.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseview/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index bbbfd76..bc14ea0 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -7,6 +7,8 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5SVG
 	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_ATOMIC
+	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
