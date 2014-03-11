From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 11 Mar 2014 23:39:41 +0100
Subject: [Buildroot] [PATCH v7 0/6] PATH cleanup
Message-ID: <1394577587-6426-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Yet another round for this PATH cleanup series, the 7th, just containing few
fixes from the previous one.

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
