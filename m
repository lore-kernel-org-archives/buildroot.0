From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Dec 2014 13:19:29 +0100
Subject: [Buildroot] [PATCH 1/3 v2] package: add hashes for
	SourceForge-hosted packages
In-Reply-To: <cover.1419768498.git.yann.morin.1998@free.fr>
References: <cover.1419768498.git.yann.morin.1998@free.fr>
Message-ID: <d23cfbca4078af76c4bbee70ed02006124c5d0c7.1419768498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since SourceForge sometimes serves us faulty tarballs, we can tons of
autobuild failures:
    http://autobuild.buildroot.org/results/9fb/9fba5bf086a4e7a29e5f7156ec43847db7aacfc4/
    http://autobuild.buildroot.org/results/6c8/6c837b244c45ac3b3a887734a371cd6d226cf216/
    ...

Fix that by adding hash files for all SourceForge-hosted packages (thos
etht did not already have it).

We normally prefer to use hashes published by upstream, but hunting them
all one by one is a tedious task, so those hashes were all locally
computed with a script that searched for SF-hosted packages, downloades
the associated tarball, computed the hash, and stored it in the
corresponding .hash file.

Also, SF publishes sha1 hashes, while I used the stronger sha256, since
sha1 is now considered to be relatively weak.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Richard Braun <rbraun@sceen.net>
Cc: Nathaniel Roach <nroach44@gmail.com>

---
Changes v1 -> v2:
  - update hashes for packages that were updated since v1
---
 package/acpid/acpid.hash                       | 2 ++
 package/aespipe/aespipe.hash                   | 2 ++
 package/armadillo/armadillo.hash               | 2 ++
 package/beecrypt/beecrypt.hash                 | 2 ++
 package/bellagio/bellagio.hash                 | 2 ++
 package/blackbox/blackbox.hash                 | 2 ++
 package/bootutils/bootutils.hash               | 2 ++
 package/ccrypt/ccrypt.hash                     | 2 ++
 package/cegui06/cegui06.hash                   | 2 ++
 package/cppcms/cppcms.hash                     | 2 ++
 package/cramfs/cramfs.hash                     | 2 ++
 package/curlftpfs/curlftpfs.hash               | 2 ++
 package/dbus-cpp/dbus-cpp.hash                 | 2 ++
 package/dtach/dtach.hash                       | 2 ++
 package/duma/duma.hash                         | 2 ++
 package/dvbsnoop/dvbsnoop.hash                 | 2 ++
 package/empty/empty.hash                       | 2 ++
 package/espeak/espeak.hash                     | 2 ++
 package/expat/expat.hash                       | 2 ++
 package/expect/expect.hash                     | 2 ++
 package/ezxml/ezxml.hash                       | 2 ++
 package/fdk-aac/fdk-aac.hash                   | 2 ++
 package/fetchmail/fetchmail.hash               | 2 ++
 package/flex/flex.hash                         | 2 ++
 package/fluxbox/fluxbox.hash                   | 2 ++
 package/fxload/fxload.hash                     | 2 ++
 package/genext2fs/genext2fs.hash               | 2 ++
 package/genromfs/genromfs.hash                 | 2 ++
 package/gnu-efi/gnu-efi.hash                   | 2 ++
 package/gptfdisk/gptfdisk.hash                 | 2 ++
 package/gqview/gqview.hash                     | 2 ++
 package/gtkperf/gtkperf.hash                   | 2 ++
 package/gutenprint/gutenprint.hash             | 2 ++
 package/haserl/haserl.hash                     | 3 +++
 package/hplip/hplip.hash                       | 2 ++
 package/igmpproxy/igmpproxy.hash               | 2 ++
 package/imlib2/imlib2.hash                     | 2 ++
 package/iperf/iperf.hash                       | 2 ++
 package/ipmitool/ipmitool.hash                 | 2 ++
 package/iprutils/iprutils.hash                 | 2 ++
 package/irda-utils/irda-utils.hash             | 2 ++
 package/jamvm/jamvm.hash                       | 2 ++
 package/joe/joe.hash                           | 2 ++
 package/jpeg-turbo/jpeg-turbo.hash             | 2 ++
 package/lame/lame.hash                         | 2 ++
 package/lbreakout2/lbreakout2.hash             | 2 ++
 package/lcdproc/lcdproc.hash                   | 2 ++
 package/lcms2/lcms2.hash                       | 2 ++
 package/lesstif/lesstif.hash                   | 2 ++
 package/libargtable2/libargtable2.hash         | 2 ++
 package/libcdaudio/libcdaudio.hash             | 2 ++
 package/libcgi/libcgi.hash                     | 2 ++
 package/libcgroup/libcgroup.hash               | 2 ++
 package/libcue/libcue.hash                     | 2 ++
 package/libdmtx/libdmtx.hash                   | 2 ++
 package/libdnet/libdnet.hash                   | 2 ++
 package/libexif/libexif.hash                   | 2 ++
 package/libfuse/libfuse.hash                   | 2 ++
 package/libglew/libglew.hash                   | 2 ++
 package/libical/libical.hash                   | 2 ++
 package/libid3tag/libid3tag.hash               | 2 ++
 package/libjson/libjson.hash                   | 2 ++
 package/libmad/libmad.hash                     | 2 ++
 package/libmcrypt/libmcrypt.hash               | 2 ++
 package/libmhash/libmhash.hash                 | 2 ++
 package/libmms/libmms.hash                     | 2 ++
 package/libmodplug/libmodplug.hash             | 2 ++
 package/libmpeg2/libmpeg2.hash                 | 2 ++
 package/liboauth/liboauth.hash                 | 2 ++
 package/libpfm4/libpfm4.hash                   | 2 ++
 package/librsync/librsync.hash                 | 2 ++
 package/libseccomp/libseccomp.hash             | 2 ++
 package/libserial/libserial.hash               | 2 ++
 package/libsysfs/libsysfs.hash                 | 2 ++
 package/libungif/libungif.hash                 | 2 ++
 package/libupnp/libupnp.hash                   | 2 ++
 package/libusb-compat/libusb-compat.hash       | 2 ++
 package/libusb/libusb.hash                     | 2 ++
 package/libvncserver/libvncserver.hash         | 2 ++
 package/linknx/linknx.hash                     | 2 ++
 package/lmbench/lmbench.hash                   | 2 ++
 package/log4cplus/log4cplus.hash               | 2 ++
 package/logsurfer/logsurfer.hash               | 2 ++
 package/ltp-testsuite/ltp-testsuite.hash       | 2 ++
 package/ltris/ltris.hash                       | 2 ++
 package/madplay/madplay.hash                   | 2 ++
 package/mcrypt/mcrypt.hash                     | 2 ++
 package/minidlna/minidlna.hash                 | 2 ++
 package/modplugtools/modplugtools.hash         | 2 ++
 package/msgpack/msgpack.hash                   | 2 ++
 package/msmtp/msmtp.hash                       | 2 ++
 package/mutt/mutt.hash                         | 2 ++
 package/nanocom/nanocom.hash                   | 2 ++
 package/nbd/nbd.hash                           | 2 ++
 package/netcat/netcat.hash                     | 2 ++
 package/nfs-utils/nfs-utils.hash               | 2 ++
 package/ngrep/ngrep.hash                       | 2 ++
 package/ocf-linux/ocf-linux.hash               | 2 ++
 package/odhcploc/odhcploc.hash                 | 2 ++
 package/opencore-amr/opencore-amr.hash         | 2 ++
 package/openocd/openocd.hash                   | 2 ++
 package/oprofile/oprofile.hash                 | 2 ++
 package/p910nd/p910nd.hash                     | 2 ++
 package/pcmanfm/pcmanfm.hash                   | 2 ++
 package/poco/poco.hash                         | 2 ++
 package/prboom/prboom.hash                     | 2 ++
 package/proxychains-ng/proxychains-ng.hash     | 2 ++
 package/psmisc/psmisc.hash                     | 2 ++
 package/ptpd/ptpd.hash                         | 2 ++
 package/ptpd2/ptpd2.hash                       | 2 ++
 package/python-dialog/python-dialog.hash       | 2 ++
 package/python-id3/python-id3.hash             | 2 ++
 package/python-numpy/python-numpy.hash         | 2 ++
 package/python-pyparsing/python-pyparsing.hash | 2 ++
 package/qwt/qwt.hash                           | 2 ++
 package/rpcbind/rpcbind.hash                   | 2 ++
 package/scons/scons.hash                       | 2 ++
 package/ser2net/ser2net.hash                   | 2 ++
 package/sispmctl/sispmctl.hash                 | 2 ++
 package/smartmontools/smartmontools.hash       | 2 ++
 package/sox/sox.hash                           | 2 ++
 package/squashfs/squashfs.hash                 | 2 ++
 package/sshfs/sshfs.hash                       | 2 ++
 package/sshpass/sshpass.hash                   | 2 ++
 package/strace/strace.hash                     | 2 ++
 package/swig/swig.hash                         | 2 ++
 package/synergy/synergy.hash                   | 2 ++
 package/tclap/tclap.hash                       | 2 ++
 package/tcllib/tcllib.hash                     | 2 ++
 package/tinyhttpd/tinyhttpd.hash               | 2 ++
 package/tmux/tmux.hash                         | 2 ++
 package/tn5250/tn5250.hash                     | 2 ++
 package/twolame/twolame.hash                   | 2 ++
 package/upx/upx.hash                           | 2 ++
 package/vde2/vde2.hash                         | 2 ++
 package/vo-aacenc/vo-aacenc.hash               | 2 ++
 package/vtun/vtun.hash                         | 2 ++
 package/wipe/wipe.hash                         | 2 ++
 package/x11vnc/x11vnc.hash                     | 2 ++
 package/xmlstarlet/xmlstarlet.hash             | 2 ++
 package/zd1211-firmware/zd1211-firmware.hash   | 2 ++
 141 files changed, 283 insertions(+)
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

diff --git a/package/acpid/acpid.hash b/package/acpid/acpid.hash
new file mode 100644
index 0000000..b7e4206
--- /dev/null
+++ b/package/acpid/acpid.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  3d11454f4283c8f771d8dbd5eb6b5f2bbd9d94d9f77d68bab89e35d98b67ab31  acpid-2.0.22.tar.xz
diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
new file mode 100644
index 0000000..fa66b97
--- /dev/null
+++ b/package/aespipe/aespipe.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  260190beea911190a839e711f610ec3454a9b13985d35479775b7e26ad4c845e  aespipe-v2.4c.tar.bz2
diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
new file mode 100644
index 0000000..d74d6b0
--- /dev/null
+++ b/package/armadillo/armadillo.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0664caca9a9be410ba467a3f4fd7d4556ccda62a9e061f2935904be2afe22132  armadillo-4.000.4.tar.gz
diff --git a/package/beecrypt/beecrypt.hash b/package/beecrypt/beecrypt.hash
new file mode 100644
index 0000000..e697c26
--- /dev/null
+++ b/package/beecrypt/beecrypt.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  286f1f56080d1a6b1d024003a5fa2158f4ff82cae0c6829d3c476a4b5898c55d  beecrypt-4.2.1.tar.gz
diff --git a/package/bellagio/bellagio.hash b/package/bellagio/bellagio.hash
new file mode 100644
index 0000000..914dd7c
--- /dev/null
+++ b/package/bellagio/bellagio.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c  libomxil-bellagio-0.9.3.tar.gz
diff --git a/package/blackbox/blackbox.hash b/package/blackbox/blackbox.hash
new file mode 100644
index 0000000..5aae1a9
--- /dev/null
+++ b/package/blackbox/blackbox.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  92c2be347253f29b10063d579b4267a21516cb322a41b5e83d770fa6d44afd21  blackbox-0.70.1.tar.bz2
diff --git a/package/bootutils/bootutils.hash b/package/bootutils/bootutils.hash
new file mode 100644
index 0000000..576c324
--- /dev/null
+++ b/package/bootutils/bootutils.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  78549714e7c7fa246a4019c245f4da044aee6cfe48ad6887c4013ac4c749c7b9  bootutils-1.0.0.tar.gz
diff --git a/package/ccrypt/ccrypt.hash b/package/ccrypt/ccrypt.hash
new file mode 100644
index 0000000..a93fcb9
--- /dev/null
+++ b/package/ccrypt/ccrypt.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  87d66da2170facabf6f2fc073586ae2c7320d4689980cfca415c74688e499ba0  ccrypt-1.10.tar.gz
diff --git a/package/cegui06/cegui06.hash b/package/cegui06/cegui06.hash
new file mode 100644
index 0000000..21df3ca
--- /dev/null
+++ b/package/cegui06/cegui06.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  eb77741cd9fcc927a876e8116b98691212e973d2264e2071406423f6ca3e305f  CEGUI-0.6.2b.tar.gz
diff --git a/package/cppcms/cppcms.hash b/package/cppcms/cppcms.hash
new file mode 100644
index 0000000..3b2fa28
--- /dev/null
+++ b/package/cppcms/cppcms.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  7c76befc706f3a5f7435b5757eab56784d762db9dd3654467e02e85000caf700  cppcms-1.0.4.tar.bz2
diff --git a/package/cramfs/cramfs.hash b/package/cramfs/cramfs.hash
new file mode 100644
index 0000000..b8c5f5f
--- /dev/null
+++ b/package/cramfs/cramfs.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368  cramfs-1.1.tar.gz
diff --git a/package/curlftpfs/curlftpfs.hash b/package/curlftpfs/curlftpfs.hash
new file mode 100644
index 0000000..a94fab1
--- /dev/null
+++ b/package/curlftpfs/curlftpfs.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  4eb44739c7078ba0edde177bdd266c4cfb7c621075f47f64c85a06b12b3c6958  curlftpfs-0.9.2.tar.gz
diff --git a/package/dbus-cpp/dbus-cpp.hash b/package/dbus-cpp/dbus-cpp.hash
new file mode 100644
index 0000000..b3fc3ef
--- /dev/null
+++ b/package/dbus-cpp/dbus-cpp.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  bc11ac297b3cb010be904c72789695543ee3fdf3d75cdc8225fd371385af4e61  libdbus-c++-0.9.0.tar.gz
diff --git a/package/dtach/dtach.hash b/package/dtach/dtach.hash
new file mode 100644
index 0000000..c9b7a4c
--- /dev/null
+++ b/package/dtach/dtach.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  16614ebddf8ab2811d3dc0e7f329c7de88929ac6a9632d4cb4aef7fe11b8f2a9  dtach-0.8.tar.gz
diff --git a/package/duma/duma.hash b/package/duma/duma.hash
new file mode 100644
index 0000000..f664d40
--- /dev/null
+++ b/package/duma/duma.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  baaf794854e3093ad1bddadbfb8ad4b220a7117d70359ee216bd59e353734e17  duma_2_5_15.tar.gz
diff --git a/package/dvbsnoop/dvbsnoop.hash b/package/dvbsnoop/dvbsnoop.hash
new file mode 100644
index 0000000..05939f9
--- /dev/null
+++ b/package/dvbsnoop/dvbsnoop.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  7658498b26a5d2a0242e81f0cfafa0e43a2bec56f8674e7ac197dfc310866ec6  dvbsnoop-1.4.50.tar.gz
diff --git a/package/empty/empty.hash b/package/empty/empty.hash
new file mode 100644
index 0000000..9140288
--- /dev/null
+++ b/package/empty/empty.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  05b7cb361ef815774abda325c09c573f8c9039ccbb71eedc743439e4637c314a  empty-0.6.19b.tgz
diff --git a/package/espeak/espeak.hash b/package/espeak/espeak.hash
new file mode 100644
index 0000000..8f4a1ab
--- /dev/null
+++ b/package/espeak/espeak.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659  espeak-1.48.04-source.zip
diff --git a/package/expat/expat.hash b/package/expat/expat.hash
new file mode 100644
index 0000000..30595cd
--- /dev/null
+++ b/package/expat/expat.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86  expat-2.1.0.tar.gz
diff --git a/package/expect/expect.hash b/package/expect/expect.hash
new file mode 100644
index 0000000..09e68e7
--- /dev/null
+++ b/package/expect/expect.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040  expect5.45.tar.gz
diff --git a/package/ezxml/ezxml.hash b/package/ezxml/ezxml.hash
new file mode 100644
index 0000000..44d7bbd
--- /dev/null
+++ b/package/ezxml/ezxml.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a68d52257dcb0ff2ad3d71c8c64311edb8030254bb8b581e229aeaba6231cdf9  ezxml-0.8.6.tar.gz
diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
new file mode 100644
index 0000000..8f83951
--- /dev/null
+++ b/package/fdk-aac/fdk-aac.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a9cb872802cfb7a2aff7a549c114c547d1e518dd60c2f85942229cc20c0d0c8d  fdk-aac-0.1.3.tar.gz
diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
new file mode 100644
index 0000000..c67ee1a
--- /dev/null
+++ b/package/fetchmail/fetchmail.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  79b4c54cdbaf02c1a9a691d9948fcb1a77a1591a813e904283a8b614b757e850  fetchmail-6.3.26.tar.xz
diff --git a/package/flex/flex.hash b/package/flex/flex.hash
new file mode 100644
index 0000000..b91ab57
--- /dev/null
+++ b/package/flex/flex.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  bf693433a3effe6b1f42e44abd787491e4e213984b1859545b92267a86088dd3  flex-2.5.37.tar.gz
diff --git a/package/fluxbox/fluxbox.hash b/package/fluxbox/fluxbox.hash
new file mode 100644
index 0000000..710798d
--- /dev/null
+++ b/package/fluxbox/fluxbox.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  164dd7bf59791d09a1e729a4fcd5e7347a1004ba675629860a5cf1a271c32983  fluxbox-1.3.5.tar.bz2
diff --git a/package/fxload/fxload.hash b/package/fxload/fxload.hash
new file mode 100644
index 0000000..7febbcc
--- /dev/null
+++ b/package/fxload/fxload.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0cc8bfd2a7cbba2f68e0c5767477634922287943c91dd9fcf029fc8b9d577858  fxload-2008_10_13.tar.gz
diff --git a/package/genext2fs/genext2fs.hash b/package/genext2fs/genext2fs.hash
new file mode 100644
index 0000000..46b8af3
--- /dev/null
+++ b/package/genext2fs/genext2fs.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  404dbbfa7a86a6c3de8225c8da254d026b17fd288e05cec4df2cc7e1f4feecfc  genext2fs-1.4.1.tar.gz
diff --git a/package/genromfs/genromfs.hash b/package/genromfs/genromfs.hash
new file mode 100644
index 0000000..477e5d2
--- /dev/null
+++ b/package/genromfs/genromfs.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  30f37fc734572c1dbaa2504585bc23ba6b8fd7df767ae7155995b2ca0ebed960  genromfs-0.5.2.tar.gz
diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
new file mode 100644
index 0000000..ec14922
--- /dev/null
+++ b/package/gnu-efi/gnu-efi.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  3c0d450d5829204ca05dcb3b2aae772e52c379b7c7e09146759c6315606f934e  gnu-efi_3.0u.orig.tar.gz
diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
new file mode 100644
index 0000000..d254263
--- /dev/null
+++ b/package/gptfdisk/gptfdisk.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  4579cd54842459699970e24720dda7fb0aa217027818623089c321bc62a647b2  gptfdisk-0.8.6.tar.gz
diff --git a/package/gqview/gqview.hash b/package/gqview/gqview.hash
new file mode 100644
index 0000000..eb65497
--- /dev/null
+++ b/package/gqview/gqview.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  12fea494e607a69eff31cdca13d306ef1b0b3b7850be0f8b236f267d8f2e9546  gqview-2.1.5.tar.gz
diff --git a/package/gtkperf/gtkperf.hash b/package/gtkperf/gtkperf.hash
new file mode 100644
index 0000000..819851d
--- /dev/null
+++ b/package/gtkperf/gtkperf.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  9704344e732038eecbd007dd996a56293a6b027b5b76f3f036273a3fae1ab27b  gtkperf_0.40.tar.gz
diff --git a/package/gutenprint/gutenprint.hash b/package/gutenprint/gutenprint.hash
new file mode 100644
index 0000000..3cfe0e1
--- /dev/null
+++ b/package/gutenprint/gutenprint.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  4b27e4f06f32d30271df89ecb6089bb11bcf2caec5f60b0909e083095354bca0  gutenprint-5.2.9.tar.bz2
diff --git a/package/haserl/haserl.hash b/package/haserl/haserl.hash
new file mode 100644
index 0000000..3573fa9
--- /dev/null
+++ b/package/haserl/haserl.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  ba261a21539e1f204ba74590d313c501007e546b54aa9ae7210a99eaf3c097be  haserl-0.8.0.tar.gz
+sha256  9a65b14dc721643fc5b85c79117cb6d824bd3683b246744137bb5d978df7621b  haserl-0.9.33.tar.gz
diff --git a/package/hplip/hplip.hash b/package/hplip/hplip.hash
new file mode 100644
index 0000000..fb7d4e7
--- /dev/null
+++ b/package/hplip/hplip.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a8122cd824398ac6374154f86152e24fdf5c0100b5c1d6518e853308362e627d  hplip-3.13.10.tar.gz
diff --git a/package/igmpproxy/igmpproxy.hash b/package/igmpproxy/igmpproxy.hash
new file mode 100644
index 0000000..f7d3b1e
--- /dev/null
+++ b/package/igmpproxy/igmpproxy.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  ee18ff3d8c3ae3a29dccb7e5eedf332337330020168bd95a11cece8d7d7ee6ae  igmpproxy-0.1.tar.gz
diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
new file mode 100644
index 0000000..356a95b
--- /dev/null
+++ b/package/imlib2/imlib2.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  24700d93931838d2149cc2b4b58b9355cc81ec11d297f101a98dbb8d1c5c945a  imlib2-1.4.5.tar.bz2
diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
new file mode 100644
index 0000000..8d93b72
--- /dev/null
+++ b/package/iperf/iperf.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b  iperf-2.0.5.tar.gz
diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
new file mode 100644
index 0000000..04b3542
--- /dev/null
+++ b/package/ipmitool/ipmitool.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  3209c99b996fdea38c462cfd10387d6895fd5261227ab6f79b59f88e21938ce5  ipmitool-1.8.14.tar.bz2
diff --git a/package/iprutils/iprutils.hash b/package/iprutils/iprutils.hash
new file mode 100644
index 0000000..388c300
--- /dev/null
+++ b/package/iprutils/iprutils.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  5c4fca20090b819dc5ab7409798519a3f16e1fce2475ef59f9f18c735b3bd871  iprutils-2.4.5-src.tgz
diff --git a/package/irda-utils/irda-utils.hash b/package/irda-utils/irda-utils.hash
new file mode 100644
index 0000000..6a71c47
--- /dev/null
+++ b/package/irda-utils/irda-utils.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67a9fdc6  irda-utils-0.9.18.tar.gz
diff --git a/package/jamvm/jamvm.hash b/package/jamvm/jamvm.hash
new file mode 100644
index 0000000..f8ef76c
--- /dev/null
+++ b/package/jamvm/jamvm.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  76428e96df0ae9dd964c7a7c74c1e9a837e2f312c39e9a357fa8178f7eff80da  jamvm-2.0.0.tar.gz
diff --git a/package/joe/joe.hash b/package/joe/joe.hash
new file mode 100644
index 0000000..664410d
--- /dev/null
+++ b/package/joe/joe.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  cae456e1ad5a8c1d3c94920a3416c2347277739b260e3494d3bc0f2b9b73106f  joe-3.7.tar.gz
diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
new file mode 100644
index 0000000..0e54704
--- /dev/null
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  c132907417ddc40ed552fe53d6b91d5fecbb14a356a60ddc7ea50d6be9666fb9  libjpeg-turbo-1.3.1.tar.gz
diff --git a/package/lame/lame.hash b/package/lame/lame.hash
new file mode 100644
index 0000000..875b49c
--- /dev/null
+++ b/package/lame/lame.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  24346b4158e4af3bd9f2e194bb23eb473c75fb7377011523353196b19b9a23ff  lame-3.99.5.tar.gz
diff --git a/package/lbreakout2/lbreakout2.hash b/package/lbreakout2/lbreakout2.hash
new file mode 100644
index 0000000..d9638b4
--- /dev/null
+++ b/package/lbreakout2/lbreakout2.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0b90716d52e67c27ff41ab7aa5c09dad4f5f19a78076cc57dd4b4d7ed2c1dbd9  lbreakout2-2.6.4.tar.gz
diff --git a/package/lcdproc/lcdproc.hash b/package/lcdproc/lcdproc.hash
new file mode 100644
index 0000000..ea39a9b
--- /dev/null
+++ b/package/lcdproc/lcdproc.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  843007d377adc856529ed0c7c42c9a7563043f06b1b73add0372bba3a3029804  lcdproc-0.5.7.tar.gz
diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
new file mode 100644
index 0000000..8dcfe4a
--- /dev/null
+++ b/package/lcms2/lcms2.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  6727772b44470a2111dba53b9ce4c952b87e7d1b72a31c5ebdf44ba6eb0aa72b  lcms2-2.5.tar.gz
diff --git a/package/lesstif/lesstif.hash b/package/lesstif/lesstif.hash
new file mode 100644
index 0000000..c2ede8b
--- /dev/null
+++ b/package/lesstif/lesstif.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  eb4aa38858c29a4a3bcf605cfe7d91ca41f4522d78d770f69721e6e3a4ecf7e3  lesstif-0.95.2.tar.bz2
diff --git a/package/libargtable2/libargtable2.hash b/package/libargtable2/libargtable2.hash
new file mode 100644
index 0000000..9addbc5
--- /dev/null
+++ b/package/libargtable2/libargtable2.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  8f77e8a7ced5301af6e22f47302fdbc3b1ff41f2b83c43c77ae5ca041771ddbf  argtable2-13.tar.gz
diff --git a/package/libcdaudio/libcdaudio.hash b/package/libcdaudio/libcdaudio.hash
new file mode 100644
index 0000000..f8e1112
--- /dev/null
+++ b/package/libcdaudio/libcdaudio.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  5fdaf9af5ac4f75c0215d000b82b128fd054a582f81cc4f039a1e7fe69335ebb  libcdaudio-0.99.12p2.tar.gz
diff --git a/package/libcgi/libcgi.hash b/package/libcgi/libcgi.hash
new file mode 100644
index 0000000..6bd7c0c
--- /dev/null
+++ b/package/libcgi/libcgi.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  861df39cc0195d43419c4c3de8dff4f42478db66c9ba0b0c1e994c99400e130c  libcgi-1.0.tar.gz
diff --git a/package/libcgroup/libcgroup.hash b/package/libcgroup/libcgroup.hash
new file mode 100644
index 0000000..c671791
--- /dev/null
+++ b/package/libcgroup/libcgroup.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706f6fb51  libcgroup-0.41.tar.bz2
diff --git a/package/libcue/libcue.hash b/package/libcue/libcue.hash
new file mode 100644
index 0000000..0fa7100
--- /dev/null
+++ b/package/libcue/libcue.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  8b7276ec2a2b3918cbc59a3cc03c68dc0775965cc20e4b88757b852ff369729e  libcue-1.4.0.tar.bz2
diff --git a/package/libdmtx/libdmtx.hash b/package/libdmtx/libdmtx.hash
new file mode 100644
index 0000000..505baf4
--- /dev/null
+++ b/package/libdmtx/libdmtx.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  686bcfb44e50b96345aa53f41e285f2118a2cf87a333b69b74165a2e7ddca492  libdmtx-0.7.4.tar.gz
diff --git a/package/libdnet/libdnet.hash b/package/libdnet/libdnet.hash
new file mode 100644
index 0000000..ee41872
--- /dev/null
+++ b/package/libdnet/libdnet.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0eb78415c8f2564c2f1e8ad36e98473348d9c94852f796a226360c716cc7ca53  libdnet-1.11.tar.gz
diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
new file mode 100644
index 0000000..cf1b4d7
--- /dev/null
+++ b/package/libexif/libexif.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a  libexif-0.6.21.tar.bz2
diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
new file mode 100644
index 0000000..d37c521
--- /dev/null
+++ b/package/libfuse/libfuse.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0beb83eaf2c5e50730fc553406ef124d77bc02c64854631bdfc86bfd6437391c  fuse-2.9.3.tar.gz
diff --git a/package/libglew/libglew.hash b/package/libglew/libglew.hash
new file mode 100644
index 0000000..9ac811c
--- /dev/null
+++ b/package/libglew/libglew.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  99c41320b63f6860869b5fb9af9a1854b15582796c64ee3dfd7096dc0c89f307  glew-1.10.0.tgz
diff --git a/package/libical/libical.hash b/package/libical/libical.hash
new file mode 100644
index 0000000..2382ad7
--- /dev/null
+++ b/package/libical/libical.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  2ae78b0757f0dd13431acf42a9a8d038339fd4767fd5134e650bf60ee0b4dff0  libical-0.48.tar.gz
diff --git a/package/libid3tag/libid3tag.hash b/package/libid3tag/libid3tag.hash
new file mode 100644
index 0000000..fb02882
--- /dev/null
+++ b/package/libid3tag/libid3tag.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151  libid3tag-0.15.1b.tar.gz
diff --git a/package/libjson/libjson.hash b/package/libjson/libjson.hash
new file mode 100644
index 0000000..f3447ee
--- /dev/null
+++ b/package/libjson/libjson.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  07267a3951038ee2e02d26cc41bf8e275668c38f751240d3e78dc979182e7376  libjson_7.6.1.zip
diff --git a/package/libmad/libmad.hash b/package/libmad/libmad.hash
new file mode 100644
index 0000000..1e55556
--- /dev/null
+++ b/package/libmad/libmad.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690  libmad-0.15.1b.tar.gz
diff --git a/package/libmcrypt/libmcrypt.hash b/package/libmcrypt/libmcrypt.hash
new file mode 100644
index 0000000..d0d3a9c
--- /dev/null
+++ b/package/libmcrypt/libmcrypt.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d27a373e  libmcrypt-2.5.8.tar.gz
diff --git a/package/libmhash/libmhash.hash b/package/libmhash/libmhash.hash
new file mode 100644
index 0000000..5ae5686
--- /dev/null
+++ b/package/libmhash/libmhash.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  56521c52a9033779154432d0ae47ad7198914785265e1f570cee21ab248dfef0  mhash-0.9.9.9.tar.bz2
diff --git a/package/libmms/libmms.hash b/package/libmms/libmms.hash
new file mode 100644
index 0000000..69865f7
--- /dev/null
+++ b/package/libmms/libmms.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  01931b62172d7d7050fc9ef9b1b64162f3b6e9f6cc4415170192a32a0b7ea432  libmms-0.6.2.tar.gz
diff --git a/package/libmodplug/libmodplug.hash b/package/libmodplug/libmodplug.hash
new file mode 100644
index 0000000..0077e26
--- /dev/null
+++ b/package/libmodplug/libmodplug.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  77462d12ee99476c8645cb5511363e3906b88b33a6b54362b4dbc0f39aa2daad  libmodplug-0.8.8.5.tar.gz
diff --git a/package/libmpeg2/libmpeg2.hash b/package/libmpeg2/libmpeg2.hash
new file mode 100644
index 0000000..c2adb67
--- /dev/null
+++ b/package/libmpeg2/libmpeg2.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  dee22e893cb5fc2b2b6ebd60b88478ab8556cb3b93f9a0d7ce8f3b61851871d4  libmpeg2-0.5.1.tar.gz
diff --git a/package/liboauth/liboauth.hash b/package/liboauth/liboauth.hash
new file mode 100644
index 0000000..6806a08
--- /dev/null
+++ b/package/liboauth/liboauth.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0df60157b052f0e774ade8a8bac59d6e8d4b464058cc55f9208d72e41156811f  liboauth-1.0.3.tar.gz
diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
new file mode 100644
index 0000000..bc0ce52
--- /dev/null
+++ b/package/libpfm4/libpfm4.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a23eb9affbff279e13563a39317c0ad71c4de28908d4243c8bc109138430cc3b  libpfm-4.3.0.tar.gz
diff --git a/package/librsync/librsync.hash b/package/librsync/librsync.hash
new file mode 100644
index 0000000..55ace76
--- /dev/null
+++ b/package/librsync/librsync.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  6633e4605662763a03bb6388529cbdfd3b11a9ec55b8845351c1bd9a92bc41d6  librsync-0.9.7.tar.gz
diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
new file mode 100644
index 0000000..f87633e
--- /dev/null
+++ b/package/libseccomp/libseccomp.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  8812c11e407c383f5ad6afb84a88e5a0224477bcfe8ff03f0c548e5abaac841c  libseccomp-2.1.1.tar.gz
diff --git a/package/libserial/libserial.hash b/package/libserial/libserial.hash
new file mode 100644
index 0000000..26f65e5
--- /dev/null
+++ b/package/libserial/libserial.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  60d8aebf5f262c12baf94ce61d61198fc9b79da2432c735c200decd08ead1fb4  libserial-0.6.0rc1.tar.gz
diff --git a/package/libsysfs/libsysfs.hash b/package/libsysfs/libsysfs.hash
new file mode 100644
index 0000000..c419ed9
--- /dev/null
+++ b/package/libsysfs/libsysfs.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb97ccad1ec28d208a  sysfsutils-2.1.0.tar.gz
diff --git a/package/libungif/libungif.hash b/package/libungif/libungif.hash
new file mode 100644
index 0000000..979b045
--- /dev/null
+++ b/package/libungif/libungif.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  708a7eac218d3fd8e8dfb13f1089d4e1e98246985180a17d6ecfca5a6bd4d332  libungif-4.1.4.tar.bz2
diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
new file mode 100644
index 0000000..59f7d7b
--- /dev/null
+++ b/package/libupnp/libupnp.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  b3142b39601243b50532eec90f4a27dba85eb86f58d4b849ac94edeb29d9b22a  libupnp-1.6.19.tar.bz2
diff --git a/package/libusb-compat/libusb-compat.hash b/package/libusb-compat/libusb-compat.hash
new file mode 100644
index 0000000..c01eee5
--- /dev/null
+++ b/package/libusb-compat/libusb-compat.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a  libusb-compat-0.1.5.tar.bz2
diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
new file mode 100644
index 0000000..1752738
--- /dev/null
+++ b/package/libusb/libusb.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  6c502c816002f90d4f76050a6429c3a7e0d84204222cbff2dce95dd773ba6840  libusb-1.0.19.tar.bz2
diff --git a/package/libvncserver/libvncserver.hash b/package/libvncserver/libvncserver.hash
new file mode 100644
index 0000000..23d5fb0
--- /dev/null
+++ b/package/libvncserver/libvncserver.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  ed10819a5bfbf269969f97f075939cc38273cc1b6d28bccfb0999fba489411f7  LibVNCServer-0.9.10.tar.gz
diff --git a/package/linknx/linknx.hash b/package/linknx/linknx.hash
new file mode 100644
index 0000000..d1be6d2
--- /dev/null
+++ b/package/linknx/linknx.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  f161d3c8da3b8c6969e9c02d84d3cd26eb5e7fb4f3a3efbaaede8acdaaf11700  linknx-0.0.1.32.tar.gz
diff --git a/package/lmbench/lmbench.hash b/package/lmbench/lmbench.hash
new file mode 100644
index 0000000..b7aaa6a
--- /dev/null
+++ b/package/lmbench/lmbench.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551  lmbench-3.0-a9.tgz
diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
new file mode 100644
index 0000000..395e9fe
--- /dev/null
+++ b/package/log4cplus/log4cplus.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  999427580cded403b4edc8a85088621f27493c489f08b9f564fb5fe76c16a883  log4cplus-1.1.2.tar.xz
diff --git a/package/logsurfer/logsurfer.hash b/package/logsurfer/logsurfer.hash
new file mode 100644
index 0000000..2c14078
--- /dev/null
+++ b/package/logsurfer/logsurfer.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  74a36e8530a884031b4ae2344a46b9aaa07a1ee36d143802f6b64f817c5bd1af  logsurfer-1.8.tar.gz
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
new file mode 100644
index 0000000..77ec483
--- /dev/null
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  c21b91407f94a0c55c4cd3f12a0dc30f1d17cd2d4c44598f81ca075843141496  ltp-full-20140115.tar.xz
diff --git a/package/ltris/ltris.hash b/package/ltris/ltris.hash
new file mode 100644
index 0000000..5c0fcde
--- /dev/null
+++ b/package/ltris/ltris.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  8f6a9e7719d22004aee153db29ffd9ca41c7a6cd87fc791591994eecc2e625a1  ltris-1.0.19.tar.gz
diff --git a/package/madplay/madplay.hash b/package/madplay/madplay.hash
new file mode 100644
index 0000000..99487b5
--- /dev/null
+++ b/package/madplay/madplay.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  5a79c7516ff7560dffc6a14399a389432bc619c905b13d3b73da22fa65acede0  madplay-0.15.2b.tar.gz
diff --git a/package/mcrypt/mcrypt.hash b/package/mcrypt/mcrypt.hash
new file mode 100644
index 0000000..cf29eaa
--- /dev/null
+++ b/package/mcrypt/mcrypt.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  5145aa844e54cca89ddab6fb7dd9e5952811d8d787c4f4bf27eb261e6c182098  mcrypt-2.6.8.tar.gz
diff --git a/package/minidlna/minidlna.hash b/package/minidlna/minidlna.hash
new file mode 100644
index 0000000..797679a
--- /dev/null
+++ b/package/minidlna/minidlna.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  9814c04a2c506a0dd942c4218d30c07dedf90dabffbdef2d308a3f9f23545314  minidlna-1.1.4.tar.gz
diff --git a/package/modplugtools/modplugtools.hash b/package/modplugtools/modplugtools.hash
new file mode 100644
index 0000000..e29eda9
--- /dev/null
+++ b/package/modplugtools/modplugtools.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0122d44ea0513b928cf9d463acc886d08a2664579aa96ddeeb270d5c81193a4e  modplugtools-0.5.3.tar.gz
diff --git a/package/msgpack/msgpack.hash b/package/msgpack/msgpack.hash
new file mode 100644
index 0000000..8cd8cb6
--- /dev/null
+++ b/package/msgpack/msgpack.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  97a371ef950c89f48e8dba6abeccab07f1887e9ba6dab921de0f985c7d5075fe  msgpack-0.5.4.tar.gz
diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
new file mode 100644
index 0000000..41c6caa
--- /dev/null
+++ b/package/msmtp/msmtp.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  2bf0c5c7e78f9905f48de235a75111a1a88238793043bbeae00360b22f1a5f88  msmtp-1.4.32.tar.bz2
diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
new file mode 100644
index 0000000..397f3da
--- /dev/null
+++ b/package/mutt/mutt.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  3af0701e57b9e1880ed3a0dee34498a228939e854a16cdccd24e5e502626fd37  mutt-1.5.23.tar.gz
diff --git a/package/nanocom/nanocom.hash b/package/nanocom/nanocom.hash
new file mode 100644
index 0000000..7e7016c
--- /dev/null
+++ b/package/nanocom/nanocom.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  5cb26e3e232cfc4a7cb16da432db532b775c5ebdb887ac9d39df5632f2c9a5e5  nanocom.tar.gz
diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
new file mode 100644
index 0000000..1136050
--- /dev/null
+++ b/package/nbd/nbd.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  48a223770eb136603dc266587d9a37ed5024132e09e2c8484096d4c46cfed3e2  nbd-3.8.tar.xz
diff --git a/package/netcat/netcat.hash b/package/netcat/netcat.hash
new file mode 100644
index 0000000..e20c4c2
--- /dev/null
+++ b/package/netcat/netcat.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  30719c9a4ffbcf15676b8f528233ccc54ee6cba96cb4590975f5fd60c68a066f  netcat-0.7.1.tar.gz
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
new file mode 100644
index 0000000..e36c9d0
--- /dev/null
+++ b/package/nfs-utils/nfs-utils.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  70267288500408495085b7c54a667c4e8cfde5882f3193da095fc7dad2da0b83  nfs-utils-1.2.6.tar.bz2
diff --git a/package/ngrep/ngrep.hash b/package/ngrep/ngrep.hash
new file mode 100644
index 0000000..e0a6a25
--- /dev/null
+++ b/package/ngrep/ngrep.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  aea6dd337da8781847c75b3b5b876e4de9c58520e0d77310679a979fc6402fa7  ngrep-1.45.tar.bz2
diff --git a/package/ocf-linux/ocf-linux.hash b/package/ocf-linux/ocf-linux.hash
new file mode 100644
index 0000000..0bd0ea1
--- /dev/null
+++ b/package/ocf-linux/ocf-linux.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  5113609d2c2c43fde962bec1238fe5a81211a751ebb0337b54a9804d40cfef53  ocf-linux-20120127.tar.gz
diff --git a/package/odhcploc/odhcploc.hash b/package/odhcploc/odhcploc.hash
new file mode 100644
index 0000000..201339f
--- /dev/null
+++ b/package/odhcploc/odhcploc.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  b0360a3aece8a29d131531da7bfc36d57c30c6eed30ff1ea360f7cccea1d62d7  odhcploc-20111021.tar.gz
diff --git a/package/opencore-amr/opencore-amr.hash b/package/opencore-amr/opencore-amr.hash
new file mode 100644
index 0000000..a984514
--- /dev/null
+++ b/package/opencore-amr/opencore-amr.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  106bf811c1f36444d7671d8fd2589f8b2e0cca58a2c764da62ffc4a070595385  opencore-amr-0.1.3.tar.gz
diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
new file mode 100644
index 0000000..11f79a6
--- /dev/null
+++ b/package/openocd/openocd.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0bc122f98a6cd68c4392f6265d480b0e875ff54203ec05a5a52d23900903a78d  openocd-0.5.0.tar.bz2
diff --git a/package/oprofile/oprofile.hash b/package/oprofile/oprofile.hash
new file mode 100644
index 0000000..b6ab3ba
--- /dev/null
+++ b/package/oprofile/oprofile.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  847110b4ecdcf8c8353cd38f94c1b704aad4bfcd9453e38b88d112cfb7e3c45a  oprofile-1.0.0.tar.gz
diff --git a/package/p910nd/p910nd.hash b/package/p910nd/p910nd.hash
new file mode 100644
index 0000000..1b952c8
--- /dev/null
+++ b/package/p910nd/p910nd.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  4ac980a3ae24babae6f70f0a692625ece03a4a92c357fbb10d2e368386c3c26f  p910nd-0.97.tar.bz2
diff --git a/package/pcmanfm/pcmanfm.hash b/package/pcmanfm/pcmanfm.hash
new file mode 100644
index 0000000..7191658
--- /dev/null
+++ b/package/pcmanfm/pcmanfm.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  15d1a06b500f8ea42d158e41072e175c4ee9765c2bd856e83aa9963e56330e93  pcmanfm-0.3.5.9.tar.gz
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
new file mode 100644
index 0000000..957293d
--- /dev/null
+++ b/package/poco/poco.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  6791c35e790b055ae9c55abe0bccc453e9616f0183d85a1eeea69ad084e994fe  poco-1.4.6p1-all.tar.gz
diff --git a/package/prboom/prboom.hash b/package/prboom/prboom.hash
new file mode 100644
index 0000000..0d80349
--- /dev/null
+++ b/package/prboom/prboom.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  226c1c470f8cc983327536404f405a1d026cf0a5188c694a1243cc8630014bae  prboom-2.5.0.tar.gz
diff --git a/package/proxychains-ng/proxychains-ng.hash b/package/proxychains-ng/proxychains-ng.hash
new file mode 100644
index 0000000..e2e8c01
--- /dev/null
+++ b/package/proxychains-ng/proxychains-ng.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  859a717e18ed88c9291078a6ed8748dfe95c61220993203890fef8a04d28dda5  proxychains-4.6.tar.bz2
diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
new file mode 100644
index 0000000..fd99edf
--- /dev/null
+++ b/package/psmisc/psmisc.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a  psmisc-22.21.tar.gz
diff --git a/package/ptpd/ptpd.hash b/package/ptpd/ptpd.hash
new file mode 100644
index 0000000..ccd1d84
--- /dev/null
+++ b/package/ptpd/ptpd.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a7c6ea83bd53da75ae04a7b7a25fe7c597b4e9ff1f93d46f4502e3fa8a2cb950  ptpd-1.1.0.tar.gz
diff --git a/package/ptpd2/ptpd2.hash b/package/ptpd2/ptpd2.hash
new file mode 100644
index 0000000..2570c00
--- /dev/null
+++ b/package/ptpd2/ptpd2.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  1a4e90496f004bfd91657ccc49209101dc25b787e540648c07c0973469f1d8f7  ptpd-2.3.0.tar.gz
diff --git a/package/python-dialog/python-dialog.hash b/package/python-dialog/python-dialog.hash
new file mode 100644
index 0000000..3cf0eaa
--- /dev/null
+++ b/package/python-dialog/python-dialog.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  58466c2f897ef761716b811ff74e035979b5ecefb529ba004b12db117a0f4581  python2-pythondialog-3.0.1.tar.bz2
diff --git a/package/python-id3/python-id3.hash b/package/python-id3/python-id3.hash
new file mode 100644
index 0000000..28b58e8
--- /dev/null
+++ b/package/python-id3/python-id3.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  ba612342b59a49cbf9a7eb23a646667757ffda96dc23b67245fc6cd8d90c2022  id3-py_1.2.tar.gz
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
new file mode 100644
index 0000000..39b134b
--- /dev/null
+++ b/package/python-numpy/python-numpy.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  2764d0819acc77e9ff81b060fe7f69530b0d85c26ac9d162639b787cb227d253  numpy-1.8.0.tar.gz
diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
new file mode 100644
index 0000000..aee93af
--- /dev/null
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  17e43d6b17588ed5968735575b3983a952133ec4082596d214d7090b56d48a06  pyparsing-2.0.2.tar.gz
diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
new file mode 100644
index 0000000..dfc9c31
--- /dev/null
+++ b/package/qwt/qwt.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a7e3d9f1db917d186a973c5f04a316bc9607c7c35794d7a16de323aba5e17402  qwt-6.1.0.tar.bz2
diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
new file mode 100644
index 0000000..830ef55
--- /dev/null
+++ b/package/rpcbind/rpcbind.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  da169ff877a5a07581fad50a9a808ac6e96f0c277a3df49a7ef005778428496e  rpcbind-0.2.1.tar.bz2
diff --git a/package/scons/scons.hash b/package/scons/scons.hash
new file mode 100644
index 0000000..1b47d64
--- /dev/null
+++ b/package/scons/scons.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  9442069999cf4b2caa94a5886ab4c2c71de1718ed5e9176c18e2b6dbca463b4b  scons-2.3.0.tar.gz
diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
new file mode 100644
index 0000000..4675164
--- /dev/null
+++ b/package/ser2net/ser2net.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  98f6193225338e25f35302fef5e1f16688693ed43e7b3c3e9e09187eb54547ac  ser2net-2.10.0.tar.gz
diff --git a/package/sispmctl/sispmctl.hash b/package/sispmctl/sispmctl.hash
new file mode 100644
index 0000000..9f34b43
--- /dev/null
+++ b/package/sispmctl/sispmctl.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e9a99cc81ef0a93f3484e5093efd14d93cc967221fcd22c151f0bea32eb91da7  sispmctl-3.1.tar.gz
diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
new file mode 100644
index 0000000..5a80691
--- /dev/null
+++ b/package/smartmontools/smartmontools.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a777065d1a5965d71b3672e054b09b7696200ec73aaf45ab636f34016538fe19  smartmontools-6.3.tar.gz
diff --git a/package/sox/sox.hash b/package/sox/sox.hash
new file mode 100644
index 0000000..85b1aec
--- /dev/null
+++ b/package/sox/sox.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  9a8c2c6fe51e608da346a157e111508a957af9e3ecf3de26781d36e9a67fa89b  sox-14.4.1.tar.gz
diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
new file mode 100644
index 0000000..e308089
--- /dev/null
+++ b/package/squashfs/squashfs.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0d605512437b1eb800b4736791559295ee5f60177e102e4d4ccd0ee241a5f3f6  squashfs4.3.tar.gz
diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
new file mode 100644
index 0000000..c8b0c00
--- /dev/null
+++ b/package/sshfs/sshfs.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e9171452e5d0150b9c6a2158fd2e2dcefb5d5d03ba4d208949e00a3a46c6e63e  sshfs-fuse-2.5.tar.gz
diff --git a/package/sshpass/sshpass.hash b/package/sshpass/sshpass.hash
new file mode 100644
index 0000000..12871e1
--- /dev/null
+++ b/package/sshpass/sshpass.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  c3f78752a68a0c3f62efb3332cceea0c8a1f04f7cf6b46e00ec0c3000bc8483e  sshpass-1.05.tar.gz
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
new file mode 100644
index 0000000..c68eeda
--- /dev/null
+++ b/package/strace/strace.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  095bfea5c540b91d297ccac73b21b92fd54a24599fd70395db87ff9eb7fd6f65  strace-4.9.tar.xz
diff --git a/package/swig/swig.hash b/package/swig/swig.hash
new file mode 100644
index 0000000..98baaa2
--- /dev/null
+++ b/package/swig/swig.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  65e13f22a60cecd7279c59882ff8ebe1ffe34078e85c602821a541817a4317f7  swig-2.0.12.tar.gz
diff --git a/package/synergy/synergy.hash b/package/synergy/synergy.hash
new file mode 100644
index 0000000..2a6950e
--- /dev/null
+++ b/package/synergy/synergy.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  4a15e26456498dda5f3aa7d688a4892e0c50394a2f01685136fbc954bacc9691  synergy-1.3.1.tar.gz
diff --git a/package/tclap/tclap.hash b/package/tclap/tclap.hash
new file mode 100644
index 0000000..55d475f
--- /dev/null
+++ b/package/tclap/tclap.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  9f9f0fe3719e8a89d79b6ca30cf2d16620fba3db5b9610f9b51dd2cd033deebb  tclap-1.2.1.tar.gz
diff --git a/package/tcllib/tcllib.hash b/package/tcllib/tcllib.hash
new file mode 100644
index 0000000..eb990a2
--- /dev/null
+++ b/package/tcllib/tcllib.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  0db9e17d6c0f44d3ca2df2ea5023e35c0f3767e7008c3cb26d201446eb68add1  tcllib-1.13.tar.bz2
diff --git a/package/tinyhttpd/tinyhttpd.hash b/package/tinyhttpd/tinyhttpd.hash
new file mode 100644
index 0000000..73255d5
--- /dev/null
+++ b/package/tinyhttpd/tinyhttpd.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  56609b82869c80ba71b2a2af166a0bcaffe21e7412f4594e04b9a5abf733435a  tinyhttpd-0.1.0.tar.gz
diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
new file mode 100644
index 0000000..eb9f4fd
--- /dev/null
+++ b/package/tmux/tmux.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  c5e3b22b901cf109b20dab54a4a651f0471abd1f79f6039d79b250d21c2733f5  tmux-1.9a.tar.gz
diff --git a/package/tn5250/tn5250.hash b/package/tn5250/tn5250.hash
new file mode 100644
index 0000000..ae65bea
--- /dev/null
+++ b/package/tn5250/tn5250.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  354237d400dc46af887cb3ffa4ed1f2c371f5b8bee8be046a683a4ac9db4f9c5  tn5250-0.17.4.tar.gz
diff --git a/package/twolame/twolame.hash b/package/twolame/twolame.hash
new file mode 100644
index 0000000..647655b
--- /dev/null
+++ b/package/twolame/twolame.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  98f332f48951f47f23f70fd0379463aff7d7fb26f07e1e24e42ddef22cc6112a  twolame-0.3.13.tar.gz
diff --git a/package/upx/upx.hash b/package/upx/upx.hash
new file mode 100644
index 0000000..bfcf932
--- /dev/null
+++ b/package/upx/upx.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  527ce757429841f51675352b1f9f6fc8ad97b18002080d7bf8672c466d8c6a3c  upx-3.91-src.tar.bz2
diff --git a/package/vde2/vde2.hash b/package/vde2/vde2.hash
new file mode 100644
index 0000000..a56a1bb
--- /dev/null
+++ b/package/vde2/vde2.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  cbea9b7e03097f87a6b5e98b07890d2275848f1fe4b9fcda77b8994148bc9542  vde2-2.3.2.tar.bz2
diff --git a/package/vo-aacenc/vo-aacenc.hash b/package/vo-aacenc/vo-aacenc.hash
new file mode 100644
index 0000000..822f842
--- /dev/null
+++ b/package/vo-aacenc/vo-aacenc.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e51a7477a359f18df7c4f82d195dab4e14e7414cbd48cf79cc195fc446850f36  vo-aacenc-0.1.3.tar.gz
diff --git a/package/vtun/vtun.hash b/package/vtun/vtun.hash
new file mode 100644
index 0000000..baa6381
--- /dev/null
+++ b/package/vtun/vtun.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  69dcbe4f8c5ce7d91b4150a6309e536d03b61841169746ca5788413ac7edb9cb  vtun-3.0.3.tar.gz
diff --git a/package/wipe/wipe.hash b/package/wipe/wipe.hash
new file mode 100644
index 0000000..9bde201
--- /dev/null
+++ b/package/wipe/wipe.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  463916370f9b35bb34419c2c0ae3dc4c0a471db32e8595afa1d14c0337b61aa0  wipe-2.3.1.tar.bz2
diff --git a/package/x11vnc/x11vnc.hash b/package/x11vnc/x11vnc.hash
new file mode 100644
index 0000000..5828b12
--- /dev/null
+++ b/package/x11vnc/x11vnc.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b  x11vnc-0.9.13.tar.gz
diff --git a/package/xmlstarlet/xmlstarlet.hash b/package/xmlstarlet/xmlstarlet.hash
new file mode 100644
index 0000000..2d6558f
--- /dev/null
+++ b/package/xmlstarlet/xmlstarlet.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  47b4ed042ea2909257f2a386001af49fceb303f84da7214779ccf99fffc6bbba  xmlstarlet-1.5.0.tar.gz
diff --git a/package/zd1211-firmware/zd1211-firmware.hash b/package/zd1211-firmware/zd1211-firmware.hash
new file mode 100644
index 0000000..d26858b
--- /dev/null
+++ b/package/zd1211-firmware/zd1211-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  866308f6f59f7075f075d4959dff2ede47735c751251fecd1496df1ba4d338e1  zd1211-firmware-1.4.tar.bz2
-- 
1.9.1
