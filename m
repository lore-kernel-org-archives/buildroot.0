From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 16:09:37 +0200
Subject: [Buildroot] [git commit] package/kodi: fix path to binary
Message-ID: <20170429140945.1388382757@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=230187adaadd7264af73df110ebcc74bb1337202
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since XBMC was renamed to Kodi, upstream is progressively propagating
the rename to directories and files, and in some cases kept a legacy
symlink xbmc->kodi, like /usr/lib/xbmc pointing to /usr/lib/kodi.

In 62165ae (package/kodi: Fix path to binary in service), the path was
changed to use the new canonical path, but the init script was left out.
This was not seen previously, because of the legacy symlink.

But with the advent of Kodi 17 (Krypton), that legacy symlink is no
more, and the init script no longer works.

Do for the init script what was done two years ago for the service file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/S50kodi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/S50kodi b/package/kodi/S50kodi
index f00c59c..0afe7a6 100755
--- a/package/kodi/S50kodi
+++ b/package/kodi/S50kodi
@@ -4,7 +4,7 @@
 #
 
 BIN=/usr/bin/br-kodi
-KODI=/usr/lib/xbmc/kodi.bin
+KODI=/usr/lib/kodi/kodi.bin
 KODI_ARGS="--standalone -fs -n"
 PIDFILE=/var/run/kodi.pid
 
