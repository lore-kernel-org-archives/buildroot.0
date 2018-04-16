From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:18 -0300
Subject: [Buildroot] [PATCH 00/26] init scripts: don't test if binaries exist
Message-ID: <20180416022944.13644-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed in the mailing list, it is useless to test if a binary file
exists and/or is executable. Buildroot installs both the executable files and
their init scripts as part of the same packages. But if it ever happens for
some reason, the error message from start-stop-daemon or from the shell should
be pretty clear.

If a variable containing the file name existed (e.g. DAEMON) and was used only
once it was replaced by the full path of the binary file. Unused variables
resulting from these simplifications were removed too.

Carlos Santos (26):
  bind: don't test if the binary exists in the init script
  dbus: don't test if the binary exists in the init script
  dhcpcd: don't test if the binary exists in the init script
  dmraid: don't test if the binary exists in the init script
  dnsmasq: don't test if the binary exists in the init script
  eudev: don't test if the binary exists in the init script
  haveged: don't test if the binary exists in the init script
  modem-manager: don't test if the binary exists in the init script
  mpd: don't test if the binary exists in the init script
  neard: don't test if the binary exists in the init script
  netplug: don't test if the binary exists in the init script
  netsnmp: don't test if the binaries exist in the init script
  network-manager: don't test if the binary exists in the init script
  nfs-utils: don't test if the binary exists in the init script
  ntp: don't test if the binary exists in the init script
  openntpd: don't test if the binary exists in the init script
  openvpn: don't test if the binary exists in the init script
  proftpd: don't test if the binary exists in the init script
  prosody: don't test if the binary exists in the init script
  squid: don't test if the binary exists in the init script
  tinyhttpd: don't test if the binary exists in the init script
  tpm2-abrmd: don't test if the binary exists in the init script
  transmission: don't test if the binary exists in the init script
  triggerhappy: don't test if the binary exists in the init script
  tvheadend: don't test if the binary exists in the init script
  upmpdcli: don't test if the binary exists in the init script

 package/bind/S81named                      |  1 -
 package/dbus/S30dbus                       |  3 ---
 package/dhcpcd/S41dhcpcd                   |  1 -
 package/dmraid/S20dmraid                   |  2 --
 package/dnsmasq/S80dnsmasq                 |  1 -
 package/eudev/S10udev                      |  6 +-----
 package/haveged/S21haveged                 |  2 --
 package/modem-manager/S44modem-manager     |  2 --
 package/mpd/S95mpd                         |  1 -
 package/neard/S53neard                     |  6 +-----
 package/netplug/S29netplug                 |  2 --
 package/netsnmp/S59snmpd                   |  3 ---
 package/network-manager/S45network-manager | 10 +---------
 package/nfs-utils/S60nfs                   |  5 -----
 package/ntp/S49ntp                         |  6 +-----
 package/openntpd/S49ntp                    |  1 -
 package/openvpn/S60openvpn                 |  6 +-----
 package/proftpd/S50proftpd                 |  4 +---
 package/prosody/S50prosody                 |  6 +-----
 package/squid/S97squid                     |  1 -
 package/tinyhttpd/S85tinyhttpd             |  1 -
 package/tpm2-abrmd/S80tpm2-abrmd           |  8 ++------
 package/transmission/S92transmission       |  3 ---
 package/triggerhappy/S10triggerhappy       |  6 +-----
 package/tvheadend/S99tvheadend             |  5 +----
 package/upmpdcli/S99upmpdcli               |  6 +-----
 26 files changed, 12 insertions(+), 86 deletions(-)

-- 
2.14.3
