From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 06 Jan 2013 20:12:42 +0200
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <20130106054113.GD13545@sapphire.tkos.co.il>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
 <50E6E757.10809@zacarias.com.ar> <50E6EDB5.9070004@petroprogram.com>
 <20130106054113.GD13545@sapphire.tkos.co.il>
Message-ID: <50E9BE9A.4030703@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch

6.1.2013 7:41, Baruch Siach kirjoitti:
> Hi Stefan,
>
> On Fri, Jan 04, 2013 at 04:56:53PM +0200, Stefan Fr?berg wrote:
>> Hello Gustavo, all
> [...]
>
>> (It took a long time for me to figure why wireshark that im trying to
>> compile here did not
>> work out with libpcap, untill I found out that the
>> $(STAGING_DIR)/usr/bin/pcap-config spit a
>> wrong prefix all the time...)
> Good to see work on wireshark. Did you fix the RPATH problem I encountered 
> while trying to build tshark 
> (http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/48053) ?
>
> baruch
>
This is the problem Im having right now:

make[2]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.4"
/usr/bin/perl ./make-version.pl .
Version configuration file version.conf not found.  Using defaults.
svnversion.h unchanged.
/bin/sh ./libtool  --tag=CC   --mode=link
/mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc 
-DPYTHON_DIR= -pipe -funit-at-a-time -Wno-error -Os -Os 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall
-W -Wextra -Wdeclaration-after-statement -Wendif-labels -Wpointer-arith
-Wno-pointer-sign -Warray-bounds -Wcast-align -Wformat-security
-Wold-style-definition -Wno-error=unused-but-set-variable
-fexcess-precision=fast -pthread -D_REENTRANT
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gtk-2.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/gtk-2.0/include
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/atk-1.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/cairo
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gdk-pixbuf-2.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pango-1.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/glib-2.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/glib-2.0/include
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pixman-1
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/freetype2
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/directfb
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/libpng14  
-Wl,-static -all-static -Wl,-S -Wl,-O1 -Wl,--as-needed -Wl,-z
-Wl,combreloc -Wl,--enable-new-dtags -Wl,--hash-style=gnu
-Wl,--as-needed -o wireshark wireshark-capture-pcap-util-unix.o
wireshark-capture-pcap-util.o wireshark-cfile.o
wireshark-clopts_common.o wireshark-disabled_protos.o
wireshark-frame_data_sequence.o wireshark-packet-range.o
wireshark-print.o wireshark-ps.o wireshark-sync_pipe_write.o
wireshark-timestats.o wireshark-tap-megaco-common.o
wireshark-tap-rtp-common.o wireshark-version_info.o
wireshark-capture_ifinfo.o wireshark-capture_sync.o
wireshark-capture_ui_utils.o wireshark-airpcap_loader.o
wireshark-capture.o wireshark-capture_info.o wireshark-capture_opts.o
wireshark-color_filters.o wireshark-file.o wireshark-fileset.o
wireshark-filters.o wireshark-g711.o wireshark-merge.o
wireshark-proto_hier_stats.o wireshark-recent.o wireshark-summary.o
wireshark-tempfile.o wireshark-u3.o ui/gtk/libgtkui.a
ui/gtk/libgtkui_dirty.a ui/libui.a codecs/libcodec.a
wiretap/libwiretap.la epan/libwireshark.la wsutil/libwsutil.la -lcrypto 
-dlopen plugins/asn1/asn1.la -dlopen plugins/docsis/docsis.la -dlopen
plugins/ethercat/ethercat.la -dlopen plugins/gryphon/gryphon.la -dlopen
plugins/irda/irda.la -dlopen plugins/m2m/m2m.la -dlopen
plugins/mate/mate.la -dlopen plugins/opcua/opcua.la -dlopen
plugins/profinet/profinet.la -dlopen plugins/stats_tree/stats_tree.la
-dlopen plugins/unistim/unistim.la -dlopen plugins/wimax/wimax.la
-L/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib
-lpcap -lusb-1.0 -lpthread -ladns -lgcrypt -lgpg-error -lgnutls -pthread
-lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0
-lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype
-lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lglib-2.0 -lintl
-pthread -Wl,--export-dynamic -lgthread-2.0 -lgmodule-2.0 -lglib-2.0
-lintl -lm -lz
libtool: link: rm -f .libs/wireshark.nm .libs/wireshark.nmS
.libs/wireshark.nmT
libtool: link: (cd .libs &&
/mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-pipe -funit-at-a-time -Wno-error -Os -Os -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wextra
-Wdeclaration-after-statement -Wendif-labels -Wpointer-arith
-Wno-pointer-sign -Warray-bounds -Wcast-align -Wformat-security
-Wold-style-definition -Wno-error=unused-but-set-variable
-fexcess-precision=fast -pthread -D_REENTRANT
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gtk-2.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/gtk-2.0/include
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/atk-1.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/cairo
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gdk-pixbuf-2.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pango-1.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/glib-2.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/glib-2.0/include
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pixman-1
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/freetype2
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/directfb
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/libpng14
-c -fno-builtin "wiresharkS.c")
libtool: link: rm -f ".libs/wiresharkS.c" ".libs/wireshark.nm"
".libs/wireshark.nmS" ".libs/wireshark.nmT"
libtool: link:
/mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-DPYTHON_DIR= -pipe -funit-at-a-time -Wno-error -Os -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall
-W -Wextra -Wdeclaration-after-statement -Wendif-labels -Wpointer-arith
-Wno-pointer-sign -Warray-bounds -Wcast-align -Wformat-security
-Wold-style-definition -Wno-error=unused-but-set-variable
-fexcess-precision=fast -pthread -D_REENTRANT
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gtk-2.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/gtk-2.0/include
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/atk-1.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/cairo
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/gdk-pixbuf-2.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pango-1.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/glib-2.0
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/glib-2.0/include
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/pixman-1
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/freetype2
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/directfb
-I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/libpng14
-Wl,-static -static -Wl,-S -Wl,-O1 -Wl,--as-needed -Wl,-z -Wl,combreloc
-Wl,--enable-new-dtags -Wl,--hash-style=gnu -Wl,--as-needed -o wireshark
wireshark-capture-pcap-util-unix.o wireshark-capture-pcap-util.o
wireshark-cfile.o wireshark-clopts_common.o wireshark-disabled_protos.o
wireshark-frame_data_sequence.o wireshark-packet-range.o
wireshark-print.o wireshark-ps.o wireshark-sync_pipe_write.o
wireshark-timestats.o wireshark-tap-megaco-common.o
wireshark-tap-rtp-common.o wireshark-version_info.o
wireshark-capture_ifinfo.o wireshark-capture_sync.o
wireshark-capture_ui_utils.o wireshark-airpcap_loader.o
wireshark-capture.o wireshark-capture_info.o wireshark-capture_opts.o
wireshark-color_filters.o wireshark-file.o wireshark-fileset.o
wireshark-filters.o wireshark-g711.o wireshark-merge.o
wireshark-proto_hier_stats.o wireshark-recent.o wireshark-summary.o
wireshark-tempfile.o wireshark-u3.o .libs/wiresharkS.o -pthread -pthread
-Wl,--export-dynamic  plugins/asn1/.libs/asn1.a
plugins/docsis/.libs/docsis.a plugins/ethercat/.libs/ethercat.a
plugins/gryphon/.libs/gryphon.a plugins/irda/.libs/irda.a
plugins/m2m/.libs/m2m.a plugins/mate/.libs/mate.a
plugins/opcua/.libs/opcua.a plugins/profinet/.libs/profinet.a
plugins/stats_tree/.libs/stats_tree.a plugins/unistim/.libs/unistim.a
plugins/wimax/.libs/wimax.a ui/gtk/libgtkui.a ui/gtk/libgtkui_dirty.a
ui/libui.a codecs/libcodec.a wiretap/.libs/libwiretap.a
epan/.libs/libwireshark.a -lgnutls -L/usr/lib
/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.4/wiretap/.libs/libwiretap.a
/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.4/wsutil/.libs/libwsutil.a
wsutil/.libs/libwsutil.a -lcrypto
-L/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib
-lpcap
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libusb-1.0.a
-ladns
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.a
-lgcrypt
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgcrypt.a
-lgpg-error
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgpg-error.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgtk-x11-2.0.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgdk-x11-2.0.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libatk-1.0.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libpangoft2-1.0.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libpangocairo-1.0.a
-lcairo
/mnt/hee/new/buildroot-2012.08/output/build/pango-1.28.4/pango/.libs/libpangoft2-1.0.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/lib/libstdc++.a
/mnt/hee/new/buildroot-2012.08/output/build/pango-1.28.4/pango/.libs/libpango-1.0.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgdk_pixbuf-2.0.a
-lgio-2.0
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgio-2.0.a
/mnt/hee/new/buildroot-2012.08/output/build/libglib2-2.30.2/gobject/.libs/libgobject-2.0.a
/mnt/hee/new/buildroot-2012.08/output/build/libglib2-2.30.2/gmodule/.libs/libgmodule-2.0.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libcairo.a
-lpixman-1 -lfontconfig -lfreetype -lxcb-shm -lxcb-render -lXrender
-lXext
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libpixman-1.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libdirectfb.a
/mnt/hee/new/buildroot-2012.08/output/build/directfb-1.4.16/lib/fusion/.libs/libfusion.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libfusion.a
/mnt/hee/new/buildroot-2012.08/output/build/directfb-1.4.16/lib/direct/.libs/libdirect.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libdirect.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libpng14.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libxcb-shm.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libxcb-render.a
/mnt/hee/new/buildroot-2012.08/output/build/libxcb-1.8.1/src/.libs/libxcb.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libxcb.a
-lXau -lXdmcp
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libXrender.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libX11.a
-lxcb
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libXext.a
-lX11 -lrt
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libpango-1.0.a
-lgobject-2.0 -lgthread-2.0 -lgmodule-2.0 -lglib-2.0
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libfontconfig.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libfreetype.a
-lbz2
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libexpat.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgobject-2.0.a
-lffi
/mnt/hee/new/buildroot-2012.08/output/build/libglib2-2.30.2/gthread/.libs/libgthread-2.0.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libffi.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgthread-2.0.a
-lpthread
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgmodule-2.0.a
-ldl
/mnt/hee/new/buildroot-2012.08/output/build/libglib2-2.30.2/glib/.libs/libglib-2.0.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libglib-2.0.a
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libintl.a
-lc -lm -lz -pthread
/mnt/hee/new/buildroot-2012.08/output/build/libglib2-2.30.2/gmodule/.libs/libgmodule-2.0.a(gmodule.o):
In function `g_module_open':
gmodule.c:(.text+0x35c): warning: Using 'dlopen' in statically linked
applications requires at runtime the shared libraries from the glibc
version used for linking
/usr/lib/libc.a(dcigettext.o): In function `_nl_find_msg':
(.text+0x250): multiple definition of `_nl_find_msg'
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o):dcigettext.c:(.text+0x1f7):
first defined here
/usr/lib/libc.a(dcigettext.o):(.bss+0x0): multiple definition of
`_nl_state_lock'
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o):(.bss+0x0):
first defined here
/usr/lib/libc.a(finddomain.o): In function `_nl_find_domain':
(.text+0x0): multiple definition of `_nl_find_domain'
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libintl.a(finddomain.o):finddomain.c:(.text+0x0):
first defined here
/usr/lib/libc.a(loadmsgcat.o): In function `_nl_load_domain':
(.text+0x0): multiple definition of `_nl_load_domain'
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libintl.a(loadmsgcat.o):loadmsgcat.c:(.text+0x7):
first defined here
/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.4/wsutil/.libs/libwsutil.a(privileges.o):
In function `get_cur_groupname':
privileges.c:(.text+0x179): warning: Using 'getgrgid' in statically
linked applications requires at runtime the shared libraries from the
glibc version used for linking
privileges.c:(.text+0x19f): warning: Using 'endgrent' in statically
linked applications requires at runtime the shared libraries from the
glibc version used for linking
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgio-2.0.a(libgio_2_0_la-glocalvfs.o):
In function `g_local_vfs_parse_name':
glocalvfs.c:(.text+0x10a): warning: Using 'getpwnam' in statically
linked applications requires at runtime the shared libraries from the
glibc version used for linking
epan/.libs/libwireshark.a(libwireshark_la-filesystem.o): In function
`get_persconffile_dir_no_profile.part.0':
filesystem.c:(.text+0x23): warning: Using 'getpwuid' in statically
linked applications requires at runtime the shared libraries from the
glibc version used for linking
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libglib-2.0.a(gutils.o):
In function `g_get_any_init':
gutils.c:(.text+0x970): warning: Using 'setpwent' in statically linked
applications requires at runtime the shared libraries from the glibc
version used for linking
/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.4/wsutil/.libs/libwsutil.a(privileges.o):
In function `get_cur_username':
privileges.c:(.text+0x160): warning: Using 'endpwent' in statically
linked applications requires at runtime the shared libraries from the
glibc version used for linking
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libX11.a(GetDflt.o):
In function `GetHomeDir.part.0':
GetDflt.c:(.text+0x3d): warning: Using 'getpwnam_r' in statically linked
applications requires at runtime the shared libraries from the glibc
version used for linking
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgio-2.0.a(libgio_2_0_la-glocalfileinfo.o):
In function `lookup_uid_data.part.7':
glocalfileinfo.c:(.text+0x1145): warning: Using 'getpwuid_r' in
statically linked applications requires at runtime the shared libraries
from the glibc version used for linking
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libpcap.a(nametoaddr.o):
In function `pcap_nametoaddrinfo':
nametoaddr.c:(.text+0xb4): warning: Using 'getaddrinfo' in statically
linked applications requires at runtime the shared libraries from the
glibc version used for linking
/usr/lib/libpthread.a(libpthread.o): In function `sem_open':
(.text+0x6917): warning: the use of `mktemp' is dangerous, better use
`mkstemp'
epan/.libs/libwireshark.a(libwireshark_la-addr_resolv.o): In function
`host_lookup':
addr_resolv.c:(.text+0x51e): warning: Using 'gethostbyaddr' in
statically linked applications requires at runtime the shared libraries
from the glibc version used for linking
epan/.libs/libwireshark.a(libwireshark_la-addr_resolv.o): In function
`get_host_ipaddr':
addr_resolv.c:(.text+0x2a7e): warning: Using 'gethostbyname' in
statically linked applications requires at runtime the shared libraries
from the glibc version used for linking
epan/.libs/libwireshark.a(libwireshark_la-addr_resolv.o): In function
`get_host_ipaddr6':
addr_resolv.c:(.text+0x2b11): warning: Using 'gethostbyname2' in
statically linked applications requires at runtime the shared libraries
from the glibc version used for linking
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libpcap.a(nametoaddr.o):
In function `pcap_nametonetaddr':
nametoaddr.c:(.text+0xe4): warning: Using 'getnetbyname' in statically
linked applications requires at runtime the shared libraries from the
glibc version used for linking
epan/.libs/libwireshark.a(libwireshark_la-ipproto.o): In function
`ipprotostr':
ipproto.c:(.text+0x31): warning: Using 'getprotobynumber' in statically
linked applications requires at runtime the shared libraries from the
glibc version used for linking
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libpcap.a(nametoaddr.o):
In function `pcap_nametoproto':
nametoaddr.c:(.text+0x2a7): warning: Using 'getprotobyname' in
statically linked applications requires at runtime the shared libraries
from the glibc version used for linking
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libpcap.a(nametoaddr.o):
In function `pcap_nametoport':
nametoaddr.c:(.text+0x122): warning: Using 'getservbyname' in statically
linked applications requires at runtime the shared libraries from the
glibc version used for linking
epan/.libs/libwireshark.a(libwireshark_la-addr_resolv.o): In function
`serv_name_lookup':
addr_resolv.c:(.text+0x85a): warning: Using 'getservbyport' in
statically linked applications requires at runtime the shared libraries
from the glibc version used for linking
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgio-2.0.a(libgio_2_0_la-gnetworkaddress.o):
In function `g_network_address_parse':
gnetworkaddress.c:(.text+0x833): warning: Using 'endservent' in
statically linked applications requires at runtime the shared libraries
from the glibc version used for linking
/mnt/hee/new/buildroot-2012.08/output/host/usr/lib/gcc/i586-unknown-linux-uclibc/4.6.3/../../../../i586-unknown-linux-uclibc/bin/ld:
dynamic STT_GNU_IFUNC symbol `strcmp' with pointer equality in
`/usr/lib/libc.a(strcmp.o)' can not be used when making an executable;
recompile with -fPIE and relink with -pie
collect2: ld returned 1 exit status
libtool: link: rm -f ".libs/wiresharkS.o"
make[2]: *** [wireshark] Virhe 1
make[2]: Poistutaan hakemistosta
"/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.4"
make[1]: *** [all-recursive] Virhe 1
make[1]: Poistutaan hakemistosta
"/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.4"
make: *** [all] Virhe 2

I tried your package/wireshark/wireshark-dont-include-prefix.patch from
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/48053
to see if it would stop using /usr/lib stuff but no joy. :-(

Here's also my wireshark.mk

#############################################################
#
# wireshark
#
#############################################################
WIRESHARK_VERSION = 1.8.4
WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions/
WIRESHARK_AUTORECONF = YES
WIRESHARK_DEPENDENCIES += adns atk cairo gnutls libgcrypt libglib2
libgtk2 libcap libpcap pango  zlib
WIRESHARK_CONF_OPT += --sysconfdir=/etc/wireshark --disable-usr-local
--disable-extra-gcc-checks \
             --with-ssl --with-adns --without-c-ares
--with-libgcrypt-prefix=$(STAGING_DIR)/usr

WIRESHARK_CONF_ENV += ac_cv_func_connect=yes \
              ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config \
              ac_cv_lib_crypto_EVP_md5=yes

$(eval $(autotools-package))

Regards
Stefan
