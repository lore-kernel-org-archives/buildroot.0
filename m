From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 14:06:47 +0200
Subject: [Buildroot] Xenomai 3.x
In-Reply-To: <cc87ad05-8a6c-7da9-1071-75cf9bd1c60a@mind.be>
References: <CAH-u=80UriOruAmAcS0uiJfXzEXTB6LeM+OwV9=vB0D7+e3xgw@mail.gmail.com>
 <20161005095532.683204d0@free-electrons.com>
 <CAH-u=818PtBnsOqsUtSvUwACE9S-oxBsR0q+W3oQb7NRLwG2xg@mail.gmail.com>
 <64d74271-3535-198c-3ec5-b7675d031d34@mind.be>
 <CAH-u=81T3HDse2T0kTttcLmXO-OEFs-TifmQHB-DB=-kyBWpCw@mail.gmail.com>
 <CAH-u=83inyC8cYX=ovP839-C0zARrTuvHC_FMG6igHEY8ZUDGw@mail.gmail.com>
 <CAH-u=80w=DhdBd00D=TdQ=GKsh_wjZhJS5dyOokEzOgVoNuOKg@mail.gmail.com>
 <CAH-u=83sffpomqzQbCpBe=iTHA78vyPSj_+-pidpAHQ2u6vZMQ@mail.gmail.com>
 <CAH-u=82g7aXEVbe8zqqKvcR4vEH5HKwvPML+BPy+fk51-6gc3A@mail.gmail.com>
 <CAH-u=81tuHkp93eFtLGGiYQSahGS_GeeZv19SshkB+nT4UPJqA@mail.gmail.com>
 <cc87ad05-8a6c-7da9-1071-75cf9bd1c60a@mind.be>
Message-ID: <20161007140647.71d58b3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Oct 2016 11:01:33 +0200, Arnout Vandecappelle wrote:

>  We want to limit the number of versioned packages to ease maintenance burden.
> And we certainly don't want to carry versions that have no upstream support
> (although again, there are exceptions to this rule).
> 
>  I have taken a quick look to the migration guide. To me it seems that many
> applications will not need any migration at all, and some applications will
> require some names to be changed in their code. Unfortunately in some cases it
> can be somewhat tricky to find out what things have been renamed, e.g. the
> /proc/xenomai files are just strings in your scripts so no compile time errors.
> 
>  So for many users, it is actually easier if it's a simple version bump.
> Introducing a new xenomai3 package would make their life more difficult since
> they have to update their Buildroot configuration to make the switch. Obviously
> that
> 
>  So this is slightly borderline. Since upstream Xenomai 2 gets no "stable
> updates", I tend to prefer to remove it.

Fine with me.

> > Yes and I started to work on this way, but I don't like having too much ifeq()
> > in the source code, blame me :-).  
> 
>  I guess the ifeqs are needed for the Mercury vs Cobalt support, no? For this, I
> agree that it would make sense to make a separate xenomai-mercury package (and
> keep the xenomai package as Cobalt only).

For this, I am not so sure. I dislike when we have multiple packages
that fetch the same source code. We do have this in a few places, but
it's not something that is really great, so I'd prefer to avoid it when
possible. So I'd prefer to have a single Xenomai package that handles
both the Mercury and Cobalt cases.

But of course, we can only judge once we see the actual patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
