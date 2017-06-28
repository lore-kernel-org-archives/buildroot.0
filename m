From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jun 2017 23:27:40 +0200
Subject: [Buildroot] [git commit] mpd: bump to version 0.20.9
Message-ID: <20170628212845.A20737FD82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bba3aaf2285e1e554dee81ee2ab4f3bc7ba59169
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building version 0.20.7 fails with a GCC 4.9 toolchain:

```
src/Main.cxx:125:23: error: call to non-constexpr function 'const _Tp& std::max(const _Tp&, const _Tp&) [with _Tp = long unsigned int]'
          64 * KILOBYTE);
                       ^
make[3]: *** [src/Main.o] Error 1
```

The issue was reported upstream [1] and already fixed in version 0.20.8.

Fixes:
http://autobuild.buildroot.net/results/fb6/fb67f453683078023e9d801176ef6871bc720c67/
http://autobuild.buildroot.net/results/200/2005f2a7f2857e59ad1a896db0421bb0328b1766/
http://autobuild.buildroot.net/results/804/80410b62d4ca292df8ecbaf7b0e2a020767111b6/

[1] https://github.com/MusicPlayerDaemon/MPD/issues/45

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index cea79e2..2531abe 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  005ac663b39a76701ba043cce4caef82ac6b0c2f16aae12fdc28e1b3b5b6c780  mpd-0.20.7.tar.xz
+sha256  cd77a2869e32354b004cc6b34fcb0bee56114caa2d9ed862aaa8071441e34eb7  mpd-0.20.9.tar.xz
 sha256  8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e301730  mpd-0.19.21.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index fce2472..6169e95 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -6,7 +6,7 @@
 
 MPD_VERSION_MAJOR = $(call qstrip,$(BR2_PACKAGE_MPD_VERSION_STRING))
 ifeq ($(BR2_PACKAGE_MPD_VERSION_0_20),y)
-MPD_VERSION = $(MPD_VERSION_MAJOR).7
+MPD_VERSION = $(MPD_VERSION_MAJOR).9
 else
 MPD_VERSION = $(MPD_VERSION_MAJOR).21
 endif
