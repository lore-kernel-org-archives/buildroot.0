From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 15 Sep 2017 01:14:44 +0300
Subject: [Buildroot] [PATCH 0/2] toolchain: Add glibc support for ARCv2
Message-ID: <20170914221446.13647-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This short series add glibc support for ARCv2 architecture.
Support of older ARCompact (AKA ARCv1 ISA) is not there yet but we'll
add it soon.

Unfortunately patches in root folder stand in the way for us as our
sources as much ahead of 2.25 release so they got moved again in 2.25
folder, sorry for that.

Alexey Brodkin (2):
  glibc: Move patches to version-specific folder
  toolchain: Add glibc support for ARCv2

 package/glibc/{ => 2.25}/0001-sh-Fix-building-with-gcc5-6.patch    | 0
 ...0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch | 0
 .../0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch   | 0
 .../0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch     | 0
 package/glibc/{ => 2.25}/0005-fix-binutils-2-29-build.patch        | 0
 ...-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch | 0
 package/glibc/{ => 2.25}/0006-sh4-trap.patch                       | 0
 package/glibc/glibc.hash                                           | 2 ++
 package/glibc/glibc.mk                                             | 7 +++++++
 toolchain/toolchain-buildroot/Config.in                            | 2 +-
 10 files changed, 10 insertions(+), 1 deletion(-)
 rename package/glibc/{ => 2.25}/0001-sh-Fix-building-with-gcc5-6.patch (100%)
 rename package/glibc/{ => 2.25}/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch (100%)
 rename package/glibc/{ => 2.25}/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch (100%)
 rename package/glibc/{ => 2.25}/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch (100%)
 rename package/glibc/{ => 2.25}/0005-fix-binutils-2-29-build.patch (100%)
 rename package/glibc/{ => 2.25}/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch (100%)
 rename package/glibc/{ => 2.25}/0006-sh4-trap.patch (100%)

-- 
2.11.0
