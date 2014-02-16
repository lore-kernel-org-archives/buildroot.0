From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 14:58:26 +0100
Subject: [Buildroot] [PATCH v4 0/7] PATH cleanup
Message-ID: <1392559113-5215-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Another round for this series, with this time, as main change: the
renaming of BR2_PATH into BR_PATH, to follow what has been stated
during the last Buildroot developper metting.

Note that this series has been rebased on top of the next branch.

Yours,
Samuel


Samuel Martin (7):
  bustle: use TARGET_MAKE_ENV instead of setting PATH in the make
    environment
  Makefile: introduce BR_PATH
  Makefile: add $(HOST_DIR)/sbin to BR_PATH
  *.mk: replace (TARGET|HOST)_PATH by BR_PATH
  infra: remove unused {TARGET, HOST}_PATH definition
  pkg-cmake.mk: add PATH in the configure command environment
  Makefile: export PATH

 Makefile                 |  4 ++++
 fs/ext2/ext2.mk          |  2 +-
 package/Makefile.in      | 13 ++++---------
 package/bustle/bustle.mk |  2 +-
 package/gpm/gpm.mk       |  2 +-
 package/libhid/libhid.mk |  2 +-
 package/pkg-cmake.mk     |  2 ++
 package/pkg-python.mk    |  8 ++++----
 package/sdl/sdl.mk       |  2 +-
 9 files changed, 19 insertions(+), 18 deletions(-)

--
1.8.5.4
