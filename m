From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 00:08:46 +0000
Subject: [Buildroot] [PATCH 0/9] Fixes for go language support
Message-ID: <cover.1463010771.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series includes a number of fixup and enhancments for the go language
support.  All the buildbot problems pointed out by Thomas [1] are resolved by
this series.

[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159336.html

-Geoff

The following changes since commit 30706f9252021283374903c078e4380e7ee0c985:

  android-tools: adb/adbd sub options use fork(), need MMU (2016-05-11 22:47:28 +0200)

are available in the git repository at:

  git at github.com:glevand/buildroot--buildroot.git for-merge-go-fixes

for you to fetch changes up to 9caa1646d3da7936fb25fd4e4cd2dcd8b8387374:

  package/flannel: Set go env variables (2016-05-11 16:48:02 -0700)

----------------------------------------------------------------
Geoff Levand (9):
      package/go-bootstrap: Add toolchain dependency
      package/go-bootstrap: Set CGO_ENABLED=0
      package/go-bootstrap: Set CC to host CC
      package/go: Add BR2_TOOLCHAIN_HAS_THREADS
      package/go: Fix powerpc64 config typo
      package/go: Enable MIPS support
      package/go: Add HOST_GO_TOOLDIR
      package/go: Build special host binaries
      package/flannel: Set go env variables

 package/flannel/flannel.mk           |  6 ++++-
 package/go-bootstrap/go-bootstrap.mk |  6 ++++-
 package/go/Config.in.host            |  3 ++-
 package/go/go.mk                     | 43 ++++++++++++++++++++++++++++++++----
 4 files changed, 51 insertions(+), 7 deletions(-)

-- 
2.5.0
