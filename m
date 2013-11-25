From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 25 Nov 2013 16:58:14 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-24
In-Reply-To: <5293D3E9.2090207@mind.be>
References: <20131125073002.2FB821014B4@stock.ovh.net>
 <OF0E9DA113.910F94AB-ON86257C2E.00328BF4-86257C2E.003369F4@rockwellcollins.com>
 <5293D3E9.2090207@mind.be>
Message-ID: <OFCD75EB86.5B7B148B-ON86257C2E.007DEA83-86257C2E.007E2C3E@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Arnout Vandecappelle <arnout@mind.be> wrote on 11/25/2013 04:49:13 PM:

> On 25/11/13 10:21, Ryan Barnett wrote:
> > Thomas P, All,
> >
> > Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on
> > 11/25/2013 01:30:02 AM:
> >
> >  >    powerpc |           host-protobuf-c-0.15 | NOK |
> > 
http://autobuild.buildroot.net/results/10db94f960db6cc8b2fbcafa66aa487fc66f99c6/

> >
> > I looked into this last night and I was unable to reproduce the issue
> > (from pulling the defconfig). From looking at the logs, it appears 
that
> > the issue is that a file wasn't generated before trying to compile the
> > code. In my experience, errors like below are due to the makefile not
> > having their dependencies correct. I tired rebuilding this package 
around
> > 5-7 times and I never ran into this error with the defconfig provided.
> 
>   I have seen exactly the same error before and sent a fix to the list, 
> but I can't find it back... so I guess I must have imagined it.
> 
>   Anyway, there are two solutions: either disable parallel build for 
> protobuf-c, or fix the dependencies. IIRC the problem is actually that 
> the static and shared library are built in parallel with the same object 

> files.

I was going to just make -j1 one this package since I don't have time 
actually fix the problem. I will hopefully get around to submitting a 
patch for this tomorrow.

Thanks,
-Ryan 

[...]
