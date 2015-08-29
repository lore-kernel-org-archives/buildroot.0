From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 18:14:04 +0200
Subject: [Buildroot] [git commit] ibrcommon: fix dependencies of comment in
	Config.in
Message-ID: <20150901083108.C69B97F95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bb79ac97d152a4e611357564eebf370e947a57e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want the comment to be displayed either if C++ is not supported
*or* if threads is not supported.

Also, fix the indentation to use a tab.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ibrcommon/Config.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/ibrcommon/Config.in b/package/ibrcommon/Config.in
index 5aa51a4..36ccfbc 100644
--- a/package/ibrcommon/Config.in
+++ b/package/ibrcommon/Config.in
@@ -10,5 +10,4 @@ config BR2_PACKAGE_IBRCOMMON
 	  http://trac.ibr.cs.tu-bs.de/project-cm-2012-ibrdtn
 
 comment "ibrcommon needs a toolchain w/ C++, threads"
-        depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
