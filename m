From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 09:54:40 +0100
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 libupnp18
Message-ID: <20171218085516.DDDB380053@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb7aa25df8c3c4531354fd0f7d69208f89360c7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added support for libupnp-1.8:
http://git.videolan.org/?p=vlc/vlc-2.2.git;a=commit;h=825dca78be3a81e2a1c5d04137aa01b1cb32dfd3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 30520c3..febd9e0 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -288,6 +288,13 @@ else
 VLC_CONF_OPTS += --disable-upnp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUPNP18),y)
+VLC_CONF_OPTS += --enable-upnp
+VLC_DEPENDENCIES += libupnp18
+else
+VLC_CONF_OPTS += --disable-upnp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVNCSERVER),y)
 VLC_CONF_OPTS += --enable-vnc
 VLC_DEPENDENCIES += libvncserver
