From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 20:16:26 +0200
Subject: [Buildroot] [PATCH] Bump gpsd from version 2.95 to version 3.7
In-Reply-To: <1342779078-2927-1-git-send-email-spdawson@gmail.com>
References: <1342779078-2927-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120720201626.707f66a2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 11:11:18 +0100,
spdawson at gmail.com a ?crit :

> diff --git a/package/gpsd/gpsd-fix-acs_map-compile-errors.patch b/package/gpsd/gpsd-fix-acs_map-compile-errors.patch
> new file mode 100644
> index 0000000..14d9287
> --- /dev/null
> +++ b/package/gpsd/gpsd-fix-acs_map-compile-errors.patch
> @@ -0,0 +1,29 @@
> +Hack gpsd to prevent undefined references to acs_map from ncurses.
> +
> +Signed-off-by: Simon Dawson <spdawson@gmail.com>
> +diff -Nurp a/gpsmon.c b/gpsmon.c
> +--- a/gpsmon.c	2012-05-18 09:45:37.000000000 +0100
> ++++ b/gpsmon.c	2012-06-07 12:41:31.257807969 +0100
> +@@ -24,6 +24,9 @@
> + #include <unistd.h>
> + #endif /* S_SPLINT_S */
> + 
> ++/* Ugly hack to prevent undefined reference to acs_map */
> ++unsigned long acs_map[128];

Is there a non-ugly variant of this in the works?

> -GPSD_VERSION = 2.95
> -GPSD_SITE = http://download.berlios.de/gpsd
> +GPSD_VERSION = 3.7
> +GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd/
>  GPSD_INSTALL_STAGING = YES
> -GPSD_TARGET_BINS = cgps gpsctl gpsdecode gpsmon gpspipe gpxlogger lcdgps
> +
> +GPSD_DEPENDENCIES = host-scons host-python

Do we really need a host-python here? I mean, can't we use the one
provided by the distribution, which is a Buildroot requirement?

Of course, if we need to have the same Python version on the host and
the target, then host-python is needed. Otherwise, if we could avoid
that dependency, it would be great.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
