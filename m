From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:15 -0600
Subject: [Buildroot] [NEXT 00/26] Package CVE Reporting
Message-ID: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds new infrastructure to report
a packages CPE identifier in a similar way
that the legal info is currently reported.

The addition of CPE IDs to the packages is a
manual process, but in a later patchset
additions are planned to the pkg-stats script
to automate maintenance the process.

Matt Weber (26):
  cpe-info: new make target
  cpe-info: update manual for new pkg vars
  cpe-info: id prefix/suffix
  cpe-info: only report target pkgs
  bash: add CPE id
  boa: add CPE id
  boost: add CPE id
  busybox: add CPE id
  bzip2: add CPE id
  dhcp: add CPE id
  e2fsprogs: add CPE id
  gdb: add CPE id
  glibc: add CPE id
  gnupg: add CPE id
  gzip: add CPE id
  iproute2: add CPE id
  libgcrypt: add CPE id
  libopenssl: add CPE id
  libzlib: add CPE id
  linux: add CPE id
  linux-headers: add CPE id
  openssh: add CPE id
  rsyslog: add CPE id
  tcpdump: add CPE id
  util-linux: add CPE id
  xerces: add CPE id

 Makefile                                | 17 ++++++++++++++++-
 docs/manual/adding-packages-generic.txt | 15 +++++++++++++++
 linux/linux.mk                          |  1 +
 package/bash/bash.mk                    |  1 +
 package/boa/boa.mk                      |  2 +-
 package/boost/boost.mk                  |  1 +
 package/busybox/busybox.mk              |  1 +
 package/bzip2/bzip2.mk                  |  2 ++
 package/dhcp/dhcp.mk                    |  1 +
 package/e2fsprogs/e2fsprogs.mk          |  1 +
 package/gdb/gdb.mk                      |  1 +
 package/glibc/glibc.mk                  |  2 ++
 package/gnupg/gnupg.mk                  |  1 +
 package/gzip/gzip.mk                    |  1 +
 package/iproute2/iproute2.mk            |  1 +
 package/libgcrypt/libgcrypt.mk          |  1 +
 package/libopenssl/libopenssl.mk        |  1 +
 package/libzlib/libzlib.mk              |  1 +
 package/linux-headers/linux-headers.mk  |  1 +
 package/openssh/openssh.mk              |  2 ++
 package/pkg-generic.mk                  | 26 ++++++++++++++++++++++++++
 package/pkg-utils.mk                    |  8 ++++++++
 package/rsyslog/rsyslog.mk              |  1 +
 package/tcpdump/tcpdump.mk              |  1 +
 package/util-linux/util-linux.mk        |  2 ++
 package/xerces/xerces.mk                |  1 +
 26 files changed, 91 insertions(+), 2 deletions(-)

-- 
1.9.1
