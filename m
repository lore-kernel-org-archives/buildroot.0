From: Doug Kehn <rdkehn@yahoo.com>
Date: Sun, 10 Jan 2016 15:25:05 -0600
Subject: [Buildroot] [RFC PATCH v2 0/4] package/dhcp
Message-ID: <1452461109-27498-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series bumps dhcp package to 4.3.3. I'm doing this as an RFC to get
feed back on the handling of the embedded bind tar-ball that now exists within
the dhcp package.

It looks to me that the embedded bind source is only used to build static
libraries for use by the dhcp source. I don't think these libraries are indented
to be used outside the dhcp package.

I built with an arm-buildroot-linux-gnueabihf toolchain and tested dhclient on a
custom TI-AM3352 based board.

Buildroot thread
  http://lists.busybox.net/pipermail/buildroot/2016-January/149079.html
for related information.

I have not yet pushed any patches upstream. I beleive patches
   0002-dhcp-bind-host-gen.patch
   0003-toolchain-ar.patch
are candidates for upstream, agree?

Regards,
...doug

---
Changes v1 -> v2
  - removed DHCP_PRE_BUILD_HOOKS in favor of patch (suggested by Arnout)
---
Doug Kehn (4):
  package/dhcp: bump version to 4.3.3
  package/dhcp: add bind configure options for cross compiling
  package/dhcp: ensure host cc is used for compiling gen
  package/dhcp: remove hard coded ar reference

 package/dhcp/0001-bind-configure.patch     | 19 ++++++++++
 package/dhcp/0002-dhcp-bind-host-gen.patch | 22 ++++++++++++
 package/dhcp/0003-toolchain-ar.patch       | 58 ++++++++++++++++++++++++++++++
 package/dhcp/dhcp.hash                     |  4 +--
 package/dhcp/dhcp.mk                       | 15 +++++++-
 5 files changed, 115 insertions(+), 3 deletions(-)
 create mode 100644 package/dhcp/0001-bind-configure.patch
 create mode 100644 package/dhcp/0002-dhcp-bind-host-gen.patch
 create mode 100644 package/dhcp/0003-toolchain-ar.patch

-- 
2.6.4
