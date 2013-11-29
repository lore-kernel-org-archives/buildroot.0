From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2013 10:01:44 +0100
Subject: [Buildroot] [git commit] lua-ev: disable on avr32 and blackfin
Message-ID: <20131129090231.F2A889BE63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=765ccaf08c5b042bd33d800772564cc10808f3af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lua-ev is a reverse dependency of libev, but the architecture filtering is
not propagated. Fixes autobuild failure such as the following.

  http://autobuild.buildroot.net/results/387/38704a4362ab6c3458c45603975b274937059fa9/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-ev/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
index 1e89c27..4f704ad 100644
--- a/package/lua-ev/Config.in
+++ b/package/lua-ev/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUA_EV
 	bool "lua-ev"
 	select BR2_PACKAGE_LIBEV
+	depends on !(BR2_avr32 || BR2_bfin) # libev
 	help
 	  Get access to the libev library from Lua.
 
