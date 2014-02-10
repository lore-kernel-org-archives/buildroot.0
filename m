From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 09:38:47 +0100
Subject: [Buildroot] Antw: build speedup possible?
In-Reply-To: <CAHkwnC9Ayss7OYdSTbSp07LKy0GQ801TCdgxiVSNPpKew8i0OQ@mail.gmail.com>
References: <52F49E9D.2020506@andin.de>
 <52F4AEC7020000460004A4EE@gwia2.rz.hs-offenburg.de>
 <CAHXCMMJD_i9aQtFkxWD_tPbpdJd_-Gv_zkC0KxnEtRoQO=7Vug@mail.gmail.com>
 <CAHkwnC_B8RRAXBOGjjpr2X7CbZpVTnsDx8QoLEPfaieEoSd4gA@mail.gmail.com>
 <20140207162934.01acfe5a@skate>
 <CAHkwnC-pAGs0DCu80X3_AQgrsxcOO82GMY7NwmegxT6V0_kwJw@mail.gmail.com>
 <20140207174355.383b6bb3@skate>
 <CAHkwnC9Ayss7OYdSTbSp07LKy0GQ801TCdgxiVSNPpKew8i0OQ@mail.gmail.com>
Message-ID: <20140210093847.6913b9b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 7 Feb 2014 19:05:34 +0100, Fabio Porcedda wrote:

> > I don't really see how to reproduce the exact build order, so the
> > support problem will be here. That's really why I have been a bit
> > skeptical and resistant to this patch series from the very beginning. I
> > am obviously very interested in ways to reduce the build time. But
> > doing that at the expense of reliability is not a good idea in my
> > opinion, as users will face spurious failures that we will not be able
> > to reproduce and fix.
> 
> About the spurious failures when building packages in parallel  IMHO
> they depends only on the building order of the finished steps.
> If a build fails IMHO it depends on something that is not available so
> those failures can be reproduced considering only the finished steps
> and ignoring the overlapping unfinished steps.
> What do you think about that?

Of course even with parallel build it is *possible* to understand what
happened. But it is much more complicated because we cannot simply take
the user .config file, replay the build, and reproduce the issue. We
would need to have access to the user's complete build log to see in
which order things happened, and from this get an understanding of what
the issue could be. And the thing is that 99% of the time, users do not
save their build log into a file, so when they come on
IRC/bugtracker/mailing list for support, they only have the last few
lines of build output.

We're not talking about theory here, but practice. In theory, all
parallel build problems can be solved. In practice, it will make
supporting users much more complicated, as we will not be able to
reproduce their builds, and we won't have enough informations about the
order in which things happened.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
