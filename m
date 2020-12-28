From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Mon, 28 Dec 2020 17:11:20 +0100
Subject: [Buildroot] [PATCH v2 00/14] packages: Add SELinux modules to some
 packages
Message-ID: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

This is the second iteration of the series adding matching between
packages and the SELinux refpolicy module that supports them.

This series focuses on the tools that are impacted by the following
modules in the refpolicy [2] :

  - services/networkmanager, which adds support for :
    - iwd
    - network-manager
    - wpa_supplicant

  - system/ipatbles, which adds support for :
    - ebtables
    - ipset
    - iptables
    - nftables

  - admin/netutils, which adds support for :
    - fping
    - Some of the iputils tools :
      - arping
      - ping
      - tracepath
      - traceroute6
    - mtr
    - nmap
    - tcpdump

  - services/entropyd, which adds support for :
    - haveged
    - jitterentropy-library

With this series, the above-mentionned tools can now be used on systems
that have SELinux enabled.

Since V1, the main changes were the removal of the dhcp package which
will be part of another series, and the rework of the iputils package
according to Antoine Tenart's review.

Thanks,

Maxime

Maxime Chevallier (14):
  package/iwd: add SELinux module
  package/network-manager: add SELinux module
  package/wpa_supplicant: add SELinux module
  package/ebtables: add SELinux module
  package/ipset: add SELinux module
  package/iptables: add SELinux module
  package/nftables: add SELinux module
  package/fping: add SELinux module
  package/iputils: add SELinux module
  package/mtr: add SELinux module
  package/nmap: add SELinux module
  package/tcpdump: add SELinux module
  package/haveged: add SELinux module
  package/jitterentropy-library: add SELinux module

 package/ebtables/ebtables.mk                     |  1 +
 package/fping/fping.mk                           |  1 +
 package/haveged/haveged.mk                       |  1 +
 package/ipset/ipset.mk                           |  1 +
 package/iptables/iptables.mk                     |  2 ++
 package/iputils/iputils.mk                       | 16 ++++++++++++++++
 package/iwd/iwd.mk                               |  1 +
 .../jitterentropy-library.mk                     |  1 +
 package/mtr/mtr.mk                               |  1 +
 package/network-manager/network-manager.mk       |  1 +
 package/nftables/nftables.mk                     |  1 +
 package/nmap/nmap.mk                             |  1 +
 package/tcpdump/tcpdump.mk                       |  1 +
 package/wpa_supplicant/wpa_supplicant.mk         |  1 +
 14 files changed, 30 insertions(+)

-- 
2.25.4
