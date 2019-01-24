From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:43:20 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/swupdate: disable
 lua in static build
Message-ID: <20190124154615.D2D3685296@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8a5bf8660c0acdfd1cb7bb2ac233ab6f80d7aa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Since version 2018.11 and
https://github.com/sbabic/swupdate/commit/624904cc18003fae413011563dac83a333f10509,
bindings for LUA is a shared library so disable lua if BR2_STATIC_LIBS
is set

Fixes:
 - http://autobuild.buildroot.org/results/55767e58c211656558af7916a4e0975089a2785b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b898b67209ff5c28f06d29b4e15ee671d6b64b0b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 08d6ba9372..b7ef09c924 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -44,7 +44,7 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
+ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER):$(BR2_STATIC_LIBS),y:)
 SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
 # defines the base name for the pkg-config file ("lua" or "luajit")
 define SWUPDATE_SET_LUA_VERSION
