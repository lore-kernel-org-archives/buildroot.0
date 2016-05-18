From: Martin Kelly <martin@surround.io>
Date: Wed, 18 May 2016 13:06:20 -0700
Subject: [Buildroot] [PATCH v2] Config.in: add -Og option
In-Reply-To: <7e07c970-b00e-f605-7192-3152d53885e1@mind.be>
References: <1463442955-8178-1-git-send-email-martin@surround.io>
 <7e07c970-b00e-f605-7192-3152d53885e1@mind.be>
Message-ID: <573CCB3C.1040703@surround.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/18/2016 12:52 PM, Arnout Vandecappelle wrote:
> On 05/17/16 01:55, Martin Kelly wrote:
>> -Og (introduced in GCC 4.8) lets you optimize for debugging experience,
>> which can be useful for when you want optimized code that is nonetheless
>> debuggable.
>>
>> Signed-off-by: Martin Kelly <martin@surround.io>
>> ---
>> Changes based on feedback:
>> - select --> depends on
>> - Reworded help text
>> - Wrapped text to 72 lines
>
>   Well, actually you didn't: you just copied my text, which I
> incorrectly wrapped at 78 columns instead of 72...
>

You may have wrapped to 78, but I rewrapped it to 72 columns, so I think 
the patch I sent is correctly wrapped.

>> ---
>>
>>  Config.in           | 10 ++++++++++
>>  package/Makefile.in |  3 +++
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/Config.in b/Config.in
>> index 9bc8e51..3fe6b7a 100644
>> --- a/Config.in
>> +++ b/Config.in
>> @@ -510,6 +510,16 @@ config BR2_OPTIMIZE_3
>>        and also turns on the -finline-functions, -funswitch-loops and
>>        -fgcse-after-reload options.
>>
>> +config BR2_OPTIMIZE_g
>
>   I didn't notice this the first time: config options should be all
> capitals, like BR2_OPTIMIZE_S (for the -Os option).
>

I will change this and send a revised patch. Note that there are 
currently several config options that are not all capital (e.g. 
BR2_STRIP_strip), but perhaps those should change too.
