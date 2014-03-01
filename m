From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  1 Mar 2014 20:59:07 +0100
Subject: [Buildroot] [PATCH v5 0/4] PATH cleanup
Message-ID: <1393703951-7059-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Another round for this series, with this time, as main change: the
removing of any intermediat BR_PATH variable, and the export of PATH,
making the series even shorter. :)

Yours,
Samuel** BLURB HERE ***

Samuel Martin (4):
  bustle: use TARGET_MAKE_ENV instead of setting PATH in the make
    environment
  Makefile: export PATH including the Buildroot host bindirs
  Makefile: add $(HOST_DIR)/sbin to the PATH
  *.mk: remove all occurences of TARGET_PATH and HOST_PATH

 Makefile                 |  4 ++++
 fs/ext2/ext2.mk          |  2 +-
 package/Makefile.in      | 13 ++++---------
 package/bustle/bustle.mk |  2 +-
 package/gpm/gpm.mk       |  2 +-
 package/libhid/libhid.mk |  2 +-
 package/pkg-python.mk    |  8 ++------
 package/sdl/sdl.mk       |  2 +-
 8 files changed, 15 insertions(+), 20 deletions(-)

--
1.9.0
