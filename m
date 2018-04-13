From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 13 Apr 2018 09:53:37 +0200
Subject: [Buildroot] [PATCH 1/1] tcf-agent: bump to version 1.7.0
In-Reply-To: <CADYdroOdnrNUCvq+Yd95rkwO0BCioby19QGGb0cU++Ja8Nc3gA@mail.gmail.com>
References: <20180412151310.15252-1-eugene@largest.net>
 <20180412234935.3ae48694@windsurf>
 <ece5ee53-47f3-f446-f0b8-ce3b6cfc2975@largest.net>
 <CADYdroOdnrNUCvq+Yd95rkwO0BCioby19QGGb0cU++Ja8Nc3gA@mail.gmail.com>
Message-ID: <CADYdroMF8T2-9=AYrb6-CxnWkX4jHzYQ4KMP0mUKjazNZzfoLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and just to clean this up:

adding your email to the DEVELOPERS file,
will mean that you are getting contacted on failures on the automated build,
and if someone adds patches that modify those sources.
https://buildroot.org/downloads/manual/manual.html#DEVELOPERS

Norbert

2018-04-13 9:50 GMT+02:00 Norbert Lange <nolange79@gmail.com>:
> Hello,
>
> there seems to be a misunderstanding, I probably should have refered
> to the patch directly.
>
> @Thomas: Part of the discussion resides in
> https://bugs.eclipse.org/bugs/show_bug.cgi?id=529417,
> Eugene is the the maintainer of tcf-agent and I advised him to put his
> mail in DEVELOPERS,
> as otherwise I have to piggyback issues and fixes around projects.
> Also there are apparently multiple (closed source) projects using
> tcf-agent, so a my fixes for linux
> might break other stuff.
>
> I switched from CMake to regular Makefiles for the same reason, the
> later is better supported upstream,
> and support detecting headers/functions/libraries from the system.
> Getting CMake to parity would be alot
> work.
>
> @Eugene: buildroot allows static linking, which can come handy for
> stuff like initial ramdisks which only need a
> small set of tools (eg. only busybox without any libraries)
>
> I will try to respond to Thomas' requests for the patch this weekend,
> but can you look at the empty ranlib call?
> My solution would be to set the makerule to
>
> $(BINDIR)/libtcf$(EXTLIB) : $(OFILES)
>     $(AR) $(AR_FLAGS) $(AR_OUT_F)$@ $^
>     $(RANLIB) $@
>
> (and fixup the variable definitions in Makefile.inc)
>
> Norbert
>
> 2018-04-13 3:50 GMT+02:00 Evgueni Tarassov <eugene@largest.net>:
>> Hi Thomas,
>>
>> I was not aware Norbert had already sent a patch.
>>
>> His patch appears to make other changes in addition to selecting newer
>> version, like switching to make from cmake, some changes from after 1.7.0,
>> and support for static linking.
>> My goal was less ambitious: just version up to 1.7.0 - for now, and delete
>> old patches - they are not needed anymore because of upstream fixes.
>> I'm new to Buildroot. So far, I don't even understand the need to switch to
>> make or to support static linking of tcf-agent.
>> Anyway, I, personally, would prefer to handle tcf-agent issues upstream,
>> through eclipse.org, without having patches in the Buildroot package.
>>
>> Regards,
>> Eugene
>>
>>
>> On 4/12/2018 2:49 PM, Thomas Petazzoni wrote:
>>>
>>> Hello,
>>>
>>> On Thu, 12 Apr 2018 08:13:10 -0700, Eugene Tarassov wrote:
>>>>
>>>> Build issues with MicroBlaze and PPC64 targets are fixed
>>>>
>>>> Signed-off-by: Eugene Tarassov <eugene@largest.net>
>>>
>>> Thanks Eugene for this patch. However, Norbert had already sent a patch
>>> to bump to 1.7.0, and his patch raised a number of questions that
>>> haven't been answered:
>>>
>>>    http://patchwork.ozlabs.org/patch/880414/
>>>
>>> In particular, Norbert submission was adding two patches to fix build
>>> issues, and doing a lot more changes in tcf-agent.mk. I'm wondering why
>>> your patch is so different, and doesn't include Norbert changes.
>>>
>>> Thanks,
>>>
>>> Thomas
>>
>>
