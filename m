From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  3 Feb 2021 13:43:21 +0100
Subject: [Buildroot] [PATCH 0/3] grpc-related fixes
Message-ID: <20210203124325.18843-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Commit fedf3318e3fd3c9ba57389ed2b36472f1a772b9e removed an obsolete patch on
grpc, but this had the side effect that building collectd after grpc no longer
succeeded, because grpc_cpp_plugin from the target was executed.

During investigation of this issue, a number of related problems were found.
This series addresses these problems.

Thomas De Schampheleire (3):
  package/collectd: stop passing '--with-libgrpc++'
  package/grpc: fix cross-compilation with
    gRPC_BUILD_GRPC_CPP_PLUGIN=OFF
  package/grpc: disable unnecessary build plugins

 package/collectd/collectd.mk                  |  3 --
 ...ix-cross-compilation-with-gRPC_BUILD.patch | 43 +++++++++++++++++++
 package/grpc/grpc.mk                          |  9 +++-
 3 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch

-- 
2.26.2
