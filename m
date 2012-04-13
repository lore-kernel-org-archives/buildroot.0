From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Apr 2012 11:23:51 +0200
Subject: [Buildroot] Kernel does not boot on I.MX28
In-Reply-To: <63D6870D443E63419AC4A0C97B86C0920D358F816D@MBXCLUSTER.mdh.local>
References: <63D6870D443E63419AC4A0C97B86C0920D358F816B@MBXCLUSTER.mdh.local>
 <20120413095603.b65508a9d94d73d3a694c2ed@kinali.ch>
 <63D6870D443E63419AC4A0C97B86C0920D358F816C@MBXCLUSTER.mdh.local>
 <20120413103108.508e66796f1ca89823168bd0@kinali.ch>
 <63D6870D443E63419AC4A0C97B86C0920D358F816D@MBXCLUSTER.mdh.local>
Message-ID: <20120413112351.0b7e97d3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 13 Apr 2012 11:06:45 +0200,
Mikael ?sberg <mikael.asberg@mdh.se> a ?crit :

> For example, I have developed a new scheduler for Linux which is a kernel module.
> If I want to run this scheduler in the Linux kernel on my I.MX28 board, I need to compile this kernel module.
> Do I compile this module on my host machine with (arm-linux-gcc) and then transfer this binary to the board?

You should definitely compile it on your host machine, that's the
easiest solution.

If you have properly use Kbuild for the build system of your module,
you should simply add
ARCH=arm CROSS_COMPILE=/path/to/buildroot/output/host/usr/bin/arm-linux-
to the build arguments.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
