From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 8 Nov 2016 06:11:09 -0600
Subject: [Buildroot] Autobuilder issue
In-Reply-To: <20161108094539.6f9b4534@free-electrons.com>
References: <20161108094539.6f9b4534@free-electrons.com>
Message-ID: <CANQCQpbG0=nKggYevXpyJVCT4N48+mKbapb_4oCkJCuSTPbG+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Nov 8, 2016 2:45 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello Matt,
>
> Since yesterday, your autobuilder is behaving strangely, reporting lots
> of "core-dependencies" error due to javac being missing:
>
>   http://autobuild.buildroot.net/?reason=core-dependencies
>
> javac is *NOT* a mandatory dependency in the autobuilder slaves.
> Indeed, the autobuild-run script detects if javac is available or not,
> and if it's not available, it rejects configurations that have
> BR2_NEEDS_HOST_JAVAC=y:
>
>     if "BR2_NEEDS_HOST_JAVAC=y\n" in configlines and not
sysinfo.has("javac"):
>         return False
>
> So the problem your autobuilder instance is reporting should not occur,
> i.e it should not be possible to start the build of a configuration
> that has BR2_NEEDS_HOST_JAVAC=y if javac is not installed. My
> autobuilder instance does *not* have javac installed, and does not
> report those core-dependencies failures.
>
> Did you change anything in your autobuilder instance recently?
I haven't on that instance.

> Installed/removed some packages? Modified the autobuild-run script?
The auto builder script is modified to generate a smaller package set then
the default so that I can use a less powerful machine. My guess would be a
issue with this logic.

>
> Could you have a look at what's going on?
I've stopped that instance until I can look at it tonight.

>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161108/c299626d/attachment.html>
