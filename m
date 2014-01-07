From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  7 Jan 2014 11:29:18 +0100
Subject: [Buildroot] [PATCH 0/3] network-manager: fix DHCP support.
Message-ID: <1389090561-32196-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series fixes DHCP support for NetworkManager.

The DHCP client used by NetworkManager can be configured in the "[main]"
section of /etc/NetworkManager/NetworkManager.conf either as:

  dhcp=dhclient

or

  dhcp=dhcpcd

The support for either client is enabled by the './configure' script. When
network-manager was built, the instance of the client installed on the
development machine was detected and its location used. Most of the time,
this resulted in dhclient being the only choice...

This patch series:

- installs dhcpcd in the proper directory.
- configures network-manager according to the DHCP client package selected.
- bumps network-manager to its latest version.

Best regards,
ELB

Eric Le Bihan (3):
  dhcpcd: install dhcpcd as /usr/sbin/dhcpcd.
  network-manager: fix DHCP clients detection.
  network-manager: bump to version 0.9.8.2

 package/dhcpcd/dhcpcd.mk                   |    2 +-
 package/network-manager/network-manager.mk |   10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

--
1.7.9.5
