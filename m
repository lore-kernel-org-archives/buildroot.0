From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:41:39 +0100
Subject: [Buildroot] [PATCH v2 0/6] PATH cleanup
Message-ID: <1390074102-15686-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Here is the 2nd round of the PATH cleanup series.
Not that much to say about this new round (the changes are mostly due to
the rebasing onto master).

Note that I've re-posted the following patches because they are unchanged
and still apply properly on master:
* patch 1/6: http://patchwork.ozlabs.org/patch/290493/
* patch 2/6: http://patchwork.ozlabs.org/patch/290494/
* patch 4/6: http://patchwork.ozlabs.org/patch/290495/

Yours,
Samuel

Samuel Martin (6):
  Makefile: introduce BR2_PATH
  Makefile: add $(HOST_DIR)/sbin to BR2_PATH
  *.mk: replace (TARGET|HOST)_PATH by BR2_PATH
  infra: remove unused {TARGET,HOST}_PATH definition
  pkg-cmake.mk: add PATH in the configure command environment
  Makefile: export PATH

 Makefile                 |  4 ++++
 fs/ext2/ext2.mk          |  2 +-
 package/Makefile.in      | 12 ++++--------
 package/bustle/bustle.mk |  2 +-
 package/libhid/libhid.mk |  2 +-
 package/pkg-cmake.mk     |  2 ++
 package/pkg-python.mk    |  8 ++++----
 package/sdl/sdl.mk       |  2 +-
 8 files changed, 18 insertions(+), 16 deletions(-)

--
1.8.5.3
