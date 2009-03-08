From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Sun, 8 Mar 2009 00:02:02 -0300
Subject: [Buildroot] Question about Buildroot concepts and strategies
In-Reply-To: <49B17D64.50707@hq.tensilica.com>
References: <49B17D64.50707@hq.tensilica.com>
Message-ID: <d6cda7730903071902n68cff1fdiaf584d9edf1aff1b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxim,

On Fri, Mar 6, 2009 at 4:45 PM, Maxim Grigoriev <maxim@tensilica.com> wrote:
> Hello Peter and BUILDROOT maintainers,
>
> I understand you are busy individuals, and I'm sorry
> for bothering you. An excuse could be I'm trying to
> understand what BUILDROOT project is all about. Is it
> similar to other open source projects or somewhat different ?

All projects have their particularities. Buildroot for one didn't have
a maintainer for a long time, until Peter stepped up as our fearless
leader :)
We also never had releases until last month, even though many were
already using svn or snapshots.
Many of us use buildroot commercially somehow, some as developers from
board manufacturers like myself, systems integrators, and even a few
from chip manufacturers. Of course, there are hobbyists too. But my
point here is that we usually work each on their respective platforms
under target and we all try to work together with the packages under
packages or the toolchain. This is mainly because developers don't
have every hardware platform each for testings and such, and we don't
like to break other ppl's build.

> Are BUILDROOT maintainers interested in adding new
> architectures to the project ?

Well, as far as I'm concerned, the more the merrier :)

> On March 3d, I tried to start submitting Xtensa BUILDROOT :
>
> http://lists.busybox.net/pipermail/buildroot/2009-March/026260.html
>
> follow-ups :
>
> http://lists.busybox.net/pipermail/buildroot/2009-March/026263.html
> http://lists.busybox.net/pipermail/buildroot/2009-March/026289.html

Sorry about that. Sometimes the list gets too high traffic for some
ppl (me included).
There are times I just mark everything as read, otherwise I would
spend all my working hours reading emails.

The best way to get patches commited is posting them on the
bugtracker. They might go unnoticed for a little while, but they won't
get buried in all the mail.

> Tensilica is eager to become a part of BUILDROOT.
> We made a commitment to support Xtensa BUILDROOT
> and try to do our best to improve generic BUILDROOT.

That would be great. Please try to send smaller patches first. Get
them into small/independent patches, then they will have the highest
chance of being applied.
We don't blindly apply patches, so if something isn't quite
understood, it might require more discussion before someone risk their
neck applying. I think that's the case of your toolchain patches.

I for one don't quite understand it. How does the upstream gcc handle
those "custom instructions"? Do you patch the same file always? Do you
tell configure to add a C file to the build? Do we really need to keep
binary (tgz) files in our repository?

> Does BUILDROOT project has a concept of architecture
> maintainers ? I mean developers with write-access,
> who can check in architecture-specific updates without
> approval and commit generic updates after approval from
> main maintainers.

Not formally, no. Those working with a given arch maintain that. Some
archs got axed recently because there were no one actively using or
maintaining them.
At least in principle, any developer would do that, and add an arch.
But we try to be responsible not to add bloat and to make sure we have
things working before commiting. Buildroot developers had a great deal
of freedom in that regard, this might change in the future though.
With the advent of our first release, we had a feature freeze for the
first time. Right now the window is open for anything, until April or
something.

Kind Regards,
   Thiago A. Correa
