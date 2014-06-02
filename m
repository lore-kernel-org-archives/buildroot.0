From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 13:20:15 +0200
Subject: [Buildroot] [git commit] nut: now needs C++ support
Message-ID: <20140602112138.E218D9CE7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=048c84ec636d65967aa9177700f871b174d03abc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/8c5/8c5dc5f09e2dcb2a3aba1c451a53de8e79d531dc/

After the version bump, nut now unconditionally builds a C++ client library,
so adjust the dependencies to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nut/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/nut/Config.in b/package/nut/Config.in
index 7045787..659c958 100644
--- a/package/nut/Config.in
+++ b/package/nut/Config.in
@@ -1,6 +1,11 @@
+comment "nut needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_NUT
 	bool "nut"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Network UPS tools
 
