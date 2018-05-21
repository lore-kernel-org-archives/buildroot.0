From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Mon, 21 May 2018 10:53:05 -0700
Subject: [Buildroot] [PATCH v2 0/5] add support for gRPC C and C++ bindings
Message-ID: <20180521175310.18563-1-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

This is just a rough in patch to get gRPC in some fashion
into the build. It uses collectd as an integration test
since that is already available and doesn't require a
custome application to be developed.

Ignore the "first" patch - it is in next, but it is needed
for this series to compile. The patches are suppose to
be against "origin/master" according to the docs so it is
included here.

Change v1 -> v2
Add the git-format-patch blurbs from github pull requests
Add the static/shared lib config to gRPC
Restack on the "next" patch for protobuf 3.5.0+
Update Config.in in grpc and collectd from Thomas

Charles Hardin (4):
  package/protobuf: add a patch for mips big endian
  package/c-ares: enable the host variant for a c-ares install
  grpc: new package
  package/collectd: allow the grpc plugin to be configured

Martijn de Gouw (1):
  package/protobuf: bump to version 3.5.1

 package/Config.in                                  |   1 +
 package/c-ares/c-ares.mk                           |   1 +
 package/collectd/Config.in                         |  11 +++
 package/collectd/collectd.mk                       |   4 +-
 ...onmental-overrides-of-protoc-dtrace-and-l.patch |  72 +++++++++++++++
 package/grpc/Config.in                             |  19 ++++
 package/grpc/grpc.hash                             |   2 +
 package/grpc/grpc.mk                               | 101 +++++++++++++++++++++
 ...w-a-compilation-under-mips-big-endian-wit.patch |  38 ++++++++
 package/protobuf/protobuf.hash                     |   2 +-
 package/protobuf/protobuf.mk                       |   2 +-
 package/python-protobuf/python-protobuf.hash       |   2 +-
 12 files changed, 251 insertions(+), 4 deletions(-)
 create mode 100644 package/grpc/0001-Allow-environmental-overrides-of-protoc-dtrace-and-l.patch
 create mode 100644 package/grpc/Config.in
 create mode 100644 package/grpc/grpc.hash
 create mode 100644 package/grpc/grpc.mk
 create mode 100644 package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch

-- 
2.15.1 (Apple Git-101)
