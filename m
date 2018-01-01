From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 22:44:46 +0100
Subject: [Buildroot] [git commit] mpv: fix typo in variable name
Message-ID: <20180101214543.9CBC8839C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eea60d14360a3f40be1ac0da181f9ba183cf2c73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FFMPEG_DEPENDENCIES shouldn't be used in mpv.mk. This typo was
introduced in commit 8e741412d444f9fd2a9af75bf33066a083f7f81b ("mpv:
add support for Raspberry Pi "rpi" output").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpv/mpv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index b7dfb36..8d10aa7 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -171,7 +171,7 @@ endif
 # Raspberry Pi support
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 MPV_CONF_OPTS += --enable-rpi --enable-gl
-FFMPEG_DEPENDENCIES += rpi-userland
+MPV_DEPENDENCIES += rpi-userland
 else
 MPV_CONF_OPTS += --disable-rpi
 endif
