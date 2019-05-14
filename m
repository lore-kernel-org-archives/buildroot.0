From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 14 May 2019 14:41:06 +0300
Subject: [Buildroot] [PATCH 0/5] Update WPE WebKit to 2.24.x
Message-ID: <20190514114111.20424-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

This is combined patch set which makes it possible to use WPE WebKit 2.24.x
with Buildroot, including updates to the dependencies and the Cog browser
to make sure compatible releases[1][2] are used.

I am also sneaking in the patch series an update to libepoxy which I had
submitted a while ago[3] and which has not been merged yet. While it is
not strictly needed, this brings in a fix for drivers which have support
for OpenGL ES 3.x

Best reagrds,
?Adrian

---
[1] https://wpewebkit.org/release/schedule/#compatible-components
[2] https://github.com/Igalia/cog/releases/tag/v0.3.0
[3] https://patchwork.ozlabs.org/patch/981531/


Adrian Perez de Castro (5):
  package/libwpe: bump to version 1.2.0
  package/wpebackend-fdo: bump to version 1.2.0
  package/libepoxy: update to version 1.5.3, convert to Meson
  package/wpewebkit: bump to version 2.24.1
  package/cog: bump version to 0.3.0

 package/cog/cog.hash                       |  2 +-
 package/cog/cog.mk                         |  2 +-
 package/libepoxy/libepoxy.hash             |  4 ++--
 package/libepoxy/libepoxy.mk               | 13 +++++++------
 package/libwpe/libwpe.hash                 |  8 ++++----
 package/libwpe/libwpe.mk                   |  2 +-
 package/wpebackend-fdo/wpebackend-fdo.hash |  8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   |  2 +-
 package/wpewebkit/Config.in                | 17 +----------------
 package/wpewebkit/wpewebkit.hash           |  8 ++++----
 package/wpewebkit/wpewebkit.mk             | 10 ++--------
 11 files changed, 28 insertions(+), 48 deletions(-)

-- 
2.21.0
