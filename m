From: Michael Nosthoff <buildroot@heine.tech>
Date: Thu, 13 Aug 2020 16:45:47 +0200
Subject: [Buildroot] [PATCH 0/2] package/grpc: 1.31.0
Message-ID: <20200813144549.1262366-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

grpc 1.31.0 introduces an new dependency on Google RE2
for Regular Expression parsing.

This series adds RE2 as a new package and bumps
grpc to 1.31.0 with a dependency on RE2

Michael Nosthoff (2):
  package/re2: new package
  package/grpc: bump version to 1.31.0

 package/Config.in                             |  1 +
 .../0001-target-build-using-host-plugin.patch |  4 +--
 ...the-availability-of-pthread_setname_.patch |  7 +++---
 package/grpc/Config.in                        |  3 ++-
 package/grpc/grpc.hash                        |  2 +-
 package/grpc/grpc.mk                          | 12 +++++----
 package/re2/Config.in                         | 12 +++++++++
 package/re2/re2.hash                          |  3 +++
 package/re2/re2.mk                            | 25 +++++++++++++++++++
 9 files changed, 56 insertions(+), 13 deletions(-)
 create mode 100644 package/re2/Config.in
 create mode 100644 package/re2/re2.hash
 create mode 100644 package/re2/re2.mk

-- 
2.25.1
