From: Geoff Levand <geoff@infradead.org>
Date: Thu, 19 May 2016 22:33:25 +0000
Subject: [Buildroot] [PATCH 0/3] go language enhancements
Message-ID: <cover.1463696779.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 3 adds a new package etcd, which does not use cgo support and can be used
to test builds without BR2_TOOLCHAIN_HAS_THREADS.

-Geoff

The following changes since commit 3f3342a581970977f28620f17391d8aaf2204fec:

  Update for 2016.05-rc2 (2016-05-17 16:11:24 +0200)

are available in the git repository at:

  git at github.com:glevand/buildroot--buildroot.git for-merge-go-enhancements

for you to fetch changes up to 2693e1ba9409afcdea6b26f0d118c48cdfd0766e:

  etcd: new package (2016-05-19 15:20:13 -0700)

----------------------------------------------------------------
Geoff Levand (3):
      package/go-bootstrap: Build host tools with host CC
      package/go: Enable MIPS support
      etcd: new package

 package/Config.in                    |  1 +
 package/etcd/Config.in               |  9 +++++
 package/etcd/S80etcd2                | 33 ++++++++++++++++++
 package/etcd/etcd.hash               |  2 ++
 package/etcd/etcd.mk                 | 67 ++++++++++++++++++++++++++++++++++++
 package/etcd/etcd2.service           | 17 +++++++++
 package/etcd/etcd2_sysv.conf         | 13 +++++++
 package/etcd/etcd2_tmpfiles.conf     |  1 +
 package/go-bootstrap/go-bootstrap.mk |  3 ++
 package/go/Config.in.host            |  2 +-
 package/go/go.mk                     |  4 +++
 11 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 package/etcd/Config.in
 create mode 100644 package/etcd/S80etcd2
 create mode 100644 package/etcd/etcd.hash
 create mode 100644 package/etcd/etcd.mk
 create mode 100644 package/etcd/etcd2.service
 create mode 100644 package/etcd/etcd2_sysv.conf
 create mode 100644 package/etcd/etcd2_tmpfiles.conf

-- 
2.5.0
