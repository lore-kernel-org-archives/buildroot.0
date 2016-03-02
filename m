From: Geoff Levand <geoff@infradead.org>
Date: Wed, 02 Mar 2016 19:23:33 +0000
Subject: [Buildroot] [PATCH 0/4] Add go language support
Message-ID: <cover.1456946494.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series add support for the go programming language.  I tested the build of
the included flannel package on i386, powerpc64, arm (32 bit) and arm64.  I did
runtime testing of the generated flannel binary on arm64.

Patch 1 adds a host only bootstrap compiler needed to build the latest go
versions.  The host and target support can be build independently, but either
of the two need this bootstrap package.

Patch 2 adds support for a host cross compiler, libraries and tools.

Patch 3 adds support for a native compiler, libraries and tools for the target.

Patch 4 add a go language package flannel that can be used to test the go
compiler.

Please consider for merege.

-Geoff

The following changes since commit aaf6c28a5c49251df31b82c48c971bc18183cf6b:

  Update for 2016.02 (2016-03-01 21:47:30 +0100)

are available in the git repository at:

  git at github.com:glevand/buildroot--buildroot.git for-merge-go

for you to fetch changes up to 1572d192abce3a19798cdfe75f3aef8f9e3e504c:

  Add package flannel (2016-03-02 11:20:54 -0800)

----------------------------------------------------------------
Geoff Levand (4):
      Add package go-bootstrap
      Add go host support
      Add go target support
      Add package flannel

 package/Config.in                      |   2 +
 package/Config.in.host                 |   2 +
 package/flannel/Config.in              |   9 +++
 package/flannel/flannel.hash           |   3 +
 package/flannel/flannel.mk             |  37 ++++++++++++
 package/go-bootstrap/Config.in.host    |   6 ++
 package/go-bootstrap/go-bootstrap.hash |   2 +
 package/go-bootstrap/go-bootstrap.mk   |  36 +++++++++++
 package/go/Config.in                   |   9 +++
 package/go/Config.in.host              |  14 +++++
 package/go/go.hash                     |   2 +
 package/go/go.mk                       | 107 +++++++++++++++++++++++++++++++++
 12 files changed, 229 insertions(+)
 create mode 100644 package/flannel/Config.in
 create mode 100644 package/flannel/flannel.hash
 create mode 100644 package/flannel/flannel.mk
 create mode 100644 package/go-bootstrap/Config.in.host
 create mode 100644 package/go-bootstrap/go-bootstrap.hash
 create mode 100644 package/go-bootstrap/go-bootstrap.mk
 create mode 100644 package/go/Config.in
 create mode 100644 package/go/Config.in.host
 create mode 100644 package/go/go.hash
 create mode 100644 package/go/go.mk

-- 
2.5.0
