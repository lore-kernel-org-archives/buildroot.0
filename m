From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  9 Mar 2014 15:00:17 +0100
Subject: [Buildroot] [PATCH v6 0/6] PATH cleanup
Message-ID: <1394373623-10650-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Yet another round for this PATH cleanup series, the 6th.

Unlike the previous round, this one does not export PATH, but sets it explicitly
in the environment (even for post-build and post-image scripts), so that it
clearly appears in the logs.

Yours,
Samuel

Samuel Martin (6):
  Makefile: introduce BR_PATH
  Makefile: add $(HOST_DIR)/sbin to BR_PATH
  *.mk: replace (TARGET|HOST)_PATH by BR_PATH
  infra: remove unused {TARGET, HOST}_PATH definition
  pkg-cmake.mk: add PATH in the configure command environment
  Makefile: add PATH to the USER_HOOKS_EXTRA_ENV

 Makefile                 |  3 +++
 fs/ext2/ext2.mk          |  2 +-
 package/Makefile.in      | 13 +++++--------
 package/gpm/gpm.mk       |  2 +-
 package/libhid/libhid.mk |  2 +-
 package/pkg-cmake.mk     |  2 ++
 package/pkg-python.mk    |  8 ++++----
 package/sdl/sdl.mk       |  2 +-
 8 files changed, 18 insertions(+), 16 deletions(-)

--
1.9.0
