From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2011 14:28:20 +0200
Subject: [Buildroot] Some build failures to solve for volunteers
In-Reply-To: <BANLkTinq4Nr71bL3+O+nfUXbYvJzu36GJw@mail.gmail.com>
References: <20110522171916.0ba1bba7@surf>
	<BANLkTinq4Nr71bL3+O+nfUXbYvJzu36GJw@mail.gmail.com>
Message-ID: <20110523142820.14924d4c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2011 14:22:19 +0200
Daniel Nystr?m <daniel.nystrom@timeterminal.se> wrote:

> 2011/5/22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> > I have done a set of test builds, with a random choice of toolchain
> > amongst a set of internal and external toolchains I have and with a
> > random choice of packages. I have fixed some of the issues that
> > occurred multiple times, but there are many remaining issues and I
> > won't have the time to go through all of them.
> 
> Great initiative!

Thanks :-)

> > Unfortunately, some of the builds have been done with external
> > toolchains, and the page above doesn't give details about the custom
> > external toolchains I'm using. But anyway, if people have time to go
> > through some of these failures and contribute fixes, that'd be
> > really great.
> 
> How about setting up a couple of buildbots with different toolchains
> and all options enabled? We can all help running build slaves?

I have no experience with BuildBot, but as far I as could see, BuildBot
is oriented towards building the same software in the same
configuration over and over again, for continuous integration. From
what I could see, it assumes that it has a finite set of build
configurations, and run them all.

Here, what I do is random configuration testing, so there is
potentially an unlimited set of build configurations, and I almost
never test the same configuration again. So it's different from
continuous integration. I don't know if/how BuildBot can handle that
kind of thing.

And finally, my build set up uses some Buildroot internal toolchain or
the CT-NG backend, but also uses a lot of preinstalled external
toolchains. So each BuildBot slave would have to have all those
external toolchains installed for the thing to work.

So, yes, having a BuildBot thing running would be nice, but I don't
know how easy it will be to setup. I know Peter wanted to set up
something like that, but I think he is also doing his randpackageconfig
tests with a custom script.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
