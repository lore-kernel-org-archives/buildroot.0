From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:42:30 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/mpv: link with
 libatomic if needed
Message-ID: <20200828164643.379DD85FE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=226c1688be6a3862c9acf6478cc1dc38462046e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes:
 - http://autobuild.buildroot.org/results/12f4580429427b6b546184366f74da16f83d692c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 71cb0f0f722875100cd18df9484a7a30f53bfbeb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
