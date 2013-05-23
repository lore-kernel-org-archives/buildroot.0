From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 23 May 2013 15:49:19 +0100
Subject: [Buildroot] Design issue with the out-of-tree support
In-Reply-To: <20130523145354.40106277@skate>
References: <20130523131251.2ffc509f@skate> <519E0EEC.6070402@carallon.com>
 <20130523145354.40106277@skate>
Message-ID: <CAG2jQ8gSWbhti1gvYd_RW1M_L=WJt5xt0cNeOCxCKTBpwMR3jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


> While it solves the problem, the solution seems completely disconnected
> from it. In a few years: "Why the heck do we have host dependencies
> before patch, and other dependencies before configure, instead of
> having all of them together before patch? Ah, yes, because there is
> this crazy specific need for RTAI".

In my opinion, having two kind of dependencies will create headaches
and it will make the current
packaging process more complicated.

>
> So certainly, what you're proposing solves the problem, it just doesn't
> really feel like a nice and clean solution. I know it's a very
> subjective opinion I'm giving here, so if others do agree with that
> proposal, I'll be fine with it, but I'd be interested in hearing the
> ideas and opinions of others to see if we can come up with something
> cleaner.
>

Like you said in your first e-mail, I am in favor of this approach:

 * Make $(1)-patch depend on all dependencies. This will break RTAI, so
   we can exclude 'linux' for the list of $(1)-patch dependencies. So
   something like:

   $(1)-patch: $(filter-out linux,$$($(2)_DEPENDENCIES))
                ...

   $(1)-configure: $(filter linux,$$($(2)_DEPENDENCIES))

--
Regards,
Markos Chandras
