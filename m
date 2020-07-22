From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 08:57:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-ugly:
 fix static build with libdvdcss
In-Reply-To: <20200630065228.1594953-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 30 Jun 2020 08:52:28 +0200")
References: <20200630065228.1594953-1-fontaine.fabrice@gmail.com>
Message-ID: <87eep4kpej.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The double quotes from GST1_PLUGINS_UGLY_LDFLAGS += "-ldvdcss"
 > raise the following build failure:

 > sed -e
 > 's%@TARGET_CROSS@%/home/buildroot/autobuild/run/instance-2/output-1/host/bin/arm-linux-%g'
 > -e 's%@TARGET_ARCH@%arm%g' -e 's%@TARGET_CPU@%arm926ej-s%g' -e
 > 's%@TARGET_ENDIAN@%little%g' -e
 > 's%@TARGET_CFLAGS@%"-D_LARGEFILE_SOURCE", "-D_LARGEFILE64_SOURCE",
 > "-D_FILE_OFFSET_BITS=64", "-Os", "-g2", "-static"%g' -e
 > 's%@TARGET_LDFLAGS@%"-static", ""-ldvdcss""%g' -e
 > 's%@TARGET_CXXFLAGS@%"-D_LARGEFILE_SOURCE", "-D_LARGEFILE64_SOURCE",
 > "-D_FILE_OFFSET_BITS=64", "-Os", "-g2", "-static", "-static"%g' -e
 > 's%@HOST_DIR@%/home/buildroot/autobuild/run/instance-2/output-1/host%g'
 > -e
 > 's%@STAGING_DIR@%/home/buildroot/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot%g'
 > -e 's%@STATIC@%true%g' -e "/^\[binaries\]$/s:$::" -e
 > "/^\[properties\]$/s:$::" package/meson/cross-compilation.conf.in >
 > /home/buildroot/autobuild/run/instance-2/output-1/build/gst1-plugins-ugly-1.16.2//build/cross-compilation.conf
 > PATH="/home/buildroot/autobuild/run/instance-2/output-1/host/bin:/home/buildroot/autobuild/run/instance-2/output-1/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
 > PYTHONNOUSERSITE=y
 > /home/buildroot/autobuild/run/instance-2/output-1/host/bin/meson
 > --prefix=/usr --libdir=lib --default-library=static --buildtype=debug
 > --cross-file=/home/buildroot/autobuild/run/instance-2/output-1/build/gst1-plugins-ugly-1.16.2//build/cross-compilation.conf
 > -Dbuild.pkg_config_path=/home/buildroot/autobuild/run/instance-2/output-1/host/lib/pkgconfig
 > -Dexamples=disabled -Dtests=disabled -Da52dec=disabled
 > -Damrnb=disabled -Damrwbdec=disabled -Dcdio=disabled
 > -Dsidplay=disabled -Dorc=disabled -Dasfdemux=enabled
 > -Ddvdlpcmdec=disabled -Ddvdsub=disabled -Dxingmux=disabled
 > -Drealmedia=disabled -Ddvdread=enabled -Dmpeg2dec=disabled
 > -Dx264=disabled
 > /home/buildroot/autobuild/run/instance-2/output-1/build/gst1-plugins-ugly-1.16.2/
 > /home/buildroot/autobuild/run/instance-2/output-1/build/gs
 >  t1-plugins-ugly-1.16.2//build

 > ERROR: Malformed value in cross file variable c_link_args.

 > However since the switch to messon, this workaround is not needed so
 > drop it

 > Fixes:
 >  - http://autobuild.buildroot.org/results/56a830625cf6e6b0d63b6e7e2761496abc146152

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
