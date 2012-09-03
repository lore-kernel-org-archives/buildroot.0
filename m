From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Sep 2012 09:17:06 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-09-01
In-Reply-To: <504319A8.5070903@relinux.de>
References: <20120902063244.629BF428001@lolut.humanoidz.org>
 <504319A8.5070903@relinux.de>
Message-ID: <20120903091706.47c0b600@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 02 Sep 2012 10:32:40 +0200,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> I just started looking at this. The cause of the problem is that the
> tool chain lacks suppot for the "versionsort" routine.
> 
> In uClinux there is a patch adding a versionsort to alsalib locally, but
> this doesn't seem to be a good solution to me, especially since I assume
> that most other toolchains have versionsort so that such a patch would
> breal other architectures.

The configure script can detect whether this function is provided by
the toolchain, and only if not provided, enable the internal version.

> There are also some other patches for alsa-lib that would be needed to
> support blackfin. How shall we handle such architecture dependent patches?

We don't like architecture specific patches. This one for example has
no reason to be architecture-specific, it just needs to be written
properly :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
