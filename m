From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue,  9 Jul 2019 09:45:48 +0200
Subject: [Buildroot] [PATCH 0/3] continue sanitizing '<pkg>_VERSION' variable
Message-ID: <20190709074551.22747-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch expose the '_DL_VERSION' variable to packages and allow packages
to override it. The goal is to have a clean '_VERSION' variable while preserving
the current operation. In particular, this does not add any new variable since it
was used internaly and is pretty generic so it can handle multiple corner cases
(and not only the git ones).

The 2 following commits uses this variable to sanitize the '_VERSION' variable for
git-fetch packages.


Victor Huesca (3):
  package/pkg-generic: allow to use <pkg>_DL_VERSION in packages .mk
    files
  package: remove common prefix/suffix from git-fetched packages
  package: remove non-conventional prefix/suffix from git-fetched
    packages

 boot/lpc32xxcdl/lpc32xxcdl.mk               | 3 ++-
 package/at/at.mk                            | 3 ++-
 package/brickd/brickd.mk                    | 3 ++-
 package/ctorrent/ctorrent.mk                | 3 ++-
 package/dt-utils/dt-utils.mk                | 3 ++-
 package/f2fs-tools/f2fs-tools.mk            | 3 ++-
 package/fio/fio.mk                          | 3 ++-
 package/fmc/fmc.mk                          | 3 ++-
 package/fmlib/fmlib.mk                      | 3 ++-
 package/gstreamer1/gst1-shark/gst1-shark.mk | 3 ++-
 package/linux-zigbee/linux-zigbee.mk        | 3 ++-
 package/netcat-openbsd/netcat-openbsd.mk    | 3 ++-
 package/pkg-generic.mk                      | 4 +++-
 package/rcw/rcw.mk                          | 3 ++-
 package/speexdsp/speexdsp.mk                | 3 ++-
 package/trace-cmd/trace-cmd.mk              | 3 ++-
 16 files changed, 33 insertions(+), 16 deletions(-)

-- 
2.21.0
