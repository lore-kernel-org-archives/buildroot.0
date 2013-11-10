From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Sun, 10 Nov 2013 18:05:12 +0100
Subject: [Buildroot] [PATCH 1/1] Generation of locales: made call to tr
 more robust
In-Reply-To: <CAAXf6LVpmji=fgU2Qj7BZLp8MV87oFjcnjDENPt1BNm=ps2fTg@mail.gmail.com>
References: <1383927916-27001-1-git-send-email-thierry.bultel@wanadoo.fr>
 <c8339166-9470-405a-ad3f-6f8b4a6e6159@email.android.com>
 <527F56D9.8060809@wanadoo.fr>
 <ca01f976-f93a-496a-9b4b-9b02c81c940a@email.android.com>
 <527FB10C.603@mind.be>
 <CAAXf6LVpmji=fgU2Qj7BZLp8MV87oFjcnjDENPt1BNm=ps2fTg@mail.gmail.com>
Message-ID: <527FBCC8.3030501@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 10/11/2013 18:01, Thomas De Schampheleire a ?crit :
> On Sun, Nov 10, 2013 at 5:15 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 10/11/13 11:17, Thomas De Schampheleire wrote:
>>>
>>> Thierry Bultel <thierry.bultel@wanadoo.fr> wrote:
> [..]
>>>> The LOWERCASE macro does not seem to exist
>>>>
>>>
>>> It should be straightforward to implement it based on the existing
>>> UPPERCASE macro. I justfind odd there'd be two ways of converting case. One
>>> with direct tr and the other with a make macro...
>>
>>
>>   The UPPERCASE macro is actually really really ugly - it's only reason of
>> existing is that it's much faster than calling tr 40K times, which would be
>> required because UPPERCASE is called so often.
>>
>>   Bottom line: I think using tr for this one situation is a better idea than
>> adding another ugly lowercase macro.
>
> It's also to create a lowercase macro that does $(shell tr '[A-Z]'
> '[a-z]'), explaining that the 'ugly' non-tr implementation is not
> needed because lowercase isn't called that often.
> The reason that I like the centralization is that you can make one
> correct implementation, and other people won't make the
> forgotten-quote mistake a second time.
>
> Also, I think [A-Z] should be replaced by [:upper:] and [a-z] by
> [:lower:] as this is more generally correct.
>
> Best regards,
> Thomas

Ok, please ignore the patch I just resent.

reworking ...
>
