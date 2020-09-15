From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 16 Sep 2020 01:30:47 +0300
Subject: [Buildroot] [PATCH 0/6] Update WPE stack to WebKit 2.30.0
Message-ID: <20200915223053.3090447-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a patch series updating WPE WebKit, its dependencies, and the Cog
launcher to their most recent stable versions.

A couple of notes:

- The version bump for cog can be applied separately from the rest, the
  new version works fine with the versions of packages currently available
  in Buildroot.

- Switching from CMake to Meson can be left out without merging and either
  apply the patches later, or skip them altogether until upstream skips
  shipping the CMake based build system.

- The new wpewebkit version requires the update to wpebackend-fdo, but
  libwpe has barely received changes in this development cycle, so it's
  not mandatory to update it (it's still recommended, though).

Best regards,
?Adri?n

Adrian Perez de Castro (6):
  package/libwpe: bump to version 1.8.0
  package/libwpe: switch over to Meson
  package/wpebackend-fdo: bump to version 1.8.0
  package/wpebackend-fdo: switch over to Meson
  package/wpewebkit: bump to version 2.30.0
  package/cog: bump to version 0.8.0

 package/cog/cog.hash                          |  8 ++--
 package/cog/cog.mk                            |  2 +-
 ...ial-dependency-to-pass-EGL-module-fl.patch | 45 +++++++++++++++++++
 package/libwpe/libwpe.hash                    |  8 ++--
 package/libwpe/libwpe.mk                      |  9 ++--
 package/wpebackend-fdo/Config.in              |  4 +-
 package/wpebackend-fdo/wpebackend-fdo.hash    |  8 ++--
 package/wpebackend-fdo/wpebackend-fdo.mk      |  6 +--
 package/wpewebkit/wpewebkit.hash              |  6 +--
 package/wpewebkit/wpewebkit.mk                |  2 +-
 10 files changed, 72 insertions(+), 26 deletions(-)
 create mode 100644 package/libwpe/0001-meson-Use-a-partial-dependency-to-pass-EGL-module-fl.patch

-- 
2.28.0
