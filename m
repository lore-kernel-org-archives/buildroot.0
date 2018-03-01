From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 28 Feb 2018 23:23:31 -0600
Subject: [Buildroot] [next,v2 0/8] Package CPE Reporting
Message-ID: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
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


v2
- Used pkg infra to hid the common CPE ID definition
- Misc cleanup of Makefile approach

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>


Matt Weber (8):
  cpe-info: new make target
  cpe-info: id prefix/suffix
  cpe-info: only report target pkgs
  cpe-info: infra defines CPE_ID_* defaults
  cpe-info: update manual for new pkg vars
  bash: add CPE id
  e2fsprogs: add CPE id
  boa: add CPE id

 Makefile                                |  17 ++++-
 docs/manual/adding-packages-generic.txt | 119 ++++++++++++++++++++------------
 package/bash/bash.mk                    |   1 +
 package/boa/boa.mk                      |   1 +
 package/e2fsprogs/e2fsprogs.mk          |   2 +
 package/pkg-generic.mk                  |  28 ++++++++
 package/pkg-utils.mk                    |   8 +++
 7 files changed, 132 insertions(+), 44 deletions(-)

-- 
1.9.1
