From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Jun 2013 19:37:15 +0200
Subject: [Buildroot] [PATCH] gpsd: make init script optional
In-Reply-To: <CAHt8ZCPnR+9SG=rDfyzeLQcbT=UWAwhun4PJ31Ohk=60=0+a7g@mail.gmail.com>
 (Simon Dawson's message of "Sun, 16 Jun 2013 16:59:06 +0100")
References: <1371382468-5838-1-git-send-email-spdawson@gmail.com>
 <20130616130904.GD3495@free.fr>
 <CAHt8ZCPnR+9SG=rDfyzeLQcbT=UWAwhun4PJ31Ohk=60=0+a7g@mail.gmail.com>
Message-ID: <878v2avtx0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

Hi,

 >> Otherwise, please expand on why not wanting the init script should be
 >> configurable at all.

 Simon> There are other possibilities, beyond SysV and systemd: I've
 Simon> previously run gpsd and other managed services using daemontools
 Simon> and runit.

True, but we don't currently have any support for these in buildroot.

 Simon> My present use case has udev kicking off gpsd in response to
 Simon> hotplug events for a USB GPS device.

 Simon> I seem to always end up having to remove the gpsd SysV init
 Simon> script in my post-build script; hence the desire for a
 Simon> configuration option.

Sorry, but it imho doesn't scale to add configuration options for this
kind of stuff for each package.

Realisticly seem, you almost always need to do some minor fixups in
post-build for any real projects.

-- 
Bye, Peter Korsgaard
