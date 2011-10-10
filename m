From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Oct 2011 16:20:16 +0200
Subject: [Buildroot] [RFC] Build time graph generation
In-Reply-To: <CAAXf6LUGVEGBy2hGA8g0_NdqSb72+rOKbnU9x7+rWOoTmV8hvg@mail.gmail.com>
References: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LUGVEGBy2hGA8g0_NdqSb72+rOKbnU9x7+rWOoTmV8hvg@mail.gmail.com>
Message-ID: <20111010162016.55214e4e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Le Mon, 10 Oct 2011 15:55:49 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> > I don't think the modification to the package infrastructure is ready
> > for merging (there are many cases not handled, like when the timing
> > data should be cleaned up, the case of overriden packages not being
> > handled, etc.) and I am not even sure it is useful to complicate the
> > package infrastructure with such a not-so-useful feature.
> 
> I like the idea of having such information, so I'm in favor of these patches.

Thanks :-)

Though I'm still not sure of how they can be useful.

> (The graphs also painfully show the time lost in all ./configure
> steps, while many of the checks are identical...)

In the past, we did try to improve that situation by using the
"configure cache" mechanism, thanks to which configure checks done by
past configure script executions are used to speed up the execution of
future configure scripts (since as you say, they all do mostly the same
checks). Unfortunately, the configure scripts aren't that standardized
and they store the result of different checks in variables of the same
name, resulting to many strange problems. We had this feature enabled
by default in Buildroot for a while (even in stable releases if I'm
correct), but in the end, we dropped it because it was very complicated
to stabilized (we already had to patch multiple configure.{in,ac}
files).

> As I mentioned as comment on your patch, I think we can make this an
> optional feature for those who want it.

Yes, sure.

> Is it possible to have html output as an alternative to pdf? I can
> also imagine that some people simply want image files, like png or
> even svg, so the graphs can easily be embedded in other web pages.

Generating PNG or SVG with matplotlib is definitely possible. I'm not
sure about HTML though, do you mean a webpage that simply includes the
four graphs?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
