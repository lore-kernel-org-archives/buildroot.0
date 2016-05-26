From: Geoff Levand <geoff@infradead.org>
Date: Thu, 26 May 2016 18:21:32 +0000
Subject: [Buildroot] [PATCH v3 0/6] Fixes for go language support
Message-ID: <cover.1464286518.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series includes a number of fixup for the go language support.  All the
buildbot problems pointed out by Thomas [1] should be resolved by this series.

Please consider all patches in this series to apply to master.

[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159336.html

Changes for V3:
 o Use two step compiler build for all configs.

-Geoff

The following changes since commit b5630ad7125d30cb5d65de49cc2f120bb5cf62ec:

  eudev: link to real homepage (2016-05-26 15:50:01 +0200)

are available in the git repository at:

  git at github.com:glevand/buildroot--buildroot.git for-merge-go-fixes-v3

for you to fetch changes up to a514602fc2cdd03806a41028d9943a7c94cf92b8:

  package/go: Set file timestamp (2016-05-26 11:10:42 -0700)

----------------------------------------------------------------
Geoff Levand (6):
      package/go: Build host tools with host CC
      package/go: Add HOST_GO_TARGET_ENV
      package/flannel: Use HOST_GO_TARGET_ENV
      package/go: Add HOST_GO_CGO_ENABLED
      package/flannel: Add BR2_TOOLCHAIN_HAS_THREADS
      package/go: Set file timestamp

 package/flannel/Config.in  |  4 ++++
 package/flannel/flannel.mk |  2 +-
 package/go/go.mk           | 54 +++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 54 insertions(+), 6 deletions(-)

-- 
2.5.0
