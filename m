From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:25:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/brotli: fix pkg-config
In-Reply-To: <20201005171407.2608421-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 5 Oct 2020 19:14:07 +0200")
References: <20201005171407.2608421-1-fontaine.fabrice@gmail.com>
Message-ID: <871ri5g766.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > brotli pkg-config files are broken since version 1.0.8 and
 > https://github.com/google/brotli/commit/31754d4ffce14153b5c2addf7a11019ec23f51c1

 > This raise static build failures with all packages using brotli,
 > fontconfig or freetype such as fbterm:

 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -static
 > -static -o fbterm fbterm-fbconfig.o fbterm-fbio.o fbterm-fbshell.o
 > fbterm-fbshellman.o fbterm-fbterm.o fbterm-font.o fbterm-input.o
 > fbterm-mouse.o fbterm-screen.o fbterm-improxy.o fbterm-screen_render.o
 > fbterm-fbdev.o fbterm-vesadev.o lib/libshell.a
 > -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -lfreetype -lbz2
 > -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -lz -lpng16 -lz
 > -R/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -lbrotlidec
 > -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -R/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buil
 >  droot-linux-uclibcgnueabihf/sysroot/usr/lib -lbrotlicommon
 > -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -lfontconfig -lfreetype -lbz2
 > -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -lz -lpng16 -lz
 > -R/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -lbrotlidec
 > -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -R/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -lbrotlicommon
 > -L/srv/storage/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib
 > -luuid -lexpat -lutil -lutil
 > arm-linux-g++.br_real: error: unrecognized command line option '-R'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/21ede59686d4998c9e643ea874396a11b1c0df93

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
