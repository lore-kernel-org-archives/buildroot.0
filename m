From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 25 Feb 2012 08:35:06 -0600
Subject: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
In-Reply-To: <20120224211027.51454463@skate>
References: <63D6870D443E63419AC4A0C97B86C092030FCA15@MBXCLUSTER.mdh.local>
 <201202241110.06277.minimod@morethan.org> <20120224211027.51454463@skate>
Message-ID: <201202250835.08165.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri February 24 2012, Thomas Petazzoni wrote:
> Le Fri, 24 Feb 2012 11:10:04 -0600,
> "Michael S. Zick" <minimod@morethan.org> a ?crit :
> 
> > A better solution -
> > Put your device to sleep (suspend to ram).
> > It can __resume__ in less than 1 sec.
> > It only needs to __re-boot__ after loss of battery power (rare).
> 
> While this is a great solution, it may not apply to the automotive
> industry: you may want to reduce the power consumption of the device
> down to 0, so that the car battery doesn't empty itself if the car is
> unused during a long period of time. 
>

The O.P. did not state they where using a vacuum tube computer.

The keep-alive current of a modern, silicon, SoC based system is far
less than the self-discharge rate of a lead-acid battery.

Its even less than the capacity change with temperature - presuming the
battery was charged while warm and is now at environment temperature.
(And the charging warmed the battery, even if not exposed to heat sources.)

So I think you are safe to let the vehicle sit - the battery will die
of old age before an i.MX28 system in deep sleep will run it down.

Mike
> I guess in terms of boot time 
> there is no one-size-fits-all solution, the solution very much depends
> on the environment and constraints (hardware, allowed power
> consumption, etc.).
> 
> Best regards,
> 
> Thomas
