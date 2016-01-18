From: Doug Kehn <rdkehn@yahoo.com>
Date: Mon, 18 Jan 2016 09:42:17 -0600
Subject: [Buildroot] [PATCH v3 0/4] package/dhcp
Message-ID: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series bumps dhcp package version to 4.3.3-P1. This series needed
additional consideration due to the embedded bind tar-ball that now exists
within the dhcp package.

This series has been tested with an arm-buildroot-linus-gnueabihf toolchain and
with an external toolchain (by Ricardo Martincoski).

Patches
   0002-dhcp-bind-host-gen.patch
   0003-toolchain-ar.patch
have been submitted upstream.

Buildroot thread
   http://lists.busybox.net/pipermail/buildroot/2016-January/149079.html
has related information.

Regards,
...doug

---
Changes v2 -> v3
  - removed RFC tag
  - updated version from 4.3.3 to 4.3.3-P1 (suggested by Richardo)
  - external toolchain support (suggested by Richardo)
Changes v1 -> v2
  - removed DHCP_PRE_BUILD_HOOKS in favor of patch (suggested by Arnout)
---
Doug Kehn (4):
  package/dhcp: bump version to 4.3.3-P1
  package/dhcp: add bind configure options for cross compiling
  package/dhcp: ensure host cc is used for compiling gen
  package/dhcp: remove hard coded ar referece

 package/dhcp/0001-bind-configure.patch     | 19 ++++++++++
 package/dhcp/0002-dhcp-bind-host-gen.patch | 22 ++++++++++++
 package/dhcp/0003-toolchain-ar.patch       | 58 ++++++++++++++++++++++++++++++
 package/dhcp/dhcp.hash                     |  4 +--
 package/dhcp/dhcp.mk                       | 17 ++++++++-
 5 files changed, 117 insertions(+), 3 deletions(-)
 create mode 100644 package/dhcp/0001-bind-configure.patch
 create mode 100644 package/dhcp/0002-dhcp-bind-host-gen.patch
 create mode 100644 package/dhcp/0003-toolchain-ar.patch

-- 
2.7.0
