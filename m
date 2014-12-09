From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Dec 2014 12:40:01 +0100
Subject: [Buildroot] [git commit] lighttpd: disable static build
Message-ID: <20141209133124.3BCCF80096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c77fbc3a4631b82bc28787c45a941ee0c47104ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lighttpd modules support code requires shared libraries support.

The scons based build system seems to be support static link of modules, but
we currently don't use scons for lighttpd.

Fixes:
http://autobuild.buildroot.net/results/39c/39c027bf6b76a0f9c15a184f449dadacfaefe980/

[Peter: move to top of file to fix indentation of sub options]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index a5abf7e..0d794c9 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -1,6 +1,11 @@
+comment "lighttpd needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_LIGHTTPD
 	bool "lighttpd"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  lighttpd a secure, fast, compliant and very flexible web-server
 	  which has been optimized for high-performance environments. It
