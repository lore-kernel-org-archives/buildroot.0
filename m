From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Apr 2014 18:48:05 +0200
Subject: [Buildroot] [PATCH v2 00/41] XBMC Gotham Beta3 + misc stuff
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <533D90C5.30606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/14 21:46, Bernd Kuhls wrote:
> Hi,
> 
> this series replaces mondays patch series "[PATCH 00/16] XBMC Gotham Beta3".
> 
> patches 1-12: unrelated version bumps

 Could you submit unrelated version bumps as a separate series/branch? If
they are also unrelated between them, then you can submit each bump
separately.

 Regards,
 Arnout

> patch 13: removed
> patches 14-15: Kconfig comments
> patches 16-21: Add virtual package for full-openGL (branch yem/fixes)
>                (Yann, deprecated, but working - DO NOT COMMIT)
> patches 22-27: new packages needed for xbmc, especially for intel support
> patch 28: v5 of xdriver_xf86-video-intel version bump
> patch 29: WIP - Add xbmc-send script to send commands to xbmc
> patch 30: rebased http://patchwork.ozlabs.org/patch/334971/ (Ryan)
> patch 31: rebased http://patchwork.ozlabs.org/patch/335219/ (Maxime)
> patches 32-33: rebased host-infozip http://patchwork.ozlabs.org/patch/336195/
>                http://patchwork.ozlabs.org/patch/336196/ (Maxime)
> patches 34-41: WIP - xbmc version bump to Gotham Beta3 with uClibc support
>                http://xbmc.org/xbmc-13-0-gotham-beta-3-returns/
> 
> I consider patches 1-15, 22-28 & 30-33 git-ready.
> 
> Regards, Bernd
> 
> 
> Bernd Kuhls (33):
>   pixman: Version bump 0.32.4
>   xlib_xtrans: Version bump 1.3.4
>   file: Version bump 5.18
>   flex: Version bump 2.5.39
>   sqlite: Version bump 3.8.4.2
>   flac: version bump 1.3.0, add sse support
>   libcdio: version bump 0.92
>   libmodplug: version bump 0.8.8.5
>   libogg: version bump 1.3.1
>   taglib: version bump 1.9.1
>   nasm: version bump 2.11.02
>   libnfs: version bump 1.9.3
>   libdrm: Explain dependency on xorg in Kconfig
>   mesa3d: Explain dependency for i965 DRI driver on xorg in Kconfig
>   libva: new package
>   libva-intel-driver: new package
>   ffmpeg: Add libva support
>   libglu: new package
>   libglew: new package
>   sdl: Add new dependency libglu for opengl support
>   xdriver_xf86-video-intel: Bump version to 2.99.911
>   xbmc: Add xbmc-send script to send commands to xbmc service
>   xbmc: needs host-gawk (v3)
>   xbmc: Add missing host-infozip dependency (v2)
>   WIP: xbmc: Bump version to Gotham_beta3
>   WIP: xbmc: Allow compilation with uClibc
>   WIP: xbmc: Add X.org support
>   WIP: xbmc: Add VA-API support
>   WIP: xbmc: Add alsa support
>   WIP: xbmc: Add lame support
>   WIP: xbmc: Disable broken rsxs screensaver
>   WIP: xbmc: Add option for Goom screensaver
> 
> Maxime Hadjinlian (2):
>   xbmc: Fix Java dependency check
>   infozip: Add a host variant
> 
> Yann E. MORIN (6) DO NOT COMMIT:
>   package/libevas: quick fix to get rid of circular deps
>   package/libgl: introduce as a new virtual package for full-openGL
>     providers
>   package/mesa3d: is a full-openGL provider if X.org is present
>   package/vlc: depends on the virtual package libgl
>   package/x11-video-drivers: do not select, but depends on mesa3d
>   package/xorg-server: do not force-select xf86driproto for mesa3d
> 
>  package/Config.in                                  |    4 +
>  package/efl/libevas/Config.in                      |    2 +-
>  package/ffmpeg/ffmpeg.mk                           |    8 +-
>  package/file/file.mk                               |    2 +-
>  package/flac/flac-no-altivec.patch                 |   28 -------
>  package/flac/flac.mk                               |   16 +++-
>  package/flex/flex-prog-ar.patch                    |   11 ---
>  package/flex/flex.mk                               |    2 +-
>  package/infozip/infozip.mk                         |   13 +++
>  package/libcdio/libcdio.mk                         |    2 +-
>  package/libdrm/Config.in                           |    3 +
>  package/libglew/Config.in                          |   19 +++++
>  package/libglew/libglew-0001-lib64.patch           |   14 ++++
>  package/libglew/libglew.mk                         |   40 ++++++++++
>  package/libglu/Config.in                           |   10 +++
>  package/libglu/libglu.mk                           |   19 +++++
>  package/libmodplug/libmodplug.mk                   |    2 +-
>  package/libnfs/libnfs.mk                           |    2 +-
>  package/libogg/libogg.mk                           |    2 +-
>  package/libva-intel-driver/Config.in               |   13 +++
>  package/libva-intel-driver/libva-intel-driver.mk   |   13 +++
>  package/libva/Config.in                            |   12 +++
>  package/libva/libva.mk                             |   59 ++++++++++++++
>  package/mesa3d/Config.in                           |    7 ++
>  package/nasm/nasm.mk                               |    2 +-
>  package/opengl/Config.in                           |    1 +
>  package/opengl/libgl/Config.in                     |    6 ++
>  package/opengl/libgl/libgl.mk                      |   16 ++++
>  package/pixman/pixman-01-loongson-cflags.patch     |   38 ---------
>  package/pixman/pixman.mk                           |    2 +-
>  package/sdl/sdl.mk                                 |    6 +-
>  package/sqlite/sqlite.mk                           |    2 +-
>  package/taglib/taglib.mk                           |    4 +-
>  package/vlc/vlc.mk                                 |    4 +-
>  package/x11r7/xdriver_xf86-video-ati/Config.in     |    5 +-
>  package/x11r7/xdriver_xf86-video-glint/Config.in   |    5 +-
>  package/x11r7/xdriver_xf86-video-intel/Config.in   |   18 +++--
>  .../xdriver_xf86-video-intel.mk                    |   31 ++++++--
>  package/x11r7/xdriver_xf86-video-mach64/Config.in  |    3 +
>  package/x11r7/xdriver_xf86-video-mga/Config.in     |    5 +-
>  .../x11r7/xdriver_xf86-video-openchrome/Config.in  |    5 +-
>  package/x11r7/xdriver_xf86-video-r128/Config.in    |    5 +-
>  package/x11r7/xdriver_xf86-video-savage/Config.in  |    5 +-
>  package/x11r7/xdriver_xf86-video-sis/Config.in     |    5 +-
>  package/x11r7/xdriver_xf86-video-tdfx/Config.in    |    5 +-
>  package/x11r7/xdriver_xf86-video-vmware/Config.in  |    5 +-
>  package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    2 +-
>  package/x11r7/xserver_xorg-server/Config.in        |    1 -
>  package/xbmc/Config.in                             |   45 ++++++++---
>  package/xbmc/xbmc.mk                               |   84 +++++++++++++++++---
>  51 files changed, 470 insertions(+), 145 deletions(-)
>  delete mode 100644 package/flac/flac-no-altivec.patch
>  delete mode 100644 package/flex/flex-prog-ar.patch
>  create mode 100644 package/libglew/Config.in
>  create mode 100644 package/libglew/libglew-0001-lib64.patch
>  create mode 100644 package/libglew/libglew.mk
>  create mode 100644 package/libglu/Config.in
>  create mode 100644 package/libglu/libglu.mk
>  create mode 100644 package/libva-intel-driver/Config.in
>  create mode 100644 package/libva-intel-driver/libva-intel-driver.mk
>  create mode 100644 package/libva/Config.in
>  create mode 100644 package/libva/libva.mk
>  create mode 100644 package/opengl/libgl/Config.in
>  create mode 100644 package/opengl/libgl/libgl.mk
>  delete mode 100644 package/pixman/pixman-01-loongson-cflags.patch
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
