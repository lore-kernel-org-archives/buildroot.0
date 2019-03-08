From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  8 Mar 2019 16:04:18 -0600
Subject: [Buildroot] [PATCH v8 0/9] Package CPE Reporting
Message-ID: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds new infrastructure to report a target's set of package
CPE identifiers in a similar way to that of the legal info reporting.

The addition of CPE IDs to packages can be a manual process but there is
a default value which hopefully will match the string.  A cpe-report tool
is provided to help manage the accuracy of the CPE strings.  Some existing
fix-ups forthe CPE strings can be found in the following commit that
eventually needs to be split up and applied.

https://github.com/rc-matthew-l-weber/buildroot/commit/8ce8d4740b95672d8390799b611a35ea18a543e0

Changes from v7
- The pkg-stats CPE status update has been dropped as it seemed like a
  better feature to be integrated at the release-monitoring.org level.
  Or could be reopened with a new direction as part of GSoC.
  (http://patchwork.ozlabs.org/patch/985550/)
- cpe-report script has been overhauled to provide preformatted xml
  for version updates to help accelerate sending those to NIST
- A new security management section was added to the manual with details
  on CPE upkeep and manual CVE analysis tools.


Matt Weber (8):
  cpe-info: new make target
  cpe-info: id prefix/suffix
  cpe-info: only report target pkgs
  cpe-info: cpe minor version support
  cpe-info: update manual for new pkg vars
  support/scripts/cpedb.py: new CPE XML helper
  support/scripts/cpe-report: new script
  docs/manual: new security management section

Shruthi Singh (1):
  toolchain/toolchain-ext: glibc cpe-info support

 Makefile                                           |  17 +-
 docs/manual/adding-packages-generic.txt            | 111 ++++++++-----
 docs/manual/cpe-reporting.txt                      | 103 ++++++++++++
 docs/manual/manual.txt                             |   2 +
 package/Makefile.in                                |   4 +
 package/pkg-generic.mk                             |  36 ++++
 package/pkg-utils.mk                               |   8 +
 support/scripts/cpe-report                         |  70 ++++++++
 support/scripts/cpedb.py                           | 185 +++++++++++++++++++++
 .../toolchain-external/pkg-toolchain-external.mk   |   7 +
 10 files changed, 499 insertions(+), 44 deletions(-)
 create mode 100644 docs/manual/cpe-reporting.txt
 create mode 100755 support/scripts/cpe-report
 create mode 100644 support/scripts/cpedb.py

-- 
1.9.1
