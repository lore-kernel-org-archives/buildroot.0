From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 8 May 2019 11:12:20 +0000
Subject: [Buildroot] [PATCH 01/15] package/glibc/arc: fix build issue
 with gcc-9.1
In-Reply-To: <20190506194049.GA6887@scaer>
References: <20190506183011.4856-1-romain.naour@gmail.com>
 <20190506183011.4856-2-romain.naour@gmail.com> <20190506194049.GA6887@scaer>
Message-ID: <CY4PR1201MB0120841C0FE2B612DCA380BCA1320@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain, Yann, all,

> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@gmail.com> On Behalf Of Yann E. MORIN
> Sent: Monday, May 6, 2019 10:41 PM
> To: Romain Naour <romain.naour@gmail.com>
> Cc: buildroot at buildroot.org; Evgeniy Didin <didin@synopsys.com>; Alexey Brodkin
> <abrodkin@synopsys.com>; Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Subject: Re: [Buildroot] [PATCH 01/15] package/glibc/arc: fix build issue with gcc-9.1
> 
> Romain, All,
> 
> On 2019-05-06 20:29 +0200, Romain Naour spake thusly:
> > Backport from upstream [1] to fix build issue with glibc arc-2018.09-release
> > (based on glibc 2.28) and gcc 9.1 [2]]
> >
> > Using glibc arc-2.29-2019.02.08 or the upcoming arc-2019.03 release include
> > this patch.
> 
> So, here is a small summary of my discussion with Romain on IRC:
> 
>   - this patch touches mostly x86_64 files, so I was puzzled why it had
>     to be applied to the arc fork;
> 
>   - however, that patch also touxphces teo generic headers; in there the
>     new __attribute_copy__() macro is defined *and* used to complement
>     existing attribute-related macros.
> 
> So, it is not much the x86_64 part we're interested in, but the generic
> two headers, which changes percolate to the various functions via the
> various attribute macros...
> 
> So, for other reviewers: just ignore the x86_64 part.
> 
> Romain: what do you think about this: remove those x86_64 files from the
> patch, and update the soh-line as... (see below)

First of all thanks a lot for fixing stuff for ARC.
Also pls pardon my late reply - there were long May holidays Russia
and a lot of people including myself were enjoying anything but work :)

Now given we're about to cut ARC 2019.03 release of our tools which
among other things has Glibc rebased on upstream 2.29 version
this particular fix won't be required at all.

So let us post ARC toolchain bump to 2019.03-RC1 ASAP.

Also with GCC 9.1 out of the door we have pretty much all our changes
right in upstream release tarball so hopefully even ARC fork won't
be that important any longer and we'll try to use upstream
GCC by default.

-Alexey

P.S. Romain I'm really sorry for letting you do that extra yet not very
     useful work!
