From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 10 Jun 2019 23:20:21 +0200
Subject: [Buildroot] [PATCH 0/2] Fix linking gerbera with taglib
Message-ID: <20190610212023.9483-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series fixes linking gerbera with taglib.

The first commit adds an upstream patch to tagblib, which fixes `taglib-config`
to output the correct paths when cross-compiling.

The second commit add an upstream patch to gerbera, which fixes the
behaviour of `find_program(taglib-config)` when cross-compiling. By
default, `find_program()` only searches on the host for binaries.
However, in the case of `taglib-config` it should only search in the
sysroot path for `taglib-config`.

Note, that the issue has been detected by the autobuilder for version 1.3.0 of
gerbera (current version is 1.3.1), but it is still present.

Fixes:
http://autobuild.buildroot.org/results/e95/e9548f8d43abe3a2f2aab4acaa19289af2b9737d
http://autobuild.buildroot.org/results/efa/efa203e07c2dd5aed09c0ed23e3bd56fa2dadd2a

J?rg Krause (2):
  package/taglib: add upstream patch to fix taglib-config
  package/gerbera: add upstream patch to fix find_program with
    taglib-config

 ...m-taglib-config-when-cross-compiling.patch | 46 +++++++++++++
 ...-config-file-for-cross-compiling-906.patch | 66 +++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 package/gerbera/0002-Fix-find_program-taglib-config-when-cross-compiling.patch
 create mode 100644 package/taglib/0001-fix-taglib-config-file-for-cross-compiling-906.patch

-- 
2.22.0
