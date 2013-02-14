From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 14 Feb 2013 17:52:52 +0200
Subject: [Buildroot] [PATCHv5 2/2] wireshark: new package
In-Reply-To: <511D0638.90106@petroprogram.com>
References: <f903151303143f85e1e9c69b1f20400af878be97.1359870806.git.baruch@tkos.co.il>
 <f41bbd107d237f76229f44b7d78fcec962c15309.1359870806.git.baruch@tkos.co.il>
 <510E53EB.7020704@petroprogram.com>
 <20130214045630.GA15440@sapphire.tkos.co.il>
 <511CFD48.8000300@petroprogram.com> <511D0638.90106@petroprogram.com>
Message-ID: <511D0854.7010506@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

14.2.2013 17:43, Stefan Fr?berg kirjoitti:
> 14.2.2013 17:05, Stefan Fr?berg kirjoitti:
>> Hi Baruch
>>
>> 14.2.2013 6:56, Baruch Siach kirjoitti:
>>> Hi Stefan,
>>>
>>> On Sun, Feb 03, 2013 at 02:11:23PM +0200, Stefan Fr?berg wrote:
>>>> This looks very good. Im going to test this later this evening.
>>> Did you have a chance to test, then?
>>>
>>> baruch
>>>
>> Sorry, I was distracted again but it's compiling right now.
>> Will report later.
>>
>> Stefan
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> I got the following error when compiling.
>
>
>
> make[2]: Poistutaan hakemistosta
> "/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.5/ui/cli"
> Making all in .
> make[2]: Siirryt??n hakemistoon
> "/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.5"
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
> -fexcess-precision=fast -pthread
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/glib-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/glib-2.0/include  
> -export-dynamic -Wl,-S -Wl,-O1 -Wl,--as-needed -Wl,-z -Wl,combreloc
> -Wl,--enable-new-dtags -Wl,--hash-style=gnu -Wl,--as-needed -o tshark
> tshark-capture-pcap-util-unix.o tshark-capture-pcap-util.o
> tshark-cfile.o tshark-clopts_common.o tshark-disabled_protos.o
> tshark-frame_data_sequence.o tshark-packet-range.o tshark-print.o
> tshark-ps.o tshark-sync_pipe_write.o tshark-timestats.o
> tshark-tap-megaco-common.o tshark-tap-rtp-common.o tshark-version_info.o
> tshark-capture_ifinfo.o tshark-capture_sync.o tshark-capture_ui_utils.o
> tshark-capture_opts.o tshark-tempfile.o tshark-tshark.o
> ui/cli/libcliui.a ui/libui.a wiretap/libwiretap.la epan/libwireshark.la
> wsutil/libwsutil.la  -dlopen plugins/asn1/asn1.la -dlopen
> plugins/docsis/docsis.la -dlopen plugins/ethercat/ethercat.la -dlopen
> plugins/gryphon/gryphon.la -dlopen plugins/irda/irda.la -dlopen
> plugins/m2m/m2m.la -dlopen plugins/mate/mate.la -dlopen
> plugins/opcua/opcua.la -dlopen plugins/profinet/profinet.la -dlopen
> plugins/stats_tree/stats_tree.la -dlopen plugins/unistim/unistim.la
> -dlopen plugins/wimax/wimax.la -pthread -Wl,--export-dynamic
> -lgthread-2.0 -lgmodule-2.0 -lglib-2.0 -lintl   -lm
> -L/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib
> -Wl,-rpath,/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib
> -lpcap
> -L/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib
> -lgcrypt -lgpg-error -lgnutls  -lz
> libtool: link: rm -f .libs/tshark.nm .libs/tshark.nmS .libs/tshark.nmT
> libtool: link: (cd .libs &&
> /mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
> -pipe -funit-at-a-time -Wno-error -Os -Os -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wextra
> -Wdeclaration-after-statement -Wendif-labels -Wpointer-arith
> -Wno-pointer-sign -Warray-bounds -Wcast-align -Wformat-security
> -Wold-style-definition -Wno-error=unused-but-set-variable
> -fexcess-precision=fast -pthread
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/glib-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/glib-2.0/include
> -c -fno-builtin "tsharkS.c")
> libtool: link: rm -f ".libs/tsharkS.c" ".libs/tshark.nm"
> ".libs/tshark.nmS" ".libs/tshark.nmT"
> libtool: link:
> /mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
> -DPYTHON_DIR= -pipe -funit-at-a-time -Wno-error -Os -Os
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall
> -W -Wextra -Wdeclaration-after-statement -Wendif-labels -Wpointer-arith
> -Wno-pointer-sign -Warray-bounds -Wcast-align -Wformat-security
> -Wold-style-definition -Wno-error=unused-but-set-variable
> -fexcess-precision=fast -pthread
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/include/glib-2.0
> -I/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/glib-2.0/include
> -Wl,-S -Wl,-O1 -Wl,--as-needed -Wl,-z -Wl,combreloc
> -Wl,--enable-new-dtags -Wl,--hash-style=gnu -Wl,--as-needed -o tshark
> tshark-capture-pcap-util-unix.o tshark-capture-pcap-util.o
> tshark-cfile.o tshark-clopts_common.o tshark-disabled_protos.o
> tshark-frame_data_sequence.o tshark-packet-range.o tshark-print.o
> tshark-ps.o tshark-sync_pipe_write.o tshark-timestats.o
> tshark-tap-megaco-common.o tshark-tap-rtp-common.o tshark-version_info.o
> tshark-capture_ifinfo.o tshark-capture_sync.o tshark-capture_ui_utils.o
> tshark-capture_opts.o tshark-tempfile.o tshark-tshark.o .libs/tsharkS.o
> -pthread -Wl,--export-dynamic -Wl,-rpath
> -Wl,/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib
> -Wl,--export-dynamic  ui/cli/libcliui.a ui/libui.a
> wiretap/.libs/libwiretap.so epan/.libs/libwireshark.so
> -L/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib
> -L/usr/lib
> /mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.5/wiretap/.libs/libwiretap.so
> /mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.5/wsutil/.libs/libwsutil.so
> wsutil/.libs/libwsutil.so
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgthread-2.0.so
> -lpthread
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgmodule-2.0.so
> -ldl
> /mnt/hee/new/buildroot-2012.08/output/build/libglib2-2.30.3/glib/.libs/libglib-2.0.so
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libglib-2.0.so
> -lm -lpcap
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgcrypt.so
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgpg-error.so
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libintl.so
> -lc -lz -pthread -Wl,-rpath
> -Wl,/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.5/wiretap/.libs
> -Wl,-rpath
> -Wl,/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.5/epan/.libs
> -Wl,-rpath
> -Wl,/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.5/wsutil/.libs
> -Wl,-rpath
> -Wl,/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib
> -Wl,-rpath
> -Wl,/mnt/hee/new/buildroot-2012.08/output/build/libglib2-2.30.3/glib/.libs
> -Wl,-rpath
> -Wl,/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib
> /mnt/hee/new/buildroot-2012.08/output/host/usr/lib/gcc/i586-unknown-linux-uclibc/4.7.1/../../../../i586-unknown-linux-uclibc/bin/ld:
> warning: libc.so.6, needed by
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so,
> not found (try using -rpath or -rpath-link)
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fwrite at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `sprintf at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `stderr at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `ferror at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strchr at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strncat at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fread at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `vasprintf at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `gmtime at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strstr at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fseek at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fileno at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `__ctype_b_loc at GLIBC_2.3'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fputc at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strdup at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `__errno_location at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fgets at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `atoi at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `time at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strrchr at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strverscmp at GLIBC_2.1'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strtol at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `feof at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `gmtime_r at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `vsnprintf at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strncasecmp at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `abort at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strcasecmp at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strncmp at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `recv at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strcat at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fclose at GLIBC_2.1'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fgetc at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `memmove at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `__xstat64 at GLIBC_2.2'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `calloc at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strcpy at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strncpy at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fprintf at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `free at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fopen64 at GLIBC_2.1'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `snprintf at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `__fxstat64 at GLIBC_2.2'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strftime at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `__assert at GLIBC_2.2'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `realloc at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `tmpfile64 at GLIBC_2.1'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `memmem at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strcmp at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `strtoul at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `__ctype_toupper_loc at GLIBC_2.3'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `malloc at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `memcmp at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `send at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `ftell at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fputs at GLIBC_2.0'
> /mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/libgnutls.so:
> undefined reference to `fflush at GLIBC_2.0'
> collect2: error: ld returned 1 exit status
> libtool: link: rm -f ".libs/tsharkS.o"
> make[2]: *** [tshark] Virhe 1
> make[2]: Poistutaan hakemistosta
> "/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.5"
> make[1]: *** [all-recursive] Virhe 1
> make[1]: Poistutaan hakemistosta
> "/mnt/hee/new/buildroot-2012.08/output/build/wireshark-1.8.5"
> make: *** [all] Virhe 2
>
>


It seems I need to upgrade to latest git version if I want this to work.
That version of gnutls has
--disable-rpath in it's conf.


BTW, Baruch did you manage to compile this version of wireshark against
that gnutls 3 ?
Im asking it because in gentoo there is a patch for wireshark 1.8.5 that
is supposedly to support gnutls 3

Here's the patch
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-analyzer/wireshark/files/wireshark-1.8.3-gnutls3.patch?revision=1.1&view=markup

And heres their ebuild file where they are applying that patch against
1.8..5

http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-analyzer/wireshark/wireshark-1.8.5.ebuild?view=markup


Regards
Stefan
