From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 13 Nov 2013 14:40:53 +0100
Subject: [Buildroot] [PATCH v8 RESEND 0/8] Add support for top-level
 parallel make
In-Reply-To: <CAHkwnC8UTtDi-ZhSCBWAgviRz-5FOEx2e+GYxKtHzBY6W8pJCw@mail.gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <20131111144953.43bd80b0@skate>
 <CAHkwnC8UTtDi-ZhSCBWAgviRz-5FOEx2e+GYxKtHzBY6W8pJCw@mail.gmail.com>
Message-ID: <CAHkwnC8on+TGbLnx6pyWBUkY785Na03HGof-tv=ZdT=_gM9iag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 12, 2013 at 9:39 AM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> On Mon, Nov 11, 2013 at 2:49 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Fabio, Arnout,
>>
>> On Fri, 18 Oct 2013 11:34:12 +0200, Fabio Porcedda wrote:
>>
>>> this is a patch set for adding support for top-level parallel make in
>>> buildroot, the common problem scattered in buildroot's top-level
>>> makefiles is that in the rules it relies on the order of evaluation of
>>> the prerequisites, to be able to use top-level parallel make instead
>>> of reling on the left to right ordering of evaluation of the
>>> prerequisites we must add an explicit rule to describe the
>>> dependencies.
>>
>> I'd like to agree on a plan with this patch series. At the latest
>> Buildroot Developer Day in Edinburgh, I think we agreed that:
>>
>>  (1) Enabling top-level parallel without having per-package sysroot was
>>      not desirable, as it would make the builds non-reproducible.
>
> What do you think if we provide an easy way to use top-level parallel make
> that warns about the problems:
>
> ifeq ($(P),1)
> $(warning Not reproducible builds use at your own risk!)
> BR2_JLEVEL=
> else
> # This top-level Makefile can *not* be executed in parallel
> .NOTPARALLEL:
> endif
>
>
>   make P=1 -j5
>
>
>>  (2) That being said, Fabio's patches have anyway a merit on their own
>>      since they make things cleaner, and that therefore, patches 1 to 6
>>      can be merged. Maybe patch 7 even if I'm not sure it makes sense
>>      to have it without the top-level parallel build.

The patch 7 make sense only for top-level parallel build but i suggest
to accept it because does not harm the serial building and is needed
for someone that want to try to use top-level parallel make.

>> What do you think?

Is great to have most of the patch accepted, i think it's a step in
the right direction.
I will send the patch set v9 soon.

>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>
>
> Best regards
> --
> Fabio Porcedda


Thanks and best regards
-- 
Fabio Porcedda
