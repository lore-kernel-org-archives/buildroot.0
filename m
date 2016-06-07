From: Andrew Webster <Awebster@arcx.com>
Date: Tue, 7 Jun 2016 20:10:26 +0000
Subject: [Buildroot] [PATCH v6 3/3] docker-engine: new package
In-Reply-To: <20160607215439.76ad85ee@free-electrons.com>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-4-git-send-email-christian@paral.in>
 <f27fd228ed034bc499fe1c69ac9a3980@WEBMAIL.arcx.com>
 <20160607215439.76ad85ee@free-electrons.com>
Message-ID: <fd0a492f8e79400082191141e79f9ca0@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Tuesday, June 07, 2016 3:55 PM
 
> Thanks for your feedback. However, it'd be nice if you could configure your e-mail client to wrap lines at a reasonable length.

Sorry, I just noticed that.  It's also mangling some of the incoming text as well.  I'll try and figure that out.

> > On a similar topic, docker expects a bunch of cgroup mounts to exist
> > somewhere on the system.  Is this something that should be left up to
> > the rootfs author (in which case maybe the help could be extended to
> > explain this), or should the docker-engine recipe attempt to modify
> > fstab somehow?  I'm not sure if there is a way to actually do that
> > though.
> 
> The Buildroot philosophy is in general that things should work at least in a minimal way "out of the box". So if cgroup mounts are
> needed for Docker, they should be done in Docker's init script.

Ahh, right.  I missed that part when I made my custom init.  The debian/redhat versions do attempt to do this.
