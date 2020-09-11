From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 11 Sep 2020 18:34:06 +0200
Subject: [Buildroot] [PATCH v2 0/3] bump grpc to 1.32.0
Message-ID: <20200911163409.25778-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this series bumps grpc and its dependencies

- libabseil with two patchreleases
- protobuf 3.13
- grpc 1.32

Tested with grpc.config:

BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_GRPC=y

on Ubuntu 20.04, gcc 9.3.0

./utils/test-pkg -c grpc.config -p grpc
   br-arm-full [1/6]: OK
   br-arm-cortex-a9-glibc [2/6]: OK
   br-arm-cortex-m4-full [3/6]: SKIPPED
   br-x86-64-musl [4/6]: OK
   br-arm-full-static [5/6]: SKIPPED
   sourcery-arm [6/6]: OK 


Michael Nosthoff (3):
  package/libabseil-cpp: bump to 20200225.2
  package/{protobuf, python-protobuf}: bump to version 3.13.0
  package/grpc: bump version to 1.32.0

 .../grpc/0001-target-build-using-host-plugin.patch    |  4 ++--
 ...-detect-the-availability-of-pthread_setname_.patch |  4 ++--
 package/grpc/grpc.hash                                |  2 +-
 package/grpc/grpc.mk                                  | 11 ++++++-----
 package/libabseil-cpp/libabseil-cpp.hash              |  2 +-
 package/libabseil-cpp/libabseil-cpp.mk                |  2 +-
 package/protobuf/protobuf.hash                        |  2 +-
 package/protobuf/protobuf.mk                          |  6 +++---
 package/python-protobuf/Config.in                     |  2 +-
 package/python-protobuf/python-protobuf.hash          |  2 +-
 10 files changed, 19 insertions(+), 18 deletions(-)

-- 
2.25.1
