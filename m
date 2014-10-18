From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Oct 2014 21:44:52 +0200
Subject: [Buildroot] [RFC/PATCH v3 00/11] package/kodi: Bump version to
	14.0a4-Helix
Message-ID: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchset is a RFC and not meant to be committed to buildroot git yet.

The follow-up version of XBMC 13.x-Gotham will be called Kodi, its alpha4 was
released October 3rd: http://xbmc.org/kodi-14-0-helix-alpha-4

In order to prepare this version bump I am sharing my patchset as an RFC, two
preparatory patches to rename the package, splitted for easier review, and one
patch for the real version bump.

Regards, Bernd

v3: - rebased
    - added audioenconder addons, Kodi now needs to be installed to STAGING_DIR
    - kodi: removed dependency to flac, backported from upstream master
    - bumped xbmc-pvr-addons
    - bumped xbmc-addon-xvdr
    - note: kodi specific ffmpeg-patches no longer depend on
            http://patchwork.ozlabs.org/patch/396911/
            patch was committed to buildroot

v2: - rebased: - _CONF_OPT -> _CONF_OPTS
    - added notes to "Rename XBMC to Kodi"-patches, they are meant to be committed
      together (Yann)
    - kodi specific ffmpeg-patches are now a seperate commit (Yann),
      depends on http://patchwork.ozlabs.org/patch/396911/
    - ffmpeg is now compiled dynamically, ported from
      https://github.com/OpenELEC/OpenELEC.tv/commit/ba586280

Bernd Kuhls (11):
  package/ffmpeg: Add Kodi patchset
  Rename XBMC to Kodi - part I - move files
  Rename XBMC to Kodi - part II - rename variables
  package/kodi: Bump version to 14.0a4-Helix
  xbmc-pvr-addons: Bump version for Helix-compatibility
  package/xbmc-addon-xvdr: Bump version for Helix-compatibility
  package/kodi: Enable install to STAGING_DIR, needed for audioencoder
    addons
  kodi-audioencoder-flac: New package
  package/kodi-audioencoder-lame: New package
  package/kodi-audioencoder-vorbis: New package
  package/kodi-audioencoder-wav: New package

 package/ffmpeg/ffmpeg-0001-fminf.patch          |   47 +++++++++
 package/libplist/libplist.mk                    |    5 +-
 package/openssl/openssl.mk                      |    2 -
 package/uclibc/0.9.33.2/uclibc-0063-fminf.patch |  127 -----------------------
 4 files changed, 51 insertions(+), 130 deletions(-)
 create mode 100644 package/ffmpeg/ffmpeg-0001-fminf.patch
 delete mode 100644 package/uclibc/0.9.33.2/uclibc-0063-fminf.patch

-- 
1.7.10.4
