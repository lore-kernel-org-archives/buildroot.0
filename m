From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 28 Sep 2011 10:57:02 +0200
Subject: [Buildroot] Segmentation faults after gcc update
In-Reply-To: <20110927233506.55cb52a2@skate>
References: <1317110841.20688.12.camel@sven> <20110927233506.55cb52a2@skate>
Message-ID: <1317200412.1920.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2011-09-27 at 23:35 +0200, Thomas Petazzoni wrote:
> Le Tue, 27 Sep 2011 10:04:12 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> > we are using buildroot successfully for quite a while now and after
> > I've recently managed to bring our buildroot environment up-to-date
> > with current git, I've changed the gcc version from 4.3.6 to 4.6.1.
> > That was the only change to the config. The resulting image boots and
> > some services (syslogd, klogd, udevd, sshd) are up and running. I can
> > log into the system and the busybox tools I tried to far seem to work
> > fine. However lots of applications that used to run fine now
> > immidiately die with a segmentation fault:
> > 
> > # dbus-daemon 
> > Segmentation fault
> > 
> > # uuidgen
> > Segmentation fault
> > 
> > # sqlite3
> > Segmentation fault
> > 
> > # iperf
> > Segmentation fault
> > 
> > What could possibly be wrong here? Is there anything else I need to
> > change when changing the version of gcc?
> 
> Hum, odd. Some questions:
> 
>  * Do you have the same version of uClibc in both cases ?

Yes. Both use 0.9.32 with NPTL as thread library implementation. As I
said already, the gcc version was the only thing that changed.

>  * Is your Busybox (which works) statically linked or dynamically
>    linked ? If statically linked, is the problem that all dynamically
>    linked binaries are non working (which would indicate a bug in the
>    dynamic linker) ? If not, is there anything common between all the
>    non-working binaries ?

busybox is linked dynamically. As far as I can tell all the problematic
binaries make use of threads, but I haven't completely verified this
yet.


Thanks,
Sven
