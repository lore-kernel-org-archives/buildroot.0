From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 21:09:33 +0200
Subject: [Buildroot] [PATCH] ola: Add patch to fix linking issue
In-Reply-To: <CAFXXi0=tRTD13CMOZ7Y7j1+5VLq6Q54s3pWtgecqDTSKQ-JY4w@mail.gmail.com>
References: <1438748380-5528-1-git-send-email-simon.marchi@polymtl.ca>
 <20150808124445.79092e05@free-electrons.com>
 <CAFXXi0mu73=5UC6=n60uNZd=eUb16ns6vtxMH756MGuTDRhvFg@mail.gmail.com>
 <20150810144403.08c28fb4@free-electrons.com>
 <CAFXXi0=tRTD13CMOZ7Y7j1+5VLq6Q54s3pWtgecqDTSKQ-JY4w@mail.gmail.com>
Message-ID: <20150810210933.4ab5e7d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Marchi,

On Mon, 10 Aug 2015 13:45:31 -0400, Simon Marchi wrote:

> >> I discussed it a bit on their IRC channel, it seems like the right fix
> >> will be to move the implementations to the .cpp files.
> >>
> >> I filed a bug: https://github.com/OpenLightingProject/ola/issues/880
> >
> > Shouldn't we simply remove -fvisibility-inlines-hidden ?
> 
> Do you mean remove it as a patch in the buildroot package, or upstream?

I was thinking in the Buildroot package for now, while the discussion
with upstream is on-going.

> I asked in the bug report if removing the switch upstream would be a
> possibility, how much impact it has on runtime performance (startup
> time).

Yep, seen that, that's good.

> As an immediate fix, the patch I sent works. Although it only moves
> the problematic method. It would be possible for another method to
> break with another combination of compiler/platform.
> 
> Removing the switch for the buildroot package would probably work as
> well (I am testing right now) and would prevent other similar breaks.
> Would you like me to send a patch immediately that does that instead?

To be honest, I really don't know what is the best between changing the
method implementation, or removing the switch. Just let me know which
you think is the best workaround for now, until upstream solves the
problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
