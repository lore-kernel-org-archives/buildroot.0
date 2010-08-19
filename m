From: Will Newton <will.newton@gmail.com>
Date: Thu, 19 Aug 2010 10:26:22 +0100
Subject: [Buildroot] package/hotplug
In-Reply-To: <0D753D10438DA54287A00B0270842697643E62F9E6@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697643E62F9E6@AUSP01VMBX24.collaborationhost.net>
Message-ID: <AANLkTimjH2b85z1bjeC+naxRFiMO4+puoLRKJ7B5TZb-@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 19, 2010 at 1:43 AM, H Hartley Sweeten
<hartleys@visionengravers.com> wrote:
> Hello all,
>
> I am trying to get USB memory stick hotplugging to work on my busybox system. ?I
> would like to be able to attach a memory stick and have the system auto mount the
> drive.
>
> I assumed that I would need to enable hotplug package to do this but it is normally
> disabled by BR2_PACKAGE_BUSYBOX_SHOW_OTHERS. ?I have looked thru the busybox
> configuration and can't find anything that would replace the hotplug app. ?Did I
> overlook something?

mdev from busybox should do what you need. You'll need a line like
this in your inittab:

::sysinit:/bin/echo /sbin/mdev > /proc/sys/kernel/hotplug

It's not as flexible as udev, but should do what you need.
