From: Markus Mayer <mmayer@broadcom.com>
Date: Sun, 9 Jul 2017 20:49:27 -0700
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <20170709124124.GC3196@scaer>
References: <20170704235445.35255-1-code@mmayer.net>
 <20170704235445.35255-2-code@mmayer.net>
 <20170705072538.GE3499@scaer> <fc53112d-c7a3-64c9-74ad-277741161711@mind.be>
 <5c9f063f-5b5c-226d-ca25-6bcb8ebf7ced@mind.be>
 <CAGt4E5ueb6x_S4ff=dAeK-x9JnO1SmhnUGz+Q3XKUtj6s24L_Q@mail.gmail.com>
 <CAGt4E5s1qdysaU2dAeYFJL_16PLxwAYWyi6yhiKsRb6wADW-5A@mail.gmail.com>
 <20170709081346.GA3196@scaer> <855c5444-80f0-491b-5d70-aef7cd13b110@mind.be>
 <20170709124124.GC3196@scaer>
Message-ID: <CAGt4E5tgfin2Y9tZTYsJR5XH_WwGGJqsdamiDX9m3HrfZrk13Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9 July 2017 at 05:41, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Arnout, All,
>
> On 2017-07-09 13:10 +0200, Arnout Vandecappelle spake thusly:
>> On 09-07-17 10:13, Yann E. MORIN wrote:
>> > Markus, All,
>> >
>> > On 2017-07-05 10:19 -0700, Markus Mayer spake thusly:
>> > [--SNIP--]
>> >> That said, and while I am a complete buildroot newbie, I do like the
>> >> suggestion of creating sub-directories for the tools and including the
>> >> makefiles from linux-tools.mk rather than relying on alphabetical
>> >> sorting.
>> >
>> > To be sure we're on the same line: one single sub-directory with all tools
>> > in there, not one sub-dir per tool.
>>
>>  Really? One sub-dir per tool would be more in-line with how we handle normal
>> packages.
>
> Well, I would find it a bit over-blown to have many sub-dirs with a
> single file (the .mk) in each.
>
> Unless you also expected that the big Config.in file be split too?
>
> I would argue against, because its fate is already a bit special: it is
> not sourced from package/Config.in but from linux/Config.in. and I would
> prefer we avoid a bit more complexity...

Yeah, I was wondering about that myself, actually. I do agree that
several directories containing only one file each don't seem all that
desirable. I'll see if I can get everything to work with just a single
sub-directory.

Regards,
-Markus
