From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 12:02:08 +0200
Subject: [Buildroot] [PATCH 0/3] package/pkg-cmake.mk: host: build shared as
 default
Message-ID: <20200916100212.2903033-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this is a follow-up to this discussion/investigation
 http://lists.busybox.net/pipermail/buildroot/2020-September/291494.html

first for doxygen and clangd/lld -DBUILD_SHARED_LIBS is enforced to =OFF.
finally the default flag -DBUILD_SHARED_LIBS=ON is set.

Michael Nosthoff (3):
  package/doxygen: disable shared libs for host
  package/{clang, lld}: host: disable shared_libs
  package/pkg-cmake.mk: build host with shared libs

 package/clang/clang.mk     | 1 +
 package/doxygen/doxygen.mk | 2 ++
 package/lld/lld.mk         | 3 +++
 package/pkg-cmake.mk       | 1 +
 4 files changed, 7 insertions(+)

-- 
2.25.1
