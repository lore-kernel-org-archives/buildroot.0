From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jun 2019 22:57:51 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/woff2: add a
 comment for C++
Message-ID: <20190605210240.329908D447@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddba2a665b19d0100753d32430b6dfe13e06d1a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

woff2 depends on C++ so add a comment if C++ is not enabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 47840289bfa1f4b95555ec9153c952f9c81af349)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/woff2/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/woff2/Config.in b/package/woff2/Config.in
index 48672570dd..d280414d4c 100644
--- a/package/woff2/Config.in
+++ b/package/woff2/Config.in
@@ -7,3 +7,6 @@ config BR2_PACKAGE_WOFF2
 	  typically used for Web fonts
 
 	  https://github.com/google/woff2
+
+comment "woff2 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
