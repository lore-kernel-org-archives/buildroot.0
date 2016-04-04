From: Geoff Levand <geoff@infradead.org>
Date: Mon, 04 Apr 2016 19:31:49 +0000
Subject: [Buildroot] [PATCH v3 0/3] Add go language support
Message-ID: <cover.1459798147.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for the go programming language.  I tested the build of
the included flannel package on i386, powerpc64, arm (32 bit) and arm64.  I did
runtime testing of the generated flannel binary on arm64.

Patch 1 adds a host only bootstrap compiler needed to build the latest go
versions.

Patch 2 adds support for a host cross compiler, libraries and tools.

Patch 3 adds a go language package flannel that can be used to test the go
compiler.

Changes for v3:

o Rebase to latest (261cef0fe9598eadfe8a8efa80def40640f2e9f8).

Changes for v2:

o Dropped go target support.  We can consider it again if there is a strong use
  case.
o General cleanup of package files.  Added comments, fixed variable names,
  use github helper function.

-Geoff

The following changes since commit 261cef0fe9598eadfe8a8efa80def40640f2e9f8:

  wilc1000-firmware: new package (2016-04-02 17:18:32 +0200)

are available in the git repository at:

  git at github.com:glevand/buildroot--buildroot.git go-v3

for you to fetch changes up to 762e3d2b6b696656441d9818512ac7ac10221e7f:

  flannel: new package (2016-04-04 12:12:48 -0700)

----------------------------------------------------------------
Geoff Levand (3):
      go-bootstrap: new host package
      go: new host package
      flannel: new package

 package/Config.in                      |  1 +
 package/Config.in.host                 |  1 +
 package/flannel/Config.in              |  9 ++++
 package/flannel/flannel.hash           |  2 +
 package/flannel/flannel.mk             | 42 +++++++++++++++++++
 package/go-bootstrap/go-bootstrap.hash |  2 +
 package/go-bootstrap/go-bootstrap.mk   | 38 +++++++++++++++++
 package/go/Config.in.host              | 13 ++++++
 package/go/go.hash                     |  2 +
 package/go/go.mk                       | 75 ++++++++++++++++++++++++++++++++++
 10 files changed, 185 insertions(+)
 create mode 100644 package/flannel/Config.in
 create mode 100644 package/flannel/flannel.hash
 create mode 100644 package/flannel/flannel.mk
 create mode 100644 package/go-bootstrap/go-bootstrap.hash
 create mode 100644 package/go-bootstrap/go-bootstrap.mk
 create mode 100644 package/go/Config.in.host
 create mode 100644 package/go/go.hash
 create mode 100644 package/go/go.mk

-- 
2.5.0
