From: Christopher Taylor <chtaylo3@gmail.com>
Date: Wed, 6 Aug 2008 23:26:18 -0400
Subject: [Buildroot] efficient usb plug in notification
In-Reply-To: <64180.1218043142@speakeasy.net>
References: <64180.1218043142@speakeasy.net>
Message-ID: <2590773a0808062026p25ed61c7v23377da3849ad661@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> You can replace /sbin/hotplug with a shell script/program of your choice.
> This gets called by the kernel for every plug event. Just have your version
> of hotplug react to the plug events you care about. Then you "just" need to
> figure out how to interact between the hotplug script and your user space
> libraries, programs, etc.
>

Given the power concerns that we have, this may be the best idea.
I'll have to look into what's passed to the hotplug script/program and
see if we can get all the information from that.  Thanx so much for
this tip!

I'm moderately familiar with udev/dbus/hal but I have some
reservations about using them due to the extra cycles taken up.

This hotplyg approach seems promising for power conscious platforms
assuming it provides enough information.   A named pipe to our
application should solve this problem.

Thanx everyone for sharing your experience!

-Chris
