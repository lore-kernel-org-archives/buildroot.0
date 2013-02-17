From: Shawn J. Goff <shawn7400@gmail.com>
Date: Sun, 17 Feb 2013 12:07:59 -0500
Subject: [Buildroot] Adding a ModemManager package
Message-ID: <51210E6F.6000504@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to add a ModemManager package. While building, I'm getting 
this error during the installation step: "/usr/lib/libgcc_s.so: file not 
recognized: File format not recognized". This looks like it's looking at 
my host's libgcc_s.so instead of the target's version. If that's the 
case I'm not sure why or how to fix it. I did have to use autogen.sh to 
create the configure script and lots of other stuff; I did this on my 
host system, so I'm not sure if that is affecting it.

Below is a larger part of the output for context.


  CCLD     libmm-glib.la
make[4]: Entering directory 
`/home/shawn/projects/all-projects/fx/buildroot-modemmanager/output/build/modem-manager-0.7.990/libmm-glib'
  /usr/bin/mkdir -p 
'/home/shawn/projects/fx/buildroot-modemmanager/output/target/usr/lib'
  /usr/bin/mkdir -p 
'/home/shawn/projects/fx/buildroot-modemmanager/output/target/usr/include/libmm-glib'
  /bin/sh ../libtool   --mode=install /usr/bin/install -c libmm-glib.la 
'/home/shawn/projects/fx/buildroot-modemmanager/output/target/usr/lib'
  /usr/bin/install -c -m 644 libmm-glib.h mm-manager.h mm-object.h 
mm-modem.h mm-modem-3gpp.h mm-modem-3gpp-ussd.h mm-modem-cdma.h 
mm-modem-messaging.h mm-modem-location.h mm-modem-time.h 
mm-modem-firmware.h mm-modem-simple.h mm-sim.h mm-sms.h mm-bearer.h 
mm-simple-status.h mm-simple-connect-properties.h mm-bearer-properties.h 
mm-sms-properties.h mm-bearer-ip-config.h mm-location-common.h 
mm-location-3gpp.h mm-location-gps-nmea.h mm-location-gps-raw.h 
mm-location-cdma-bs.h mm-unlock-retries.h mm-network-timezone.h 
mm-firmware-properties.h 
'/home/shawn/projects/fx/buildroot-modemmanager/output/target/usr/include/libmm-glib'
libtool: install: warning: relinking `libmm-glib.la'
libtool: install: (cd 
/home/shawn/projects/all-projects/fx/buildroot-modemmanager/output/build/modem-manager-0.7.990/libmm-glib; 
/bin/sh 
/home/shawn/projects/all-projects/fx/buildroot-modemmanager/output/build/modem-manager-0.7.990/libtool 
--silent --tag CC --mode=relink 
/home/shawn/projects/fx/buildroot-modemmanager/output/host/usr/bin/arm-unknown-linux-gnueabi-gcc 
-Wall -Werror -std=gnu89 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -pipe -ggdb -Os -Wmissing-declarations 
-Wmissing-prototypes -Wdeclaration-after-statement -Wno-unused-parameter 
-Wno-sign-compare -fno-strict-aliasing -Wno-deprecated-declarations 
-Wno-unused-but-set-variable -o libmm-glib.la -rpath /usr/lib 
libmm_glib_la-mm-manager.lo libmm_glib_la-mm-object.lo 
libmm_glib_la-mm-modem.lo libmm_glib_la-mm-modem-3gpp.lo 
libmm_glib_la-mm-modem-3gpp-ussd.lo libmm_glib_la-mm-modem-cdma.lo 
libmm_glib_la-mm-modem-simple.lo libmm_glib_la-mm-modem-location.lo 
libmm_glib_la-mm-modem-time.lo libmm_glib_la-mm-modem-firmware.lo 
libmm_glib_la-mm-sim.lo libmm_glib_la-mm-sms.lo 
libmm_glib_la-mm-modem-messaging.lo libmm_glib_la-mm-bearer.lo 
libmm_glib_la-mm-common-helpers.lo libmm_glib_la-mm-simple-status.lo 
libmm_glib_la-mm-simple-connect-properties.lo 
libmm_glib_la-mm-bearer-properties.lo libmm_glib_la-mm-sms-properties.lo 
libmm_glib_la-mm-bearer-ip-config.lo libmm_glib_la-mm-location-3gpp.lo 
libmm_glib_la-mm-location-gps-raw.lo 
libmm_glib_la-mm-location-gps-nmea.lo 
libmm_glib_la-mm-location-cdma-bs.lo libmm_glib_la-mm-unlock-retries.lo 
libmm_glib_la-mm-network-timezone.lo 
libmm_glib_la-mm-firmware-properties.lo 
../libmm-glib/generated/libmm-generated.la -lgio-2.0 -lgobject-2.0 
-L/home/shawn/projects/fx/buildroot-modemmanager/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib 
-lglib-2.0 -inst-prefix-dir 
/home/shawn/projects/fx/buildroot-modemmanager/output/target)
/usr/lib/libgcc_s.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status
libtool: install: error: relink `libmm-glib.la' with the above command 
before installing it
make[4]: *** [install-libLTLIBRARIES] Error 1
make[4]: Leaving directory 
`/home/shawn/projects/all-projects/fx/buildroot-modemmanager/output/build/modem-manager-0.7.990/libmm-glib'
make[3]: *** [install-am] Error 2
make[3]: Leaving directory 
`/home/shawn/projects/all-projects/fx/buildroot-modemmanager/output/build/modem-manager-0.7.990/libmm-glib'
make[2]: *** [install-recursive] Error 1
make[2]: Leaving directory 
`/home/shawn/projects/all-projects/fx/buildroot-modemmanager/output/build/modem-manager-0.7.990/libmm-glib'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory 
`/home/shawn/projects/all-projects/fx/buildroot-modemmanager/output/build/modem-manager-0.7.990'
make: *** 
[/home/shawn/projects/fx/buildroot-modemmanager/output/build/modem-manager-0.7.990/.stamp_target_installed] 
Error 2
