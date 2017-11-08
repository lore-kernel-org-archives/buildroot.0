From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 8 Nov 2017 13:49:01 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171031230519.3feb2619@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
Message-ID: <CAJtjsKZ-OFFehKRd-XD79XobUnUqGpFqRcXL4P1d-cqaFHoKmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Tue, Oct 31, 2017 at 11:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
>>          arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/6c4c7b3094bd48a72786f5be3d760f0356557403 |
>>          arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/a17d5eb1aac01dab19412aa28d523625577730db |
>
> The infamous ./bootstrap issue that consumes 100% of the CPU before
> timing out the build job. Johan, we really need to find a solution to
> this problem. How can we proceed to debug this?
>

The bootstrap file is an erlang script:
#!/usr/bin/env escript

When trying to reproduce this bug, I see it prints "No beam files
found". As this message is printed quite early in this script, I guess
the problem is in loading escript from the host. Unfortunately, I
wasn't able to reproduce this bug on my machine, so this is only a
guess.
Is it possible to execute ./bootstrap --help from this machine? If the
problem is in loading escript, it should lead to the same timeout
error.

By the way, it looks like rebar build tool is moving to rebar3. I'm
afraid we may have to support both until all erlang projects have
moved to rebar3 :-(
-- 
Johan
