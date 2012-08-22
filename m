From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 20:06:15 +0200
Subject: [Buildroot] [PATCH] gpsd: fix Python-related build failure
In-Reply-To: <CAHt8ZCPRsyLfCKQfOfa5LQ3qeX22_3UgLJAXH0YfeGSb1sQ8-A@mail.gmail.com>
References: <1345548715-16593-1-git-send-email-spdawson@gmail.com>
 <5034933C.8040005@free-electrons.com>
 <CAHt8ZCPRsyLfCKQfOfa5LQ3qeX22_3UgLJAXH0YfeGSb1sQ8-A@mail.gmail.com>
Message-ID: <20120822200615.42118e87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 09:26:06 +0100,
Simon Dawson <spdawson@gmail.com> a ?crit :

> > I guess the real problem that we have to address here is why scons uses
> > the interpreter from the distribution and not the buildroot-generated one.
> >
> > I guess, we could just make scons depends on host-python and force the
> > $(SCONS) variable as "$(HOST_DIR)/usr/bin/python
> > $(HOST_DIR)/usr/bin/scons ?"
> 
> This sounds to me like a good idea. I had tried to avoid the
> host-python dependency, which was in fact present in an earlier
> incarnation of the gpsd version bump patch. But it looks like it might
> be the cleanest way of resolving the present issue.

If we could avoid the host-python dependency, it would be great. My
understanding is that the SConstruct needs JSON just to generate one
file. Maybe we could simply integrate a pre-generated version as a
patch. But maybe it's too hackish, and we should just go ahead and add
host-python as a dependency of scons, so that a well-known version of
Python gets built.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
