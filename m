From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 22 Sep 2020 00:37:44 +0300
Subject: [Buildroot] [PATCH v2 0/4] Update WPE stack to WebKit 2.30.x
Message-ID: <20200921213748.1846851-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is v2 of the patch set, thanks to Thomas for the comments on
the previous version :)

Changes over v1 of the patch set:

  - Dropped unneeded dependencies, BR2_PACKAGE_HAS_LIBEGL_WAYLAND
    already implies that an EGL+GLES stack is available, which is
    what wpebackend-fdo needs.
  - Use WPE WebKit 2.30.1 instead of 2.30.0

Adrian Perez de Castro (4):
  package/wpebackend-fdo: bump to version 1.8.0
  package/wpebackend-fdo: switch over to Meson
  package/wpewebkit: bump to version 2.30.1
  package/cog: bump to version 0.8.0

 package/cog/cog.hash                       | 8 ++++----
 package/cog/cog.mk                         | 2 +-
 package/wpebackend-fdo/Config.in           | 1 +
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 6 +++---
 package/wpewebkit/wpewebkit.hash           | 8 ++++----
 package/wpewebkit/wpewebkit.mk             | 2 +-
 7 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.28.0
