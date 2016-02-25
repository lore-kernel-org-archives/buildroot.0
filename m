From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 25 Feb 2016 08:42:53 +0100
Subject: [Buildroot] [PATCH v3] package/mono: Fixing wrong
	MonoPosixHelper location
In-Reply-To: <56CE381F.503@mind.be>
References: <1456264228-19851-1-git-send-email-angelo.compagnucci@gmail.com>
 <56CCDAD8.5070904@mind.be>
 <CA+TH9VnvmxhZtx9aM0C0CCXo4duH-Y9kQ6yM5Tpia1YWpY8D4g@mail.gmail.com>
 <56CE13E3.8050603@mind.be>
 <CA+TH9VkDB+PuPwp3RDOcC8Th=vRF+hYUBLZkdycnJ5hVEBnzqw@mail.gmail.com>
 <56CE381F.503@mind.be>
Message-ID: <CA+TH9V=u5Qrjddh4UeWV5nKLmhu42hdKwXf0G7_gL3LJ6HWH+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Dear Arnout Vandecappelle,

2016-02-25 0:09 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
> On 02/24/16 21:46, Angelo Compagnucci wrote:
>> Dear Arnout Vandecappelle,
>>
>> 2016-02-24 21:34 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>>> On 02/23/16 23:29, Angelo Compagnucci wrote:
>>>> Dear Arnout Vandecappelle,
>>>>
>>>> 2016-02-23 23:19 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>>>>> On 02/23/16 22:50, Angelo Compagnucci wrote:
>>>>>> * This patch solves installation problems with monoposixhelper
>>>>>
>>>>>  This description should be better, e.g. taking part of the bug description.
>>>>>
>>>>> libMonoPosixHelper.so will be searched in the HOST_DIR/usr/lib/ path. This path
>>>>> and file may exist on my building machine, but not on the target.
>>>>>
>>>>> Fixes bug #8651.
>>>>
>>>> Have I to resend?
>>>
>>>  Depends on the outcome of the discussion below.
> [snip]
>> I can assure the patch I submitted solves the problem. In mono
>> upstream, developers did a refactor of that part and the patch I
>> previously sent (for master) is simply wrong, cause the refactor
>> already solves the problem. Indeed I closed the issue on mono github.
>>
>> As you said previously, mono has a really slow release process, with
>> many months of delay, so I think we should stick with this latter
>> patch I sent.
>>
>> When the new release 4.3.X will be out, I will promptly bump to that
>> version and remove the unneeded patch.
>
>  OK, so:
> - mono master is working;
> - backporting the upstream patch is a bit of work;
> - this simpler patch also works for us
>
>  Therefore:
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> with the improved commit message mentioned above. Angelo, if you have a bit of
> time, please do resend with the improved commit message and my ack.

I will do as soon as possibile. A very big and sincere thank you for
the great review.

>  As an aside, I searched for host-path references in the build result, and there
> still is one in
> /usr/lib/mono/gac/monodoc/1.0.0.0__0738eb9f132ed756/monodoc.dll.config
> Care to take a look at that?

Sure!


Sincerely, Angelo

>
>  Regards,
>  Arnout
>
>>
>> Sincerely, Angelo
>>
>>>
>>>  Regards,
>>>  Arnout
>>>
>>> [snip]
>>>
>>> --
>>> Arnout Vandecappelle                          arnout at mind be
>>> Senior Embedded Software Architect            +32-16-286500
>>> Essensium/Mind                                http://www.mind.be
>>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>>
>>
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
