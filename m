From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:32 +0100
Subject: [Buildroot] [PATCH 00/51] Misc trivial improvements
Message-ID: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series does miscellaneous improvements to packages, mainly:

 * Convert the remaining init script installation logic to
   <pkg>_INSTALL_INIT_SYSV.

 * Do not install or remove man pages in packages, since we don't care
   about documentation in the target.

 * Fixup a number of "for" loops to properly bail out if one iteration
   of the loop fails instead of silently ignoring the error. Not all
   for loops have been inspected yet, so it's only a partial work.

 * Misc other small stuff.

This series is obviously material for the next branch.

Thanks,

Thomas

Thomas Petazzoni (51):
  vsftpd: use <pkg>_INSTALL_INIT_SYSV and rename init script
  vsftpd: don't install manpages
  vsftpd: rename patches to the new naming convention
  radvd: use <pkg>_INSTALL_INIT_SYSV
  thttpd: use the <pkg>_INSTALL_INIT_SYSV mechanism
  busybox: use <pkg>_INSTALL_INIT_SYSV mechanism
  portmap: use <pkg>_INSTALL_INIT_SYSV mechanism
  portmap: don't install manpages
  portmap: improve installation of binaries
  stunnel: use the <pkg>_INSTALL_INIT_SYSV mechanism
  gdk-pixbuf: use <pkg>_INSTALL_INIT_SYSV mechanism
  proftpd: use <pkg>_INSTALL_INIT_SYSV mechanism
  samba: use <pkg>_INSTALL_INIT_SYSV mechanism
  input-event-daemon: use <pkg>_INSTALL_INIT_SYSV mechanism
  ifplugd: use <pkg>_INSTALL_INIT_SYSV mechanism
  nfs-utils: use <pkg>_INSTALL_INIT_SYSV mechanism
  netatalk: use <pkg>_INSTALL_INIT_SYSV mechanism
  mongoose: use <pkg>_INSTALL_INIT_SYSV mechanism
  gpsd: use <pkg>_INSTALL_INIT_SYSV mechanism
  olsr: use <pkg>_INSTALL_INIT_SYSV mechanism
  pango: use <pkg>_INSTALL_INIT_SYSV mechanism
  xapp_xdm: use <pkg>_INSTALL_INIT_SYSV mechanism
  tftpd: use <pkg>_INSTALL_INIT_SYSV mechanism
  openvpn: use <pkg>_INSTALL_INIT_SYSV mechanism
  tinyhttpd: use <pkg>_INSTALL_INIT_SYSV mechanism
  at: use <pkg>_INSTALL_INIT_SYSV mechanism
  mpd: use <pkg>_INSTALL_INIT_SYSV mechanism
  snowball-init: use <pkg>_INSTALL_INIT_SYSV mechanism
  wipe: don't install man pages
  ndisc6: remove man page related code
  tree: don't install man page
  iostat: don't install man page
  iostat: remove legacy code
  pptp-linux: don't install man page
  gnupg: don't both removing a man page
  rp-pppoe: don't install man pages
  rp-pppoe: bail out of installation fails
  alsa-utils: add error handling to for loop
  coreutils: add error handling to for loop
  ebtables: add error handling to for loop
  flot: add error handling to for loop
  googlefontdirectory: add error handling to for loop
  gptfdisk: add error handling to for loop
  irda-utils: add error handling to for loop
  jimtcl: add error handling to for loop
  live555: add error handling to for loop
  lockfile-progs: add error handling to for loop
  qt5base: add error handling to for loop
  qtuio: add error handling to for loop
  sound-theme-borealis: add error handling to for loop
  xenomai: add error handling to for loop

 package/alsa-utils/alsa-utils.mk                          |  2 +-
 package/at/at.mk                                          |  4 +---
 package/busybox/busybox.mk                                |  5 ++++-
 package/coreutils/coreutils.mk                            |  2 +-
 package/ebtables/ebtables.mk                              |  2 +-
 package/flot/flot.mk                                      |  2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                          |  4 +---
 package/gnupg/gnupg.mk                                    |  3 +--
 package/googlefontdirectory/googlefontdirectory.mk        |  2 +-
 package/gpsd/gpsd.mk                                      |  3 +++
 package/gptfdisk/gptfdisk.mk                              |  2 +-
 package/ifplugd/ifplugd.mk                                |  7 +++++--
 package/input-event-daemon/input-event-daemon.mk          |  3 +++
 package/iostat/iostat.mk                                  |  4 ----
 package/irda-utils/irda-utils.mk                          |  2 +-
 package/jimtcl/jimtcl.mk                                  |  2 +-
 package/live555/live555.mk                                |  8 ++++----
 package/lockfile-progs/lockfile-progs.mk                  |  2 +-
 package/mongoose/mongoose.mk                              |  3 +++
 package/mpd/mpd.mk                                        |  7 +++++--
 package/ndisc6/ndisc6.mk                                  |  7 +------
 package/netatalk/netatalk.mk                              |  4 +---
 package/nfs-utils/nfs-utils.mk                            |  9 ++++++---
 package/olsr/olsr.mk                                      |  5 ++++-
 package/openvpn/openvpn.mk                                |  3 +++
 package/pango/pango.mk                                    |  4 +---
 package/portmap/portmap.mk                                | 14 +++++---------
 package/pptp-linux/pptp-linux.mk                          |  1 -
 package/proftpd/proftpd.mk                                |  5 ++++-
 package/qt5/qt5base/qt5base.mk                            |  2 +-
 package/qtuio/qtuio.mk                                    |  6 +++---
 package/radvd/radvd.mk                                    |  6 ++----
 package/rp-pppoe/rp-pppoe.mk                              |  5 +----
 package/samba/samba.mk                                    | 15 +++++++++------
 package/snowball-init/snowball-init.mk                    |  2 +-
 package/sound-theme-borealis/sound-theme-borealis.mk      |  2 +-
 package/stunnel/stunnel.mk                                |  9 ++++++---
 package/tftpd/tftpd.mk                                    |  5 ++++-
 package/thttpd/thttpd.mk                                  |  7 +++++--
 package/tinyhttpd/tinyhttpd.mk                            |  5 ++++-
 package/tree/tree.mk                                      |  2 --
 ...001-utmpx-builddef.patch => 0001-utmpx-builddef.patch} |  0
 ...ce-largefile.patch => 0002-dont-force-largefile.patch} |  0
 package/vsftpd/{vsftpd-init => S70vsftpd}                 |  0
 package/vsftpd/vsftpd.mk                                  | 11 ++++-------
 package/wipe/wipe.mk                                      |  1 -
 package/x11r7/xapp_xdm/xapp_xdm.mk                        |  4 +---
 package/xenomai/xenomai.mk                                |  2 +-
 48 files changed, 107 insertions(+), 98 deletions(-)
 rename package/vsftpd/{vsftpd-0001-utmpx-builddef.patch => 0001-utmpx-builddef.patch} (100%)
 rename package/vsftpd/{vsftpd-dont-force-largefile.patch => 0002-dont-force-largefile.patch} (100%)
 rename package/vsftpd/{vsftpd-init => S70vsftpd} (100%)

-- 
2.1.0
