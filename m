From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 11:27:13 +0200
Subject: [Buildroot] [git commit] package/mpv: link with libatomic if needed
Message-ID: <20200816092111.47DEF8276E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71cb0f0f722875100cd18df9484a7a30f53bfbeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/12f4580429427b6b546184366f74da16f83d692c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpv/mpv.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 8619de5a8e..6801a0468f 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -235,4 +235,8 @@ else
 MPV_CONF_OPTS += --disable-x11
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+MPV_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
+endif
+
 $(eval $(waf-package))
