From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 27 Jan 2020 16:41:25 +0100
Subject: [Buildroot] Requirements for QML in RPi4
In-Reply-To: <CAPmASevs=kKKCspFM0M_ydbeSzNJLGEEiGmrgb6Ap-RqUtE-Ag@mail.gmail.com>
References: <CAPmASevs=kKKCspFM0M_ydbeSzNJLGEEiGmrgb6Ap-RqUtE-Ag@mail.gmail.com>
Message-ID: <20200127164125.1ec2b7ff@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andrea,

On Mon, 27 Jan 2020 16:01:17 +0100, Andrea Simeoni <andreasimeoni73@gmail.com> wrote:

> After several years I'm going to give another try to Buildroot :-)
> This time I built an environment for RPi4+Qt5.
> Surely I missed some packages because if I try to run a QML application I
> got the following error:
>
> > Could not find DRM device!
> > Aborted
>
> Instead a Qt5 console application seems to run fine.
>
> I attach my .config file. Hope you can give me some hints!

You seem to have a RPi4-64bit config, trying to run
mesa vc4?

Sorry, not owning an RPi4 for testing, but for the RPi3 you
need to enable the right Device-Tree-Overlay in your config.txt,
e.g. (see the following two links for earlier discussion [1], [2]):

dtoverlay=vc4-fkms-v3d

This may or may not work as RPi3 is VC4 and RPi4 is VC6 ([3]),
but Gentoo claims to have RPi4 running with mesa ([4], [5])...

Alternatively your can try RPi4-32bit and enable rpi-userland/BR2_PACKAGE_RPI_USERLAND
instead of mesa...

Regards,
Peter


[1] http://lists.busybox.net/pipermail/buildroot/2019-October/264561.html
[2] http://lists.busybox.net/pipermail/buildroot/2019-November/265133.html
[3] http://lists.busybox.net/pipermail/buildroot/2019-November/265139.html
[4] http://lists.busybox.net/pipermail/buildroot/2019-November/265153.html
[5] https://github.com/sakaki-/gentoo-on-rpi-64bit


> Best regards
> Andrea
