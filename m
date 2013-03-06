From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  6 Mar 2013 18:14:21 +0100
Subject: [Buildroot] [PATCH 0/5] CMake packages improvements
Message-ID: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here are a few improvements to the current handling of CMake packages in
Buildroot.

The first three patch cleanup the CMake host package and bump to the latest
version.
Patch 4 is the most interesting, as it allows CMake packages to benefit from
ccache to dramatically reduce build times. This was impossile so far because
CMake would fail detecting the compiler.
Patch 5 removes .cmake files from the target. This is similar to what BR
alreay does with pkg-config's .pc files.

Luca

Luca Ceresoli (5):
  cmake: convert spaces to tabs in make rules
  cmake: remove target package macro (not really implemented)
  cmake: bump to 2.8.10.2
  Enable ccache for cmake packages
  CMake packages: remove .cmake files from target directory

 Makefile               |    6 ++++--
 package/cmake/cmake.mk |   17 ++++++++---------
 package/pkg-cmake.mk   |   31 +++++++++++++++++++++++++++++--
 3 files changed, 41 insertions(+), 13 deletions(-)

-- 
1.7.10.4
