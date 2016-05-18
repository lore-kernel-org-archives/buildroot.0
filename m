From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 May 2016 00:00:16 +0200
Subject: [Buildroot] [PATCH v2] Config.in: add -Og option
In-Reply-To: <573CCB3C.1040703@surround.io>
References: <1463442955-8178-1-git-send-email-martin@surround.io>
 <7e07c970-b00e-f605-7192-3152d53885e1@mind.be> <573CCB3C.1040703@surround.io>
Message-ID: <2cb76318-9eb7-eacc-cdc3-e014604d2628@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/18/16 22:06, Martin Kelly wrote:
> On 05/18/2016 12:52 PM, Arnout Vandecappelle wrote:
>> On 05/17/16 01:55, Martin Kelly wrote:
>>> -Og (introduced in GCC 4.8) lets you optimize for debugging experience,
>>> which can be useful for when you want optimized code that is nonetheless
>>> debuggable.
>>>
>>> Signed-off-by: Martin Kelly <martin@surround.io>
>>> ---
>>> Changes based on feedback:
>>> - select --> depends on
>>> - Reworded help text
>>> - Wrapped text to 72 lines
>>
>>   Well, actually you didn't: you just copied my text, which I
>> incorrectly wrapped at 78 columns instead of 72...
>>
>
> You may have wrapped to 78, but I rewrapped it to 72 columns, so I think the
> patch I sent is correctly wrapped.

  By my count, the line 'reasonable level of optimization while maintaining fast 
compilation' is 68 characters long. with the tab + 2 spaces that becomes 78.

>
>>> ---
>>>
>>>  Config.in           | 10 ++++++++++
>>>  package/Makefile.in |  3 +++
>>>  2 files changed, 13 insertions(+)
>>>
>>> diff --git a/Config.in b/Config.in
>>> index 9bc8e51..3fe6b7a 100644
>>> --- a/Config.in
>>> +++ b/Config.in
>>> @@ -510,6 +510,16 @@ config BR2_OPTIMIZE_3
>>>        and also turns on the -finline-functions, -funswitch-loops and
>>>        -fgcse-after-reload options.
>>>
>>> +config BR2_OPTIMIZE_g
>>
>>   I didn't notice this the first time: config options should be all
>> capitals, like BR2_OPTIMIZE_S (for the -Os option).
>>
>
> I will change this and send a revised patch. Note that there are currently
> several config options that are not all capital (e.g. BR2_STRIP_strip), but
> perhaps those should change too.

  Historical accident. It's not important enough to change it.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
