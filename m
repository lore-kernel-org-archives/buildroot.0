From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jul 2019 21:46:39 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/atk: fix build
 with NLS
Message-ID: <20190731212528.40094813E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a007e72eae8329e194dd5ab847df090b63a4f4e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - http://autobuild.buildroot.org/results/67367706de3b38f31b9f59a7cb98cb2186e8ee6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 65b14947546936520c0218d268cdb296932abda9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/atk/atk.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 228b24a7da..6a0cb370db 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -11,6 +11,8 @@ ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
 ATK_LICENSE = LGPL-2.0+
 ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
-ATK_DEPENDENCIES = libglib2
+ATK_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
+
+ATK_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
