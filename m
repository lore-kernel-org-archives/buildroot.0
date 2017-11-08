From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Nov 2017 18:33:46 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <CANQCQpY2fsEJkaU1-0_Sg+Mqb3sH_m_TLxUPCAT6DRRUwWVgsg@mail.gmail.com>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <CAJtjsKZ-OFFehKRd-XD79XobUnUqGpFqRcXL4P1d-cqaFHoKmg@mail.gmail.com>
 <CANQCQpY2fsEJkaU1-0_Sg+Mqb3sH_m_TLxUPCAT6DRRUwWVgsg@mail.gmail.com>
Message-ID: <20171108173346.GB4602@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, Johan, All,

On 2017-11-08 10:16 -0600, Matthew Weber spake thusly:
> On Wed, Nov 8, 2017 at 6:49 AM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> > Hi Thomas, all,
> >
> > On Tue, Oct 31, 2017 at 11:05 PM, Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com> wrote:
> >>
> >>>          arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/6c4c7b3094bd48a72786f5be3d760f0356557403 |
> >>>          arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/a17d5eb1aac01dab19412aa28d523625577730db |
> >>
> >> The infamous ./bootstrap issue that consumes 100% of the CPU before
> >> timing out the build job. Johan, we really need to find a solution to
> >> this problem. How can we proceed to debug this?
> >>
> >
> > The bootstrap file is an erlang script:
> > #!/usr/bin/env escript
> >
> > When trying to reproduce this bug, I see it prints "No beam files
> > found". As this message is printed quite early in this script, I guess
> > the problem is in loading escript from the host. Unfortunately, I
> > wasn't able to reproduce this bug on my machine, so this is only a
> > guess.
> > Is it possible to execute ./bootstrap --help from this machine? If the
> > problem is in loading escript, it should lead to the same timeout
> > error.
> >
> 
> I ran the same build on that machine ( make clean host-erlang-rebar ).
> It ran without error and printed the following early in the build
> step.

We've already concluded that this error does not always happen,
unfortunately. IIRC, it however happenned on almost all the
autobuilders, so it probably is not related to the host machine.

Thomas and I tried to reproduce on our respective autobuilders, to no
avail... IIRC, I even had a loop that ran more than 100 times.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
