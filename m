From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jan 2013 23:17:15 +0100
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <50E9BE9A.4030703@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
 <50E6E757.10809@zacarias.com.ar> <50E6EDB5.9070004@petroprogram.com>
 <20130106054113.GD13545@sapphire.tkos.co.il>
 <50E9BE9A.4030703@petroprogram.com>
Message-ID: <50EB496B.60301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/01/13 19:12, Stefan Fr?berg wrote:
> Hi Baruch
>
> 6.1.2013 7:41, Baruch Siach kirjoitti:
>> Hi Stefan,
>>
>> On Fri, Jan 04, 2013 at 04:56:53PM +0200, Stefan Fr?berg wrote:
>>> Hello Gustavo, all
>> [...]
>>
>>> (It took a long time for me to figure why wireshark that im trying to
>>> compile here did not
>>> work out with libpcap, untill I found out that the
>>> $(STAGING_DIR)/usr/bin/pcap-config spit a
>>> wrong prefix all the time...)
>> Good to see work on wireshark. Did you fix the RPATH problem I encountered
>> while trying to build tshark
>> (http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/48053) ?
>>
>> baruch
>>
> This is the problem Im having right now:
>
> make[2]: Siirryt??n hakemistoon
> "/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.4"
> /usr/bin/perl ./make-version.pl .
> Version configuration file version.conf not found.  Using defaults.
> svnversion.h unchanged.
> /bin/sh ./libtool  --tag=CC   --mode=link
> /mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
> -DPYTHON_DIR= -pipe -funit-at-a-time -Wno-error -Os -Os
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall
> -W -Wextra -Wdeclaration-after-statement -Wendif-labels -Wpointer-arith
> -Wno-pointer-sign -Warray-bounds -Wcast-align -Wformat-security
> -Wold-style-definition -Wno-error=unused-but-set-variable
> -fexcess-precision=fast -pthread -D_REENTRANT
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gtk-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/gtk-2.0/include
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/atk-1.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/cairo
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gdk-pixbuf-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pango-1.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/glib-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/glib-2.0/include
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pixman-1
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/freetype2
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/directfb
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/libpng14
> -Wl,-static -all-static -Wl,-S -Wl,-O1 -Wl,--as-needed -Wl,-z
> -Wl,combreloc -Wl,--enable-new-dtags -Wl,--hash-style=gnu
> -Wl,--as-needed -o wireshark wireshark-capture-pcap-util-unix.o
> wireshark-capture-pcap-util.o wireshark-cfile.o
> wireshark-clopts_common.o wireshark-disabled_protos.o
> wireshark-frame_data_sequence.o wireshark-packet-range.o
> wireshark-print.o wireshark-ps.o wireshark-sync_pipe_write.o
> wireshark-timestats.o wireshark-tap-megaco-common.o
> wireshark-tap-rtp-common.o wireshark-version_info.o
> wireshark-capture_ifinfo.o wireshark-capture_sync.o
> wireshark-capture_ui_utils.o wireshark-airpcap_loader.o
> wireshark-capture.o wireshark-capture_info.o wireshark-capture_opts.o
> wireshark-color_filters.o wireshark-file.o wireshark-fileset.o
> wireshark-filters.o wireshark-g711.o wireshark-merge.o
> wireshark-proto_hier_stats.o wireshark-recent.o wireshark-summary.o
> wireshark-tempfile.o wireshark-u3.o ui/gtk/libgtkui.a
> ui/gtk/libgtkui_dirty.a ui/libui.a codecs/libcodec.a
> wiretap/libwiretap.la epan/libwireshark.la wsutil/libwsutil.la -lcrypto
> -dlopen plugins/asn1/asn1.la -dlopen plugins/docsis/docsis.la -dlopen
> plugins/ethercat/ethercat.la -dlopen plugins/gryphon/gryphon.la -dlopen
> plugins/irda/irda.la -dlopen plugins/m2m/m2m.la -dlopen
> plugins/mate/mate.la -dlopen plugins/opcua/opcua.la -dlopen
> plugins/profinet/profinet.la -dlopen plugins/stats_tree/stats_tree.la
> -dlopen plugins/unistim/unistim.la -dlopen plugins/wimax/wimax.la
> -L/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib
> -lpcap -lusb-1.0 -lpthread -ladns -lgcrypt -lgpg-error -lgnutls -pthread
> -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0
> -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype
> -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lglib-2.0 -lintl
> -pthread -Wl,--export-dynamic -lgthread-2.0 -lgmodule-2.0 -lglib-2.0
> -lintl -lm -lz
> libtool: link: rm -f .libs/wireshark.nm .libs/wireshark.nmS
> .libs/wireshark.nmT
> libtool: link: (cd .libs&&
> /mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
> -pipe -funit-at-a-time -Wno-error -Os -Os -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wextra
> -Wdeclaration-after-statement -Wendif-labels -Wpointer-arith
> -Wno-pointer-sign -Warray-bounds -Wcast-align -Wformat-security
> -Wold-style-definition -Wno-error=unused-but-set-variable
> -fexcess-precision=fast -pthread -D_REENTRANT
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gtk-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/gtk-2.0/include
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/atk-1.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/cairo
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gdk-pixbuf-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pango-1.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/glib-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/glib-2.0/include
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pixman-1
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/freetype2
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/directfb
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/libpng14
> -c -fno-builtin "wiresharkS.c")
> libtool: link: rm -f ".libs/wiresharkS.c" ".libs/wireshark.nm"
> ".libs/wireshark.nmS" ".libs/wireshark.nmT"
> libtool: link:
> /mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
> -DPYTHON_DIR= -pipe -funit-at-a-time -Wno-error -Os -Os
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall
> -W -Wextra -Wdeclaration-after-statement -Wendif-labels -Wpointer-arith
> -Wno-pointer-sign -Warray-bounds -Wcast-align -Wformat-security
> -Wold-style-definition -Wno-error=unused-but-set-variable
> -fexcess-precision=fast -pthread -D_REENTRANT
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gtk-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/gtk-2.0/include
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/atk-1.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/cairo
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gdk-pixbuf-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pango-1.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/glib-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/glib-2.0/include
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pixman-1
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/freetype2
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/directfb
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/libpng14
> -Wl,-static -static -Wl,-S -Wl,-O1 -Wl,--as-needed -Wl,-z -Wl,combreloc
> -Wl,--enable-new-dtags -Wl,--hash-style=gnu -Wl,--as-needed -o wireshark
> wireshark-capture-pcap-util-unix.o wireshark-capture-pcap-util.o
> wireshark-cfile.o wireshark-clopts_common.o wireshark-disabled_protos.o
> wireshark-frame_data_sequence.o wireshark-packet-range.o
> wireshark-print.o wireshark-ps.o wireshark-sync_pipe_write.o
> wireshark-timestats.o wireshark-tap-megaco-common.o
> wireshark-tap-rtp-common.o wireshark-version_info.o
> wireshark-capture_ifinfo.o wireshark-capture_sync.o
> wireshark-capture_ui_utils.o wireshark-airpcap_loader.o
> wireshark-capture.o wireshark-capture_info.o wireshark-capture_opts.o
> wireshark-color_filters.o wireshark-file.o wireshark-fileset.o
> wireshark-filters.o wireshark-g711.o wireshark-merge.o
> wireshark-proto_hier_stats.o wireshark-recent.o wireshark-summary.o
> wireshark-tempfile.o wireshark-u3.o .libs/wiresharkS.o -pthread -pthread
> -Wl,--export-dynamic  plugins/asn1/.libs/asn1.a
> plugins/docsis/.libs/docsis.a plugins/ethercat/.libs/ethercat.a
> plugins/gryphon/.libs/gryphon.a plugins/irda/.libs/irda.a
> plugins/m2m/.libs/m2m.a plugins/mate/.libs/mate.a
> plugins/opcua/.libs/opcua.a plugins/profinet/.libs/profinet.a
> plugins/stats_tree/.libs/stats_tree.a plugins/unistim/.libs/unistim.a
> plugins/wimax/.libs/wimax.a ui/gtk/libgtkui.a ui/gtk/libgtkui_dirty.a
> ui/libui.a codecs/libcodec.a wiretap/.libs/libwiretap.a
> epan/.libs/libwireshark.a -lgnutls -L/usr/lib
                                      ^^^^^^^^^^
  Here's your culprit.

  Probably one of the .la files incorrectly adds /usr/lib.

  Question is why libtool adds it, of course...

  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
