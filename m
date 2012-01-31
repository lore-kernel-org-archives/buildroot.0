From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jan 2012 17:26:06 +0100
Subject: [Buildroot] problem when using build cache ?
In-Reply-To: <9C7AEB06A00A49B5BC4F3D164ABB579E@JohanW7>
References: <9C7AEB06A00A49B5BC4F3D164ABB579E@JohanW7>
Message-ID: <20120131172606.6b123f1d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 31 Jan 2012 17:10:46 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> The udev version in 2011.11 (v1.73) does not  generate the /dev/pts nodes  and as result there is no devpts in the mounts.

I guess you're talking about version 173 of udev, there is no such
thing as 1.73. If you use udev, then your kernel must have
CONFIG_DEVTMPFS and CONFIG_DEVTMPFS_MOUNT enabled. If you let Buildroot
build your kernel, then Buildroot will automatically ensure that your
kernel is configured with those two options enabled. If you build your
kernel manually outside of Buildroot, then you must enable those
options, otherwise udev will not work.

I guess this is where your problem is: check your kernel configuration.

> I noticed udev 1.14 does not build  when the build ccache is ON.

Honestly, we don't really care about udev 114 since the current
Buildroot version contains udev 173, and this one appears to build
properly with ccache enabled.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
