From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Apr 2015 20:09:31 -0300
Subject: [Buildroot] Towards 2015.05-rc1
In-Reply-To: <55381E27.4020502@mind.be>
References: <20150419220053.2c1d5b62@free-electrons.com>
 <XnsA481E23CAF8E0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150419230245.64cf1410@free-electrons.com> <55381E27.4020502@mind.be>
Message-ID: <55382A2B.1090108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/2015 07:18 PM, Arnout Vandecappelle wrote:

>  Since udev rules are IMHO a lot more complicated than mdev rules and you
> usually don't need that complexity in embedded systems, I think there really is
> a case to be made for avoiding full udev. Of course, it's always possible to
> remove the udev start script in a post-build script (which effectively makes
> udev dead code), but it is definitely nice to know which packages will work
> without udev running. So that's what I would like this libudev stuff to do.
> 
>  For example, I have one system that used to be based on mdev. Now we have to
> add modem-manager to it, and modem-manager depends on udev. So I've enabled
> udev, but now I have to replace the mdev rules with udev rules and I probably
> also have to get rid of some of the default udev rules which are not appropriate.

There's also usbutils which now requires the udev hwdb and libudev.
I expect to see this kind of requirement for other packages in the
future, the latest pciutils for example benefits with the same trickery,
and though it still works without it i wonder for how long.
Regards.
