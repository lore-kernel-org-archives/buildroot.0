From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:21 +0100
Subject: [Buildroot] [PATCH 00/15] packages: Add SELinux modules to some
 packages
Message-ID: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

Following the recent support for the SELinux refpolicy and the ability for
packages to select their own SELinux module in the refpolicy [1], this series
adds a first batch of matching between packages and their respective module.

This series focuses on the tools that are impacted by the following
modules in the refpolicy [2] :

  - services/networkmanager, which adds support for :
    - dhcp
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
    - iputils
    - mtr
    - nmap
    - tcpdump

  - services/entropyd, which adds support for :
    - haveged
    - jitterentropy-library

With this series, the above-mentionned tools can now be used on systems
that have SELinux enabled.

This series was split per-package, which generates lots of one-liner
patches. Due to the nature of the changes, I expect more patches like
that to follow, so we might also use a "one package per module" approach
if you want.

Thanks,

Maxime

[1] : 0228f521d6 package/refpolicy: allow packages to select SELinux modules
[2] : https://github.com/SELinuxProject/refpolicy

Maxime Chevallier (15):
  packages/dhcp: add SELinux module
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

 package/dhcp/dhcp.mk                                   | 1 +
 package/ebtables/ebtables.mk                           | 1 +
 package/fping/fping.mk                                 | 1 +
 package/haveged/haveged.mk                             | 1 +
 package/ipset/ipset.mk                                 | 1 +
 package/iptables/iptables.mk                           | 2 ++
 package/iputils/iputils.mk                             | 1 +
 package/iwd/iwd.mk                                     | 1 +
 package/jitterentropy-library/jitterentropy-library.mk | 1 +
 package/mtr/mtr.mk                                     | 1 +
 package/network-manager/network-manager.mk             | 1 +
 package/nftables/nftables.mk                           | 1 +
 package/nmap/nmap.mk                                   | 1 +
 package/tcpdump/tcpdump.mk                             | 1 +
 package/wpa_supplicant/wpa_supplicant.mk               | 1 +
 15 files changed, 16 insertions(+)

-- 
2.25.4
