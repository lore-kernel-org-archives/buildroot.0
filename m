From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:22:25 +0200
Subject: [Buildroot] [git commit] package/qpid-proton: disable for static
	build only
Message-ID: <20150722152231.D628C81E7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=390fdac667b9f4863d8ba954b559c6d38e7329d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qpid-proton always build a shared library "libqpid-proton.so"

Fixes:
http://autobuild.buildroot.net/results/bf6/bf6b9bcc0cead87c8fb12ec4c7f5ff73e6d61d3f/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qpid-proton/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
index b6a1aa9..f8aaf39 100644
--- a/package/qpid-proton/Config.in
+++ b/package/qpid-proton/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QPID_PROTON
 	bool "qpid-proton"
+	depends on !BR2_STATIC_LIBS # build a shared library
 	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -13,5 +14,5 @@ config BR2_PACKAGE_QPID_PROTON
 
 	  https://qpid.apache.org/proton/
 
-comment "qpid-proton needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "qpid-proton needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
