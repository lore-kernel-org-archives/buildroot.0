From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:04:22 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/efl: drop invalid
 select BR2_PACKAGE_XLIB_LIBXP
Message-ID: <20191223075903.A76A38D7B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f906d44b99b73f99577d7d8192db194e859877c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

The option BR2_PACKAGE_XLIB_LIBXP does not exist, but is select by
efl/Config.in since the package was introduced. Since all xlib_*
dependency in the .mk file each have a corresponding select in the
Config.in file, we simply drop this bogus dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 286b06e9d4fe26f0b5f8787b4afeb5a851f9d03e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 3e7097df74..98b5b0731a 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -166,7 +166,6 @@ config BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
-	select BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
