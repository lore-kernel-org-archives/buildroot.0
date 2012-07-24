From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 10:11:03 +0200
Subject: [Buildroot] [PATCH v3] Bump gpsd from version 2.95 to version
 3.7
In-Reply-To: <20120724084545.6c0cedab@skate>
References: <1343071776-1689-1-git-send-email-spdawson@gmail.com>
 <20120724084545.6c0cedab@skate>
Message-ID: <20120724101103.6a11efda@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Another build issue:

 (5)

gpsd.o: In function `onsig':
gpsd.c:(.text+0x8): undefined reference to `_mcount'
gpsd.o: In function `adjust_max_fd':
gpsd.c:(.text+0x38): undefined reference to `_mcount'
gpsd.o: In function `rstrip':
gpsd.c:(.text+0xe0): undefined reference to `_mcount'
gpsd.o: In function `find_device':
gpsd.c:(.text+0x160): undefined reference to `_mcount'
gpsd.o: In function `snarfline':
gpsd.c:(.text+0x204): undefined reference to `_mcount'
gpsd.o:gpsd.c:(.text+0x2ec): more undefined references to `_mcount' follow
collect2: ld returned 1 exit status
scons: *** [gpsd] Error 1
scons: building terminated because of errors.
make: *** [/home/peko/scratch/build/gpsd-3.7/.stamp_built] Error 2

See
http://autobuild.buildroot.org/results/be707893f4bf0e7e964d183e4a655c5bb72d1889/build-end.log
and
http://autobuild.buildroot.org/results/be707893f4bf0e7e964d183e4a655c5bb72d1889/defconfig.

It happens when BR2_PACKAGE_GPSD_PROFILING is enabled. I don't know if
uClibc has the necessary infrastructure to support profiling.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
