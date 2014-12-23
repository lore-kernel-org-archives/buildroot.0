From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Dec 2014 18:46:23 +0100
Subject: [Buildroot] [PATCH v9 00/18] package/kodi: Bump version to
	14.0-Helix
Message-ID: <1419356801-31525-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the follow-up version of XBMC 13.x-Gotham is called Kodi and was released today.

This patchset consists of two preparatory patches each to rename the packages,
splitted for easier review, and one patch each for the real version bumps
along with some version bumps and new packages to be used with optical drives.

Regards, Bernd

v9: - rebased
    - bumped Kodi to 14.0-Helix
    - bumped kodi-pvr-addons
    - rebased kodi specific ffmpeg-patches against Kodi upstream
    - added ffmpeg version bump

v8: - rebased
    - bumped Kodi to 14.0rc3-Helix
    - bumped kodi-pvr-addons
    - bumped kodi-audioencoder-flac
    - rebased kodi specific ffmpeg-patches against ffmpeg-2.5

v7: - rebased
    - bumped Kodi to 14.0b5-Helix
    - bumped kodi-pvr-addons

v6: - rebased
    - bumped Kodi to 14.0b3-Helix
    - bumped audioencoder addons
    - renamed xbmc-pvr-addons to kodi-pvr-addons
    - renamed xbmc-addon-xvdr to kodi-addon-xvdr
    - bumped kodi-pvr-addons, removed dependencies to boost & mysql

v5: - rebased
    - bumped Kodi to 14.0b2-Helix
    - bumped libcec to 2.2.0, Helix depends on this version
    - bumped audioencoder addons

v4: - rebased
    - renamed package/kodi-audioencoder-wav/kodi-audioencoder-flac.mk to
      package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
    - added option BR2_PACKAGE_KODI_OPTICALDRIVE to enable support for optical
      drives
    - audioencoder addons depend in BR2_PACKAGE_KODI_OPTICALDRIVE, see
      https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/virtual/mediacenter/package.mk#L46

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


Bernd Kuhls (18):
  package/ffmpeg: bump version to 2.5.2
  package/libcec: Bump to version 2.2.0
  package/ffmpeg: Add Kodi patchset
  Rename XBMC to Kodi - part I - move files
  Rename XBMC to Kodi - part II - rename variables
  package/kodi: Bump version to 14.0-Helix
  Rename xbmc-pvr-addons to kodi-pvr-addons - part I - move files
  Rename xbmc-pvr-addons to kodi-pvr-addons - part II - rename
    variables
  package/kodi-pvr-addons: Bump version for Helix-compatibility
  Rename xbmc-addon-xvdr to kodi-addon-xvdr - part I - move files
  Rename xbmc-addon-xvdr to kodi-addon-xvdr - part II - rename
    variables
  package/kodi-addon-xvdr: Bump version for Helix-compatibility
  package/kodi: New option to enable support for optical drives
  package/kodi: Enable install to STAGING_DIR, needed for audioencoder
    addons
  package/kodi-audioencoder-flac: New package
  package/kodi-audioencoder-lame: New package
  package/kodi-audioencoder-vorbis: New package
  package/kodi-audioencoder-wav: New package

-- 
1.7.10.4
