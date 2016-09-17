From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 17 Sep 2016 13:58:36 +0200
Subject: [Buildroot] [RFC: PATCH 0/3] DHCP configuration via networkd
Message-ID: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small series removes the current limitation of not allowing the user to
have a network interface configured automatically via DHCP when
systemd-networkd is used.

To do so, the systemd package is updated to generate a .network file for the
configured interface.

Also add an option to enable or disable predictable network interface names
when udev is used. It is disabled by default, so the end user gets the same
interface names across busybox/systemd configurations.

Eric Le Bihan (3):
  systemd: configure DHCP via networkd
  system: allow auto net configuration with networkd
  system: enable predictable net interface names

 package/skeleton/skeleton.mk | 11 +++++++++++
 package/systemd/systemd.mk   | 13 +++++++++++++
 system/Config.in             | 20 ++++++++++++++------
 3 files changed, 38 insertions(+), 6 deletions(-)

-- 
2.4.11
