From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 21:37:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/syrepo: fix SysV init script
In-Reply-To: <CAEyMn7arhktDMYurpWu-8E=vqFYFvez17sqdAm+m+vC7BkgptA@mail.gmail.com>
References: <20200420095738.16104-1-heiko.thiery@gmail.com>
 <20200425162221.5105443c@windsurf.home>
 <CAEyMn7arhktDMYurpWu-8E=vqFYFvez17sqdAm+m+vC7BkgptA@mail.gmail.com>
Message-ID: <20200425213717.46a38cbf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Apr 2020 17:26:49 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > > The sysrepo-plugind does not support to be controlled via the PID by the
> > > start-stop-daemon. This is because sysrepo-plugind does a fork.
> > > Thus the daemon is running with another PID known by start-stop-daemon.  
> >
> > "known" by start-stop-daemon, or "not known" ?  
> 
> Ok, I was unclear. The PID used by the daemon is another one that the
> start-stop-daemon knows.
> 
> >
> > Also, it is not very clear. Indeed, in the "start" step, you're not
> > asking start-stop-daemon to create a PID file using the -m option. So
> > you're relying on the daemon to create one. Is this PID file incorrect
> > ? Normally, when it is created by the daemon itself, even if the daemon
> > forks, it should be fine.  
> 
> I recognized that and tried to do it that way (with the -m option).
> But in doing so I figured out that the "stop" step does not work. The
> daemon is running by a PID that is +1 compared to the one the
> start-stop-daemon knows from the PIDFILE.

But is sysrepo-plugind creating its own pidfile ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
