From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:11 -0000
Subject: [Buildroot] [git commit branch/next] package/matchbox-keyboard:
	enforce disabling support for cairo
Message-ID: <20150808105607.7A1A081778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f90345c8eaf1bcf06bba7a1bfd69f7a3fabc483
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We usually explicitly enforce disabling optional support when it is
possible.

Do so for Cairo.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox-keyboard/matchbox-keyboard.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
index fcdd8b1..ba524c0 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox-keyboard/matchbox-keyboard.mk
@@ -24,6 +24,7 @@ ifeq ($(BR2_PACKAGE_CAIRO),y)
 MATCHBOX_KEYBOARD_CONF_OPTS += --enable-cairo
 MATCHBOX_KEYBOARD_DEPENDENCIES += cairo
 else
+MATCHBOX_KEYBOARD_CONF_OPTS += --disable-cairo
 MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 endif
 
