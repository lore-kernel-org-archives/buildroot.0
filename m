From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:02:39 +0200
Subject: [Buildroot] [git commit] package/vlc: install vlc libraries in
	staging
Message-ID: <20150628120253.574A780DAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45ea3228a1fd7669bfe5ad0937958b49bb62a035
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although no package seems to link against vlc libraries right now, these
libraries will be necessary for upcoming new efl emotion-generic-players
package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index acd67ee..bc2966e 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -12,6 +12,9 @@ VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_DEPENDENCIES = host-pkgconf
 VLC_AUTORECONF = YES
 
+# Install vlc libraries in staging.
+VLC_INSTALL_STAGING = YES
+
 # VLC defines two autoconf functions which are also defined by our own pkg.m4
 # from pkgconf. Unfortunately, they are defined in a different way: VLC adds
 # --enable- options, but pkg.m4 adds --with- options. To make sure we use
