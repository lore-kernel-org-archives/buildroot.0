From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 20:44:13 +0100
Subject: [Buildroot] [RFC/PATCH v6 00/17] package/kodi: Bump version to
	14.0b3-Helix
Message-ID: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset is a RFC and not meant to be committed to buildroot git yet.

The follow-up version of XBMC 13.x-Gotham will be called Kodi, its beta3 was
released November 16th.

In order to prepare this version bump I am sharing my patchset as an RFC, two
preparatory patches each to rename the packages, splitted for easier review, and
one patch each for the real version bumps.

Regards, Bernd

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


Bernd Kuhls (17):
  package/libcec: Bump to version 2.2.0
  package/ffmpeg: Add Kodi patchset
  Rename XBMC to Kodi - part I - move files
  Rename XBMC to Kodi - part II - rename variables
  package/kodi: Bump version to 14.0b3-Helix
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
