From: buildroot at heine.tech <buildroot@heine.tech>
Date: Tue, 27 Oct 2020 18:40:43 +0100
Subject: [Buildroot] [PATCH 0/3] fix libabseil-cpp build on older gcc
 versions
Message-ID: <20201027174046.17157-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Nosthoff <buildroot@heine.tech>

This series fixes a bunch of issues with the latest libabseil version on
older gcc versions.

* libabseil doesn't enforce a C++ Standard anymore but needs at least
  C++11. So for GCC < 6 set 11 manually.
* libabseil depends on gcc >= 4.9
* grpc depends on (host-)libabseil-cpp so depend on (host-)gcc >= 4.9

fixes 
  aarch64    | host-libabseil-cpp-20200923.2  | http://autobuild.buildroot.net/results/5780d5e21e5e9c0ba86cc422ef995f45dc83cc4c
 aarch64_be  | host-libabseil-cpp-20200923.2  | http://autobuild.buildroot.net/results/8138c63fc13940e1b97f07f24752b199f88ccfa8
    arm      |    libabseil-cpp-20200923.2    | http://autobuild.buildroot.net/results/f8eda966c6400c242680db378c8944444d89d5c5
  mips64el   |    libabseil-cpp-20200923.2    | http://autobuild.buildroot.net/results/38e9427d995e16bc4876f9fdc890c42e4fd04c06
    mips     |    libabseil-cpp-20200923.2    | http://autobuild.buildroot.net/results/4e99415728a6f3c6b396a9872924262652f77996
    arm      |    libabseil-cpp-20200923.2    | http://autobuild.buildroot.net/results/1830577843772bdfd6e310b4d361aa1edf5969d6

Michael Nosthoff (3):
  package/libabseil-cpp: enforce C++11
  package/libabseil-cpp: depend on gcc >= 4.9
  package/grpc: raise (host) gcc dependency to 4.9

 package/grpc/Config.in                 |  8 +++++---
 package/libabseil-cpp/Config.in        |  5 +++--
 package/libabseil-cpp/libabseil-cpp.mk | 10 ++++++++++
 3 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.25.1
