From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 21:59:40 +0100
Subject: [Buildroot] [PATCH 0/6] PATH cleanup
Message-ID: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Here is some cleanup about the *_PATH variables we carry in the
Buildroot infrastructure.

Note that, I'm not certain whether the last patch of this series, the
one exporting the PATH in the Buildroot environment, should be merged;
though I don't see anything against this.

Yours,
Samuel

Samuel Martin (6):
  Makefile: introduce BR2_PATH
  Makefile: add $(HOST_DIR)/sbin to BR2_PATH
  *.mk: replace (TARGET|HOST)_PATH by BR2_PATH
  infra: remove unused {TARGET,HOST}_PATH definition
  pkg-cmake.mk, pkg-autotools.mk: add PATH in the configure command
    environment
  Makefile: export PATH

 Makefile                                   |  4 ++++
 fs/ext2/ext2.mk                            |  2 +-
 package/Makefile.in                        | 12 ++++--------
 package/bustle/bustle.mk                   |  2 +-
 package/libhid/libhid.mk                   |  2 +-
 package/pkg-autotools.mk                   |  2 ++
 package/pkg-cmake.mk                       |  2 ++
 package/python-protobuf/python-protobuf.mk |  2 +-
 8 files changed, 16 insertions(+), 12 deletions(-)

--
1.8.4.2
