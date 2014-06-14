From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 10:01:07 +0200
Subject: [Buildroot] [PATCH 0/20 v2 RFC] Introduce libudev (branch
 yem/libudev)
In-Reply-To: <cover.1402699915.git.yann.morin.1998@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <20140614100107.20b3c3be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Bernd,

On Sat, 14 Jun 2014 01:02:39 +0200, Yann E. MORIN wrote:

> Big fat warning: this is only an RFC for now!
> 
> This series introduces the possibility to just build and install libudev,
> without requiring that the /dev management be handled by eudev or systemd.
> 
> A lot of packages that have a dependency on udev, in fact only require a
> libudev, not anudev daemon. That's the case for e.g. libinput, libcec,
> mesa3d...

To be honest, I am far from being a udev expert, but I have a question
about the rationale behind a libudev-only configuration.

I thought that udev was a daemon running in the background, receiving
events from the kernel through a netlink socket when devices
appear/disappear, and then keeping a sort of "database" of available
devices. On top of that, libudev was a client library that allows
application to talk to the udev daemon to query which devices are
available/not available and their characteristics. With this picture in
mind, I fail to see how libudev can be useful with the udev daemon. So
surely, my picture of how udev works is broken, but I'd be interested
in hearing more on how libudev without the udev daemon can be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
