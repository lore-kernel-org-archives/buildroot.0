From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Dec 2014 13:19:27 +0100
Subject: [Buildroot] [PATCH 0/3 v2] Add a lot of hashes (branch yem/sf-hash)
Message-ID: <cover.1419768498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces hashes for all SourceForge-hosted packages and
for all external toolchains (some on SourceForge, too)

Note that I consider this very important, since we do have a *lot* of
autobuild failures due to borked tarballs, so adding hashes will help
eventually fix all those failures.

Also, toolchains are very sensible pieces, so we want to ensure they
are genuine (this is not about trusting trust, however! ;-) ).


Changes v1 -> v2:
  - update hashes for thos packages that were updated since v1
  - add Blackfin toochain hashes  (Thomas)
  - add hashes for all other external toolchains


Regards,
Yann E. MORIN.


The following changes since commit f8973107464a8e17a21487a64fdf42a2d941e79c:

  binutils: default to 2.24 (2014-12-28 12:24:46 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/sf-hash

for you to fetch changes up to f924e745902fb357ec83221b28fb8a0f9a38a311:

  toolchain: add hashes for all remaining external toolchains (2014-12-28 13:06:10 +0100)

----------------------------------------------------------------
Thomas Petazzoni (1):
      toolchain-external: add hashes for Blackfin toolchains

Yann E. MORIN (2):
      package: add hashes for SourceForge-hosted packages
      toolchain: add hashes for all remaining external toolchains

 package/acpid/acpid.hash                           |  2 +
 package/aespipe/aespipe.hash                       |  2 +
 package/armadillo/armadillo.hash                   |  2 +
 package/beecrypt/beecrypt.hash                     |  2 +
 package/bellagio/bellagio.hash                     |  2 +
 package/blackbox/blackbox.hash                     |  2 +
 package/bootutils/bootutils.hash                   |  2 +
 package/ccrypt/ccrypt.hash                         |  2 +
 package/cegui06/cegui06.hash                       |  2 +
 package/cppcms/cppcms.hash                         |  2 +
 package/cramfs/cramfs.hash                         |  2 +
 package/curlftpfs/curlftpfs.hash                   |  2 +
 package/dbus-cpp/dbus-cpp.hash                     |  2 +
 package/dtach/dtach.hash                           |  2 +
 package/duma/duma.hash                             |  2 +
 package/dvbsnoop/dvbsnoop.hash                     |  2 +
 package/empty/empty.hash                           |  2 +
 package/espeak/espeak.hash                         |  2 +
 package/expat/expat.hash                           |  2 +
 package/expect/expect.hash                         |  2 +
 package/ezxml/ezxml.hash                           |  2 +
 package/fdk-aac/fdk-aac.hash                       |  2 +
 package/fetchmail/fetchmail.hash                   |  2 +
 package/flex/flex.hash                             |  2 +
 package/fluxbox/fluxbox.hash                       |  2 +
 package/fxload/fxload.hash                         |  2 +
 package/genext2fs/genext2fs.hash                   |  2 +
 package/genromfs/genromfs.hash                     |  2 +
 package/gnu-efi/gnu-efi.hash                       |  2 +
 package/gptfdisk/gptfdisk.hash                     |  2 +
 package/gqview/gqview.hash                         |  2 +
 package/gtkperf/gtkperf.hash                       |  2 +
 package/gutenprint/gutenprint.hash                 |  2 +
 package/haserl/haserl.hash                         |  3 ++
 package/hplip/hplip.hash                           |  2 +
 package/igmpproxy/igmpproxy.hash                   |  2 +
 package/imlib2/imlib2.hash                         |  2 +
 package/iperf/iperf.hash                           |  2 +
 package/ipmitool/ipmitool.hash                     |  2 +
 package/iprutils/iprutils.hash                     |  2 +
 package/irda-utils/irda-utils.hash                 |  2 +
 package/jamvm/jamvm.hash                           |  2 +
 package/joe/joe.hash                               |  2 +
 package/jpeg-turbo/jpeg-turbo.hash                 |  2 +
 package/lame/lame.hash                             |  2 +
 package/lbreakout2/lbreakout2.hash                 |  2 +
 package/lcdproc/lcdproc.hash                       |  2 +
 package/lcms2/lcms2.hash                           |  2 +
 package/lesstif/lesstif.hash                       |  2 +
 package/libargtable2/libargtable2.hash             |  2 +
 package/libcdaudio/libcdaudio.hash                 |  2 +
 package/libcgi/libcgi.hash                         |  2 +
 package/libcgroup/libcgroup.hash                   |  2 +
 package/libcue/libcue.hash                         |  2 +
 package/libdmtx/libdmtx.hash                       |  2 +
 package/libdnet/libdnet.hash                       |  2 +
 package/libexif/libexif.hash                       |  2 +
 package/libfuse/libfuse.hash                       |  2 +
 package/libglew/libglew.hash                       |  2 +
 package/libical/libical.hash                       |  2 +
 package/libid3tag/libid3tag.hash                   |  2 +
 package/libjson/libjson.hash                       |  2 +
 package/libmad/libmad.hash                         |  2 +
 package/libmcrypt/libmcrypt.hash                   |  2 +
 package/libmhash/libmhash.hash                     |  2 +
 package/libmms/libmms.hash                         |  2 +
 package/libmodplug/libmodplug.hash                 |  2 +
 package/libmpeg2/libmpeg2.hash                     |  2 +
 package/liboauth/liboauth.hash                     |  2 +
 package/libpfm4/libpfm4.hash                       |  2 +
 package/librsync/librsync.hash                     |  2 +
 package/libseccomp/libseccomp.hash                 |  2 +
 package/libserial/libserial.hash                   |  2 +
 package/libsysfs/libsysfs.hash                     |  2 +
 package/libungif/libungif.hash                     |  2 +
 package/libupnp/libupnp.hash                       |  2 +
 package/libusb-compat/libusb-compat.hash           |  2 +
 package/libusb/libusb.hash                         |  2 +
 package/libvncserver/libvncserver.hash             |  2 +
 package/linknx/linknx.hash                         |  2 +
 package/lmbench/lmbench.hash                       |  2 +
 package/log4cplus/log4cplus.hash                   |  2 +
 package/logsurfer/logsurfer.hash                   |  2 +
 package/ltp-testsuite/ltp-testsuite.hash           |  2 +
 package/ltris/ltris.hash                           |  2 +
 package/madplay/madplay.hash                       |  2 +
 package/mcrypt/mcrypt.hash                         |  2 +
 package/minidlna/minidlna.hash                     |  2 +
 package/modplugtools/modplugtools.hash             |  2 +
 package/msgpack/msgpack.hash                       |  2 +
 package/msmtp/msmtp.hash                           |  2 +
 package/mutt/mutt.hash                             |  2 +
 package/nanocom/nanocom.hash                       |  2 +
 package/nbd/nbd.hash                               |  2 +
 package/netcat/netcat.hash                         |  2 +
 package/nfs-utils/nfs-utils.hash                   |  2 +
 package/ngrep/ngrep.hash                           |  2 +
 package/ocf-linux/ocf-linux.hash                   |  2 +
 package/odhcploc/odhcploc.hash                     |  2 +
 package/opencore-amr/opencore-amr.hash             |  2 +
 package/openocd/openocd.hash                       |  2 +
 package/oprofile/oprofile.hash                     |  2 +
 package/p910nd/p910nd.hash                         |  2 +
 package/pcmanfm/pcmanfm.hash                       |  2 +
 package/poco/poco.hash                             |  2 +
 package/prboom/prboom.hash                         |  2 +
 package/proxychains-ng/proxychains-ng.hash         |  2 +
 package/psmisc/psmisc.hash                         |  2 +
 package/ptpd/ptpd.hash                             |  2 +
 package/ptpd2/ptpd2.hash                           |  2 +
 package/python-dialog/python-dialog.hash           |  2 +
 package/python-id3/python-id3.hash                 |  2 +
 package/python-numpy/python-numpy.hash             |  2 +
 package/python-pyparsing/python-pyparsing.hash     |  2 +
 package/qwt/qwt.hash                               |  2 +
 package/rpcbind/rpcbind.hash                       |  2 +
 package/scons/scons.hash                           |  2 +
 package/ser2net/ser2net.hash                       |  2 +
 package/sispmctl/sispmctl.hash                     |  2 +
 package/smartmontools/smartmontools.hash           |  2 +
 package/sox/sox.hash                               |  2 +
 package/squashfs/squashfs.hash                     |  2 +
 package/sshfs/sshfs.hash                           |  2 +
 package/sshpass/sshpass.hash                       |  2 +
 package/strace/strace.hash                         |  2 +
 package/swig/swig.hash                             |  2 +
 package/synergy/synergy.hash                       |  2 +
 package/tclap/tclap.hash                           |  2 +
 package/tcllib/tcllib.hash                         |  2 +
 package/tinyhttpd/tinyhttpd.hash                   |  2 +
 package/tmux/tmux.hash                             |  2 +
 package/tn5250/tn5250.hash                         |  2 +
 package/twolame/twolame.hash                       |  2 +
 package/upx/upx.hash                               |  2 +
 package/vde2/vde2.hash                             |  2 +
 package/vo-aacenc/vo-aacenc.hash                   |  2 +
 package/vtun/vtun.hash                             |  2 +
 package/wipe/wipe.hash                             |  2 +
 package/x11vnc/x11vnc.hash                         |  2 +
 package/xmlstarlet/xmlstarlet.hash                 |  2 +
 package/zd1211-firmware/zd1211-firmware.hash       |  2 +
 .../toolchain-external/toolchain-external.hash     | 51 ++++++++++++++++++++++
 142 files changed, 334 insertions(+)
 create mode 100644 package/acpid/acpid.hash
 create mode 100644 package/aespipe/aespipe.hash
 create mode 100644 package/armadillo/armadillo.hash
 create mode 100644 package/beecrypt/beecrypt.hash
 create mode 100644 package/bellagio/bellagio.hash
 create mode 100644 package/blackbox/blackbox.hash
 create mode 100644 package/bootutils/bootutils.hash
 create mode 100644 package/ccrypt/ccrypt.hash
 create mode 100644 package/cegui06/cegui06.hash
 create mode 100644 package/cppcms/cppcms.hash
 create mode 100644 package/cramfs/cramfs.hash
 create mode 100644 package/curlftpfs/curlftpfs.hash
 create mode 100644 package/dbus-cpp/dbus-cpp.hash
 create mode 100644 package/dtach/dtach.hash
 create mode 100644 package/duma/duma.hash
 create mode 100644 package/dvbsnoop/dvbsnoop.hash
 create mode 100644 package/empty/empty.hash
 create mode 100644 package/espeak/espeak.hash
 create mode 100644 package/expat/expat.hash
 create mode 100644 package/expect/expect.hash
 create mode 100644 package/ezxml/ezxml.hash
 create mode 100644 package/fdk-aac/fdk-aac.hash
 create mode 100644 package/fetchmail/fetchmail.hash
 create mode 100644 package/flex/flex.hash
 create mode 100644 package/fluxbox/fluxbox.hash
 create mode 100644 package/fxload/fxload.hash
 create mode 100644 package/genext2fs/genext2fs.hash
 create mode 100644 package/genromfs/genromfs.hash
 create mode 100644 package/gnu-efi/gnu-efi.hash
 create mode 100644 package/gptfdisk/gptfdisk.hash
 create mode 100644 package/gqview/gqview.hash
 create mode 100644 package/gtkperf/gtkperf.hash
 create mode 100644 package/gutenprint/gutenprint.hash
 create mode 100644 package/haserl/haserl.hash
 create mode 100644 package/hplip/hplip.hash
 create mode 100644 package/igmpproxy/igmpproxy.hash
 create mode 100644 package/imlib2/imlib2.hash
 create mode 100644 package/iperf/iperf.hash
 create mode 100644 package/ipmitool/ipmitool.hash
 create mode 100644 package/iprutils/iprutils.hash
 create mode 100644 package/irda-utils/irda-utils.hash
 create mode 100644 package/jamvm/jamvm.hash
 create mode 100644 package/joe/joe.hash
 create mode 100644 package/jpeg-turbo/jpeg-turbo.hash
 create mode 100644 package/lame/lame.hash
 create mode 100644 package/lbreakout2/lbreakout2.hash
 create mode 100644 package/lcdproc/lcdproc.hash
 create mode 100644 package/lcms2/lcms2.hash
 create mode 100644 package/lesstif/lesstif.hash
 create mode 100644 package/libargtable2/libargtable2.hash
 create mode 100644 package/libcdaudio/libcdaudio.hash
 create mode 100644 package/libcgi/libcgi.hash
 create mode 100644 package/libcgroup/libcgroup.hash
 create mode 100644 package/libcue/libcue.hash
 create mode 100644 package/libdmtx/libdmtx.hash
 create mode 100644 package/libdnet/libdnet.hash
 create mode 100644 package/libexif/libexif.hash
 create mode 100644 package/libfuse/libfuse.hash
 create mode 100644 package/libglew/libglew.hash
 create mode 100644 package/libical/libical.hash
 create mode 100644 package/libid3tag/libid3tag.hash
 create mode 100644 package/libjson/libjson.hash
 create mode 100644 package/libmad/libmad.hash
 create mode 100644 package/libmcrypt/libmcrypt.hash
 create mode 100644 package/libmhash/libmhash.hash
 create mode 100644 package/libmms/libmms.hash
 create mode 100644 package/libmodplug/libmodplug.hash
 create mode 100644 package/libmpeg2/libmpeg2.hash
 create mode 100644 package/liboauth/liboauth.hash
 create mode 100644 package/libpfm4/libpfm4.hash
 create mode 100644 package/librsync/librsync.hash
 create mode 100644 package/libseccomp/libseccomp.hash
 create mode 100644 package/libserial/libserial.hash
 create mode 100644 package/libsysfs/libsysfs.hash
 create mode 100644 package/libungif/libungif.hash
 create mode 100644 package/libupnp/libupnp.hash
 create mode 100644 package/libusb-compat/libusb-compat.hash
 create mode 100644 package/libusb/libusb.hash
 create mode 100644 package/libvncserver/libvncserver.hash
 create mode 100644 package/linknx/linknx.hash
 create mode 100644 package/lmbench/lmbench.hash
 create mode 100644 package/log4cplus/log4cplus.hash
 create mode 100644 package/logsurfer/logsurfer.hash
 create mode 100644 package/ltp-testsuite/ltp-testsuite.hash
 create mode 100644 package/ltris/ltris.hash
 create mode 100644 package/madplay/madplay.hash
 create mode 100644 package/mcrypt/mcrypt.hash
 create mode 100644 package/minidlna/minidlna.hash
 create mode 100644 package/modplugtools/modplugtools.hash
 create mode 100644 package/msgpack/msgpack.hash
 create mode 100644 package/msmtp/msmtp.hash
 create mode 100644 package/mutt/mutt.hash
 create mode 100644 package/nanocom/nanocom.hash
 create mode 100644 package/nbd/nbd.hash
 create mode 100644 package/netcat/netcat.hash
 create mode 100644 package/nfs-utils/nfs-utils.hash
 create mode 100644 package/ngrep/ngrep.hash
 create mode 100644 package/ocf-linux/ocf-linux.hash
 create mode 100644 package/odhcploc/odhcploc.hash
 create mode 100644 package/opencore-amr/opencore-amr.hash
 create mode 100644 package/openocd/openocd.hash
 create mode 100644 package/oprofile/oprofile.hash
 create mode 100644 package/p910nd/p910nd.hash
 create mode 100644 package/pcmanfm/pcmanfm.hash
 create mode 100644 package/poco/poco.hash
 create mode 100644 package/prboom/prboom.hash
 create mode 100644 package/proxychains-ng/proxychains-ng.hash
 create mode 100644 package/psmisc/psmisc.hash
 create mode 100644 package/ptpd/ptpd.hash
 create mode 100644 package/ptpd2/ptpd2.hash
 create mode 100644 package/python-dialog/python-dialog.hash
 create mode 100644 package/python-id3/python-id3.hash
 create mode 100644 package/python-numpy/python-numpy.hash
 create mode 100644 package/python-pyparsing/python-pyparsing.hash
 create mode 100644 package/qwt/qwt.hash
 create mode 100644 package/rpcbind/rpcbind.hash
 create mode 100644 package/scons/scons.hash
 create mode 100644 package/ser2net/ser2net.hash
 create mode 100644 package/sispmctl/sispmctl.hash
 create mode 100644 package/smartmontools/smartmontools.hash
 create mode 100644 package/sox/sox.hash
 create mode 100644 package/squashfs/squashfs.hash
 create mode 100644 package/sshfs/sshfs.hash
 create mode 100644 package/sshpass/sshpass.hash
 create mode 100644 package/strace/strace.hash
 create mode 100644 package/swig/swig.hash
 create mode 100644 package/synergy/synergy.hash
 create mode 100644 package/tclap/tclap.hash
 create mode 100644 package/tcllib/tcllib.hash
 create mode 100644 package/tinyhttpd/tinyhttpd.hash
 create mode 100644 package/tmux/tmux.hash
 create mode 100644 package/tn5250/tn5250.hash
 create mode 100644 package/twolame/twolame.hash
 create mode 100644 package/upx/upx.hash
 create mode 100644 package/vde2/vde2.hash
 create mode 100644 package/vo-aacenc/vo-aacenc.hash
 create mode 100644 package/vtun/vtun.hash
 create mode 100644 package/wipe/wipe.hash
 create mode 100644 package/x11vnc/x11vnc.hash
 create mode 100644 package/xmlstarlet/xmlstarlet.hash
 create mode 100644 package/zd1211-firmware/zd1211-firmware.hash

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
