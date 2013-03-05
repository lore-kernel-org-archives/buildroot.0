From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Mar 2013 19:19:10 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <20130305105315.87f8750467e5901e0c0a26e0@kinali.ch>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
 <20130304204731.3134cc5b569baf8ffeb5d3b0@kinali.ch>
 <20130304211743.7ff322e9@skate>
 <20130305105315.87f8750467e5901e0c0a26e0@kinali.ch>
Message-ID: <20130305191910.5d570f56@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Attila Kinali,

On Tue, 5 Mar 2013 10:53:15 +0100, Attila Kinali wrote:

> > Why the heck would people caring about every KB use udev in the first
> > place? Once again, we already have static /dev, devtmpfs and mdev
> > support, and those are *way* more lightweight than udev.
> 
> Ok, i might have exagerated. But still, systemd is a lot more heavyweight
> than standard sysV init. Not to talk about the added complexity that
> has very little benefit, especialy for embedded systems.

Indeed, but where have you read that we will force people to use
systemd?

Busybox init will remain the default init system, like it has always
been in Buildroot. SysV init will remain an option (so I don't really
understand what it really provides in terms of useful features of
Busybox init, but that's a different question).

Only people who *really* want to use udev and nothing else would have
to use systemd.

> > > So, to come back to the original issue, i would say just freeze the current
> > > version and wait a couple of months until it either becomes clear what will
> > > happen or incompatibilites force you to upgrade.
> > 
> > Our udev version is 182, released March 2012, almost a year ago.
> > Our systemd version is 44, released March 2012, almost a year ago.
> > 
> > I think we've already waited 12 months. Isn't that enough?
> 
> Uhmm.. oh..kay... 
> 
> I don't know, 1 year is a damn long time in opensource. And yes,
> I agree that there should be an update soonish. But forcing people
> to either use an old Buildroot release or to swallow systemd isn't
> a very nice prospect either. 

Where the heck have you read that we will force people to use systemd.

We currently support three init systems:

 * Busybox init
 * SysV init
 * systemd

And four /dev management methods:

 * static
 * devtmpfs only
 * devtmpfs + mdev
 * devtmpfs + udev

The *ONLY* change we're talking about here is to change the four /dev
management methods to:

 * static
 * devtmpfs only
 * devtmpfs + mdev
 * devtmpfs + udev, depends on init system == systemd

So besides the people who would want to use udev, all the other
options/combinations would still be available. You will still be able
to do Busybox init + static, or SysV init + devtmpfs, or whatever
combination, *EXCEPT* udev without systemd.

Why is it that as soon as systemd starts being discussed, people have
the feeling that the entire world is blowing up?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
