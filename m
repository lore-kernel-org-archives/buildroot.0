From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Dec 2010 21:09:55 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/fix-ccache-support
Message-ID: <cover.1291752554.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since last post:

 * Fixed the documentation to not advertise a x2 speed-up

 * Fixed the documentation to not mention that ccache is inside the
   toolchain.

 * Fixed package/ccache/Config.in with a proper description, correct
   link

 * Add final newlines

 * Export HOSTCXX_NOCCACHE just like we export HOSTCC_NOCCACHE.

Regards,

Thomas

The following changes since commit 7e9c3a387820154fd1355f23c2669072c0c3a5f7:
  Peter Korsgaard (1):
        docs/news.html: add 2010.11 announce link

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.02/fix-ccache-support

Thomas Petazzoni (1):
      ccache: rework ccache management

 Config.in                                |    8 ++
 Makefile                                 |   26 +++-
 docs/buildroot.html                      |   31 +++++-
 package/Config.in                        |    2 +-
 package/Makefile.in                      |   10 ++-
 package/ccache/Config.in                 |    9 ++
 package/ccache/ccache.mk                 |   33 +++++
 toolchain/ccache/Config.in               |   16 ---
 toolchain/ccache/Config.in.2             |   13 --
 toolchain/ccache/ccache.mk               |  196 ------------------------------
 toolchain/dependencies/dependencies.sh   |    2 +-
 toolchain/toolchain-buildroot.mk         |    1 -
 toolchain/toolchain-buildroot/Config.in  |    1 -
 toolchain/toolchain-crosstool-ng.mk      |    1 -
 toolchain/toolchain-external.mk          |    1 -
 toolchain/toolchain-external/ext-tool.mk |    2 +-
 16 files changed, 110 insertions(+), 242 deletions(-)
 create mode 100644 package/ccache/Config.in
 create mode 100644 package/ccache/ccache.mk
 delete mode 100644 toolchain/ccache/Config.in
 delete mode 100644 toolchain/ccache/Config.in.2
 delete mode 100644 toolchain/ccache/ccache.mk

Thanks,
-- 
Thomas Petazzoni
