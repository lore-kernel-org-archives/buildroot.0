From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 14 Feb 2017 09:49:09 +0100
Subject: [Buildroot] [PATCH] glmark2: bump version
In-Reply-To: <20170214094436.224c3db8@free-electrons.com>
References: <20170213200619.10535-1-gary.bisson@boundarydevices.com>
 <20170213223900.7167f053@free-electrons.com>
 <CAAMH-yt5ar=Y3zRR-Y3XRMSD-nWXGSfOLbY7WMj_+ZUR1+Eb+w@mail.gmail.com>
 <20170214094436.224c3db8@free-electrons.com>
Message-ID: <CAAMH-yvBA9gpFLNy1Tu+x4A2fFOetdGHgVeLkpnAweBqsUS8iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 14, 2017 at 9:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 14 Feb 2017 09:27:43 +0100, Gary Bisson wrote:
>
>> > Applied to master, thanks. However, I had to add a reference to an
>> > autobuilder issue (after checking that I could reproduce the issue, and
>> > that it was indeed fixed by your patch). Next time, could you make sure
>> > to include a reference to the autobuilder failure being fixed?
>>
>> Sure, I didn't know there was an autobuilder issue about it actually.
>> I just ran into it myself.
>
> Ah, OK.
>
>> BTW, when we have such case, is it possible to drop the faulty
>> defconfig somewhere so the autobuilder can try it later?
>
> Not sure what you mean here. But probably you mean testing a specific
> defconfig with all the configurations tested by the autobuilders. Then
> if that's what you mean, have a look at support/scripts/test-pkg that
> was recently merged. It does exactly that: you provide a config snippet
> that enables a selection of packages, and it will build that selection
> of packages with all toolchain configurations used by the autobuilders.
>
>> Or is the best option is sending it on the ML or on IRC?
>
> There is no way to "inject" a specific package configuration in the
> autobuilders. The autobuilders simply build random selection of
> packages, all day long.

No that is what I meant, "injecting" a defconfig so that a problem
that we see locally can be reproduced by a server and that we know
there will be a trace of that issue somewhere (with all the proper
information).

I understand it would be a mess to maintain such infrastructure, but
at least that would be a go-to response when someone says something is
broken: put your defconfig on the server and we'll see.

Thanks for your feedback.
Gary
