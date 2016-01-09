From: Doug Kehn <rdkehn@yahoo.com>
Date: Sat,  9 Jan 2016 15:59:42 -0600
Subject: [Buildroot] [RFC PATCH 0/3] package/dhcp
Message-ID: <1452376785-31174-1-git-send-email-rdkehn@yahoo.com>
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

Regards,
...doug

Doug Kehn (3):
  package/dhcp: bump version to 4.3.3
  package/dhcp: fix bind configure for cross-compiling
  package/dhcp: ensure host cc is used for compiling gen

 package/dhcp/0001-bind-configure.patch     | 19 +++++++++++++++++++
 package/dhcp/0002-dhcp-bind-host-gen.patch | 22 ++++++++++++++++++++++
 package/dhcp/dhcp.hash                     |  4 ++--
 package/dhcp/dhcp.mk                       | 21 ++++++++++++++++++++-
 4 files changed, 63 insertions(+), 3 deletions(-)
 create mode 100644 package/dhcp/0001-bind-configure.patch
 create mode 100644 package/dhcp/0002-dhcp-bind-host-gen.patch

-- 
2.6.4
