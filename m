From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Thu, 3 Nov 2016 13:41:26 -0400
Subject: [Buildroot] [PATCH 2/2] package/babeltrace: enable debug info
 support for the host variant
In-Reply-To: <20161103092540.29ee969f@free-electrons.com>
References: <20161031074624.7576-10-eeppeliteloop@gmail.com>
 <1477918137-25258-2-git-send-email-yann.morin.1998@free.fr>
 <20161102232930.61516f88@free-electrons.com>
 <CAB4xu_2PJ2gf1+fNhbHvrHKTUeg3H_Lb0ADMrdywxK0tKphgrw@mail.gmail.com>
 <20161103092540.29ee969f@free-electrons.com>
Message-ID: <CAB4xu_2J+49snmBcmSdfCL02qKwmze_-7+T-TaV4Z9XynvzQUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 3, 2016 at 4:25 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 2 Nov 2016 19:07:11 -0400, Philippe Proulx wrote:
>
>> > Since the dependency on elfutils is not mandatory, do we really want to
>> > force building the support of debug info?
>>
>> Ideally, no. I guess we should use the same strategy as for the target package.
>
> Except we don't have Config.in options for host packages, and even if
> we plan to add such options, we clearly don't want to add *visible*
> options for every host package.
>
> So for the host-lttng-babeltrace, the only solution would be to have a
> sub-option to enable debug info support. But that would make it handled
> differently than the debug info dependency for the target
> lttng-babeltrace.
>
> I don't really have a good answer here, I'm afraid.

Debug info suppot is a nice-to-have when you trace instrumented user
applications. It's not the end of the world, IMO, to build host-elfutils
when you need host-lttng-babeltrace anyway... one of the reasons of
having lttng-babeltrace as a host package in the first place is that
some distributions provide an outdated Babeltrace package, and the
recent Babeltrace 1.4 offers this debug info feature.

Phil

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
