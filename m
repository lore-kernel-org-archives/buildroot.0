From: Jean-Michel Hautbois <jean-michel.hautbois@veo-labs.com>
Date: Fri, 7 Oct 2016 10:03:40 +0200
Subject: [Buildroot] Xenomai 3.x
In-Reply-To: <cc87ad05-8a6c-7da9-1071-75cf9bd1c60a@mind.be>
References: <CAH-u=80UriOruAmAcS0uiJfXzEXTB6LeM+OwV9=vB0D7+e3xgw@mail.gmail.com>
 <20161005095532.683204d0@free-electrons.com>
 <CAH-u=818PtBnsOqsUtSvUwACE9S-oxBsR0q+W3oQb7NRLwG2xg@mail.gmail.com>
 <64d74271-3535-198c-3ec5-b7675d031d34@mind.be>
 <CAH-u=81T3HDse2T0kTttcLmXO-OEFs-TifmQHB-DB=-kyBWpCw@mail.gmail.com>
 <CAH-u=83inyC8cYX=ovP839-C0zARrTuvHC_FMG6igHEY8ZUDGw@mail.gmail.com>
 <CAH-u=80w=DhdBd00D=TdQ=GKsh_wjZhJS5dyOokEzOgVoNuOKg@mail.gmail.com>
 <CAH-u=83sffpomqzQbCpBe=iTHA78vyPSj_+-pidpAHQ2u6vZMQ@mail.gmail.com>
 <CAH-u=82g7aXEVbe8zqqKvcR4vEH5HKwvPML+BPy+fk51-6gc3A@mail.gmail.com>
 <CAH-u=81tuHkp93eFtLGGiYQSahGS_GeeZv19SshkB+nT4UPJqA@mail.gmail.com>
 <cc87ad05-8a6c-7da9-1071-75cf9bd1c60a@mind.be>
Message-ID: <CAH-u=812totBSuJ-so=fZiVJ2_qic4Bsw4fjRurM5MHE7jMUtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-10-06 11:01 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>  Thomas, Peter, do you agree with what I write below?
>
>
> On 06-10-16 07:34, Jean-Michel Hautbois wrote:
>> Hi Arnout,
>>
>> Le 6 oct. 2016 00:54, "Arnout Vandecappelle" <arnout@mind.be
>> <mailto:arnout@mind.be>> a ?crit :
>>>
>>>
>>>
>>> On 05-10-16 10:30, Jean-Michel Hautbois wrote:
>>> > Hi Thomas,
>>> >
>>> > 2016-10-05 9:55 GMT+02:00 Thomas Petazzoni
>>> > <thomas.petazzoni@free-electrons.com
>> <mailto:thomas.petazzoni@free-electrons.com>>:
> [snip]
>
>>> >> So patches are definitely welcome. It's not clear to me whether we want
>>> >> to support both Xenomai 2.x and Xenomai 3.x, or if supporting Xenomai
>>> >> 3.x is sufficient, as a replacement for Xeonmai 2.x.
>>> >
>>> > Well, yes, it is not clear for me either.
>>> > I am not sure that it has to be compiled the same way.
>>> > Well, if I have anything I can show, I will ask for advices.
>>>
>>>  AFAIK the Xenomai 3 API should be fully backward compatible with Xenomai 2, so
>>> I see no reason to support both. I'd just "bump" Xenomai.
>>
>> Well I am not so sure about that, there is a complete migration guide and some
>> applications may need some modifications to work correctly with Xenomai 3. And
>> there is another reason I would not bump to 3.x instead of making a different
>> package : some people may want to stay on the 2.6 branch (which is now 2.6.5)
>> which is a EOL tree but still, some people may not want to bump to 3.x as they
>> may have a lot of their system depending on Xenomai 2.6.
>
>  For most packages (libraries), we do bumps even if there are API changes. But
> admittedly most libraries are not user-facing, i.e. they are only used by other
> packages in buildroot and not by user application code.
>
>  We want to limit the number of versioned packages to ease maintenance burden.
> And we certainly don't want to carry versions that have no upstream support
> (although again, there are exceptions to this rule).
>
>  I have taken a quick look to the migration guide. To me it seems that many
> applications will not need any migration at all, and some applications will
> require some names to be changed in their code. Unfortunately in some cases it
> can be somewhat tricky to find out what things have been renamed, e.g. the
> /proc/xenomai files are just strings in your scripts so no compile time errors.
>
>  So for many users, it is actually easier if it's a simple version bump.
> Introducing a new xenomai3 package would make their life more difficult since
> they have to update their Buildroot configuration to make the switch. Obviously
> that
>
>  So this is slightly borderline. Since upstream Xenomai 2 gets no "stable
> updates", I tend to prefer to remove it.
>

OK, I agree with you.

>>>  A first patch would do a bump with just Cobalt, which is more or less what we
>>> have now. A second patch would add the option to use Mercury instead of Cobalt.
>>>
>>>  This is also the feedback I gave in the thread that you refer to.
>>
>> Yes and I started to work on this way, but I don't like having too much ifeq()
>> in the source code, blame me :-).
>
>  I guess the ifeqs are needed for the Mercury vs Cobalt support, no? For this, I
> agree that it would make sense to make a separate xenomai-mercury package (and
> keep the xenomai package as Cobalt only).
>
>
>> I am open to all suggestions but please note I will not test Cobalt as I don't
>> have a kernel to do so (and no time for it) so the patch proposal will be a RFC
>> for starting.
>
>  In that case, to make your life easier, you may want to just create a
> xenomai-mercury package and leave the xenomai package alone. Someone else can
> pick up the xenomai3 Cobalt support later.

OK, I think it is a good idea.

Thanks,
JM
