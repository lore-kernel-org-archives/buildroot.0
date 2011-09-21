From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 21 Sep 2011 15:00:49 +0200
Subject: [Buildroot] User-enabled host packages?
Message-ID: <4E79E001.7010409@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi buildroot developers,

the current policy for host packages is that they do not appear in
menuconfig: they are automatically activated based on the dependencies
whenever thay are needed for building an image.

However, in a recent discussion between me and Thomas Petazzoni
(http://lists.busybox.net/pipermail/buildroot/2011-September/045821.html)
we noticed that some host packages might be worth being available as
user options, even though they are not used to produce any imge.

In the cited thread the following examples emerged:

Luca Ceresoli wrote about omap-u-boot-utils:
 >
 > OTOH, ucmd "sends a command and expects a provided matching response
 > from target", and is aimed at creating automated scripts to interact
 > with a commandline program over a serial line. This can be used in any
 > architecture. I have board-specific scripts that use it to write
 > bootloader + kernel + rootfs onto a new (or bricked) board from files in
 > output/images.
(http://lists.busybox.net/pipermail/buildroot/2011-September/045638.html)

Thomas Petazzoni wrote:
 > I must admit there are other cases for which being able to show host
 > packages to users would be useful. For example, on AT91 platforms,
 > there is an host utility called SAM-BA which allows to reflash an AT91
 > device through the USB device port. This host utility could be
 > conveniently downloaded, extracted and installed into $(HOST_DIR) by
 > Buildroot, but we have currently no way of doing this.
 >
 > Some thing for OpenOCD. Jean-Christophe has recently added support for
 > it for the target, but being able to build OpenOCD on the host and
 > install it in $(HOST_DIR) would also be useful for those of us who want
 > to build ready-to-use development environments with Buildroot.
(http://lists.busybox.net/pipermail/buildroot/2011-September/045821.html)

All of these examples are about tools that could generally be
downloaded, built and installed by each developer on their own machine.
Nevertheless any developer may benefit from having them built inside
buildroot: it would be more handy and quick to build them, and also
guarantee that the version used in buildroot is somehow tested by other
buildroot users.

Moreover, some packages (such as omap-u-boot-utils for which I posted a
patch) have their own right of being inside buildroot because they also
contribute to building the BR images. Having a user option to build
them, even if they are not required for image generation, would require
little effort.

So the big question is: do we want some host packages to be enabled
vie a user option?

Where do we want these user options?
How about a newly created "Host tools" menu at top level?

Does anybody have additional examples in favor or against?

Thanks,
Luca
