From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Dec 2017 09:53:34 +0100
Subject: [Buildroot] [git commit] vlc: set back upnp support
Message-ID: <20171219085439.8049C8355D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95d19955dddfb6c446a4eb9cce5813fe838f0b65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit cb7aa25df8c3c4531354fd0f7d69208f89360c7b has disabled upnp support
as --disable-upnp and --enable-upnp are both set if libupnp or libupnp18
is enabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index febd9e0..56bfdce 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -281,16 +281,9 @@ else
 VLC_CONF_OPTS += --disable-theora
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+ifeq ($(BR2_PACKAGE_LIBUPNP)$(BR2_PACKAGE_LIBUPNP18),y)
 VLC_CONF_OPTS += --enable-upnp
-VLC_DEPENDENCIES += libupnp
-else
-VLC_CONF_OPTS += --disable-upnp
-endif
-
-ifeq ($(BR2_PACKAGE_LIBUPNP18),y)
-VLC_CONF_OPTS += --enable-upnp
-VLC_DEPENDENCIES += libupnp18
+VLC_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
 else
 VLC_CONF_OPTS += --disable-upnp
 endif
