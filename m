From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 22:35:26 +0200
Subject: [Buildroot] Segmentation faults after gcc update
In-Reply-To: <20110930215915.3d7fad80@skate>
References: <1317110841.20688.12.camel@sven> <20110927233506.55cb52a2@skate>
 <1317221262.8481.4.camel@sven> <1317373796.20520.3.camel@sven>
 <20110930215915.3d7fad80@skate>
Message-ID: <20110930223526.6aa05012@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 30 Sep 2011 21:59:15 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Maybe you should raise the issue on the uClibc mailing list?

A quick data point: I tested a build with gcc 4.6.1, uClibc 0.9.32,
NPTL, and both iperf and dbus-daemon start fine for me:

# iperf 
Usage: iperf [-s|-c host] [options]
Try `iperf --help' for more information.
# dbus-daemon 
No configuration file specified.
dbus-daemon [--version] [--session] [--system] [--config-file=FILE] [--print-address[=DESCRIPTOR]] [--print-pid[=DESCRIPTOR]] [--fork] [--nofork] [--introspect] [--address=ADDRESS] [--systemd-activation]
# uname -a
Linux buildroot 2.6.38.8 #1 Fri Sep 30 20:24:38 UTC 2011 armv5tejl
GNU/Linux

My target optimization options is:

BR2_GCC_TARGET_TUNE="arm926ej-s"
BR2_GCC_TARGET_ARCH="armv5te"
BR2_GCC_TARGET_ABI="aapcs-linux"

Therefore, I guess that the problem might be iwmmxt related. Can you
try with "lower" optimization options ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
