From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 22 Jan 2016 20:07:18 -0500
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160122102957.10f29956@free-electrons.com>
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com>
Message-ID: <CA+-urNSqHmvaBWtVmnzb75dBD_Sh7DFnfnX8iO9_a76yOAF6DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Jan 22, 2016 at 4:29 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>>        sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/20cd87c6a05c91ee223b813040d9d10fa923b174/
>
> libatomic_ops not usable. Probably need to disable erlang on Sparc and
> be done with it?

The qemu_sparc64_sun4u_defconfig with Erlang enabled works so I think
that it is just sparc_v8. I saw several comments and Waldemar's patch
concerning atomic_ops support on sparc. I'll hold off sending a patch
for this issue unless directed otherwise.

>
>>       x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/e4ab3fa4a121f7d7edb0263f02aac2ee836905a7/
>
> sys/common/erl_poll.c: In function 'update_pollset':
> sys/common/erl_poll.h:132:5: error: '__uint32_t' undeclared (first use in this function)
>    ((__uint32_t) (EV))
>      ^
> sys/common/erl_poll.c:1150:24: note: in expansion of macro 'ERTS_POLL_EV_E2N'
>      epe_templ.events = ERTS_POLL_EV_E2N(ps->fds_status[fd].events);
>                         ^
> sys/common/erl_poll.h:132:5: note: each undeclared identifier is reported only once for each function it appears in
>    ((__uint32_t) (EV))
>      ^
> sys/common/erl_poll.c:1150:24: note: in expansion of macro 'ERTS_POLL_EV_E2N'
>      epe_templ.events = ERTS_POLL_EV_E2N(ps->fds_status[fd].events);
>                         ^
>
> Musl build issue. Frank, can you have a look at this one ?

Yes. Hopefully there's a patch in Alpine Linux that addresses this.
I'll take a look after I get the other Erlang updates out of the way.

Frank
