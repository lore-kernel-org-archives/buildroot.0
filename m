From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 27 Sep 2013 09:12:59 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the default value of
 the $(PKG)_SOURCE variable
In-Reply-To: <1380100067-11743-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1380100067-11743-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <CAAXf6LV8r9aOwRAWE1r_HmeXVbKyFuOPppnzsmqC1uaqgn2eAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 25, 2013 at 11:07 AM, Jerzy Grzegorek
<jerzy.grzegorek@trzebnica.net> wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/aircrack-ng/aircrack-ng.mk                 |    1 -
>  package/avahi/avahi.mk                             |    1 -
>  package/axel/axel.mk                               |    1 -
>  package/bmon/bmon.mk                               |    1 -
>  package/bridge-utils/bridge-utils.mk               |    1 -
>  package/bsdiff/bsdiff.mk                           |    1 -
>  package/cramfs/cramfs.mk                           |    1 -
>  package/ctorrent/ctorrent.mk                       |    1 -
>  package/dbus-glib/dbus-glib.mk                     |    1 -
>  package/dbus-python/dbus-python.mk                 |    1 -
>  package/dfu-util/dfu-util.mk                       |    1 -
>  package/dhcpdump/dhcpdump.mk                       |    1 -
>  package/docker/docker.mk                           |    1 -
>  package/dsp-tools/dsp-tools.mk                     |    1 -
>  package/elftosb/elftosb.mk                         |    1 -
>  package/enchant/enchant.mk                         |    1 -
>  package/ezxml/ezxml.mk                             |    1 -
>  package/fbdump/fbdump.mk                           |    1 -
>  package/fbgrab/fbgrab.mk                           |    1 -
>  package/fbset/fbset.mk                             |    1 -
>  package/fbv/fbv.mk                                 |    1 -
>  package/fconfig/fconfig.mk                         |    1 -
>  package/flac/flac.mk                               |    1 -
>  package/fontconfig/fontconfig.mk                   |    1 -
>  package/gamin/gamin.mk                             |    1 -
>  package/genext2fs/genext2fs.mk                     |    1 -
>  package/genromfs/genromfs.mk                       |    1 -
>  package/giblib/giblib.mk                           |    1 -
>  package/gnuchess/gnuchess.mk                       |    1 -
>  package/gqview/gqview.mk                           |    1 -
>  package/gsl/gsl.mk                                 |    1 -
>  package/gstreamer/gst-omapfb/gst-omapfb.mk         |    1 -
>  package/intltool/intltool.mk                       |    1 -
>  package/iperf/iperf.mk                             |    1 -
>  package/ipkg/ipkg.mk                               |    1 -
>  package/irda-utils/irda-utils.mk                   |    1 -
>  package/lcdproc/lcdproc.mk                         |    1 -
>  package/leafpad/leafpad.mk                         |    1 -
>  package/libarchive/libarchive.mk                   |    1 -
>  package/libatomic_ops/libatomic_ops.mk             |    1 -
>  package/libbsd/libbsd.mk                           |    1 -
>  package/libdmtx/libdmtx.mk                         |    1 -
>  package/libdnet/libdnet.mk                         |    1 -
>  package/libelf/libelf.mk                           |    1 -
>  package/libev/libev.mk                             |    1 -
>  package/libftdi/libftdi.mk                         |    1 -
>  package/libgeotiff/libgeotiff.mk                   |    1 -
>  package/libhid/libhid.mk                           |    1 -
>  package/libiconv/libiconv.mk                       |    1 -
>  package/libid3tag/libid3tag.mk                     |    1 -
>  package/libiscsi/libiscsi.mk                       |    1 -
>  package/liblo/liblo.mk                             |    1 -
>  package/libmms/libmms.mk                           |    1 -
>  package/libmpeg2/libmpeg2.mk                       |    1 -
>  package/liboauth/liboauth.mk                       |    1 -
>  package/librsvg/librsvg.mk                         |    1 -
>  package/librsync/librsync.mk                       |    1 -
>  package/libseccomp/libseccomp.mk                   |    1 -
>  package/libsexy/libsexy.mk                         |    1 -
>  package/linux-fusion/linux-fusion.mk               |    1 -
>  package/logrotate/logrotate.mk                     |    1 -
>  package/logsurfer/logsurfer.mk                     |    1 -
>  package/lrzsz/lrzsz.mk                             |    1 -
>  package/lsuio/lsuio.mk                             |    1 -
>  package/lzop/lzop.mk                               |    1 -
>  package/madplay/madplay.mk                         |    1 -
>  package/memtester/memtester.mk                     |    1 -
>  package/minicom/minicom.mk                         |    1 -
>  package/netcat/netcat.mk                           |    1 -
>  package/numactl/numactl.mk                         |    1 -
>  package/opkg/opkg.mk                               |    1 -
>  package/pcmanfm/pcmanfm.mk                         |    1 -
>  package/pkg-config/pkg-config.mk                   |    1 -
>  package/protobuf/protobuf.mk                       |    1 -
>  package/quota/quota.mk                             |    1 -
>  package/rdesktop/rdesktop.mk                       |    1 -
>  package/readline/readline.mk                       |    1 -
>  package/rsync/rsync.mk                             |    1 -
>  package/sane-backends/sane-backends.mk             |    1 -
>  package/scons/scons.mk                             |    1 -
>  .../startup-notification/startup-notification.mk   |    1 -
>  package/statserial/statserial.mk                   |    1 -
>  package/supervisor/supervisor.mk                   |    1 -
>  package/synergy/synergy.mk                         |    1 -
>  package/tidsp-binaries/tidsp-binaries.mk           |    1 -
>  package/torsmo/torsmo.mk                           |    1 -
>  package/udpcast/udpcast.mk                         |    1 -
>  package/vtun/vtun.mk                               |    1 -
>  package/x11vnc/x11vnc.mk                           |    1 -
>  package/xinetd/xinetd.mk                           |    1 -
>  package/xstroke/xstroke.mk                         |    1 -
>  package/xvkbd/xvkbd.mk                             |    1 -
>  package/yasm/yasm.mk                               |    1 -
>  93 files changed, 93 deletions(-)
>

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com)
(manual review + comparing 'make printvars' before and after)
