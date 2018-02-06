From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue,  6 Feb 2018 15:39:48 +0100
Subject: [Buildroot] [PATCH 0/4] openjdk
Message-ID: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series is the result of some effort that was spent in the past to get
openjdk build without crazy dependencies on e.g. X11, cups, etc. if all you need
is some basic Java.
It was made in the context of PowerPC on an older Buildroot release.

This series is sent not so much for immediate integration in mainline
Buildroot, but rather to help others that are interested in openjdk support.
They could use this series as a starting point and possibly improve it.

The openjdk variant used is Zero.
In order to build the more performant Zero Shark, one needs LLVM JIT.

The size optimization patches may need to be converted in actual config options,
as not all use cases may desire them.

Best regards,
Thomas


Thomas De Schampheleire (4):
  openjdk: new package
  openjdk size optimization: disable debug info
  openjdk size optimization: link dynamically with system libstdc++
  openjdk size optimization: compress JAR files

 package/Config.in                                  |   1 +
 package/openjdk/Config.in                          |  30 +++++
 package/openjdk/openjdk.mk                         | 121 ++++++++++++++++++
 .../openjdk8-find-compiler-fix-env-respect.patch   | 140 +++++++++++++++++++++
 ...8-fix-assembler-flag-handling-in-makefile.patch |  20 +++
 package/openjdk/openjdk8-fix-zero-mode-crash.patch |  49 ++++++++
 .../openjdk/openjdk8-no-genx11-in-headless.patch   |  17 +++
 package/openjdk/openjdk8-no-unused-deps.patch      |  94 ++++++++++++++
 .../openjdk/openjdk8-restrict-to-staging-dir.patch |  11 ++
 9 files changed, 483 insertions(+)
 create mode 100644 package/openjdk/Config.in
 create mode 100644 package/openjdk/openjdk.mk
 create mode 100644 package/openjdk/openjdk8-find-compiler-fix-env-respect.patch
 create mode 100644 package/openjdk/openjdk8-fix-assembler-flag-handling-in-makefile.patch
 create mode 100644 package/openjdk/openjdk8-fix-zero-mode-crash.patch
 create mode 100644 package/openjdk/openjdk8-no-genx11-in-headless.patch
 create mode 100644 package/openjdk/openjdk8-no-unused-deps.patch
 create mode 100644 package/openjdk/openjdk8-restrict-to-staging-dir.patch

-- 
2.13.6
