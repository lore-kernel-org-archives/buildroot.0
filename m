From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 23:21:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch
 for-2012.08/systemd
In-Reply-To: <cover.1343460025.git.maxime.ripard@free-electrons.com>
References: <cover.1343460025.git.maxime.ripard@free-electrons.com>
Message-ID: <20120730232106.07e25afb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 28 Jul 2012 09:21:19 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> Maxime Ripard (3):
>       Rework of the init system
>       Add systemd unit for lighttpd
>       doc: Update the documentation to mention the new PKG_INSTALL_INIT_ variables

I have applied your changes. I had to make a change on PATCH 1/3,
because the systemd init choice was visible even if the requirements
for the systemd package were not met (thread support and
udev-based /dev).

Also, it would be good to investigate the newer versions of systemd. If
I remember correctly, they integrate udev directly, but is it possible
to still have udev separately? This of course will not be for 2012.08,
but it would be nice to continue to integrate those technologies into
Buildroot.

Also, in the testing I've done with the vexpress Qemu target, I have
not been particularly impressed by the boot speed, but I should
probably try on a real target.

And final comment: it seems lighttpd is started even before the web
server is accessed. Wasn't systemd supposed to start such daemons
on-demand? Or maybe lighttpd does not have the necessary code to
support such kind of startup where the already opened socket is passed
by systemd?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
