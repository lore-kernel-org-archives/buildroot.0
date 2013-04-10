From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 10 Apr 2013 15:19:23 +0800
Subject: [Buildroot] [PATCH v3 2/7] arch: Add blackfin CPU choice.
In-Reply-To: <516504A4.1050306@mind.be>
References: <1365488988-21604-1-git-send-email-sonic.adi@gmail.com>
 <1365488988-21604-2-git-send-email-sonic.adi@gmail.com>
 <516504A4.1050306@mind.be>
Message-ID: <CAJxxZ0Nk8BwY0Wefq3r7e7=7_kC6zktj_vgAHxkuqN_AHknBgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Apr 10, 2013 at 2:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 09/04/13 08:29, Sonic Zhang wrote:
>>
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> v3-changes:
>> none
>>
>> v2-changes:
>> none
>>
>> v1-changes:
>> - is patch adds a Target CPU configuration option and uses it to select a
>> -m
>> option for gcc.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>> ---
>>   arch/Config.in.bfin |   97
>> +++++++++++++++++++++++++++++++++++++++++++++++----
>>   1 files changed, 90 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
>> index 0b137ae..ac96620 100644
>> --- a/arch/Config.in.bfin
>> +++ b/arch/Config.in.bfin
>> @@ -1,12 +1,65 @@
>>   choice
>> -       prompt "Target ABI"
>> +       prompt "Target CPU"
>>         depends on BR2_bfin
>> -       default BR2_BFIN_FDPIC
>> -config BR2_BFIN_FDPIC
>> -       bool "FDPIC"
>> -config BR2_BFIN_FLAT
>> -       bool "FLAT"
>> -       select BR2_PREFER_STATIC_LIB
>
>
>  These should have been removed in the previous patch.
>
>> +       default BR2_bf609
>
>
>  I could be wrong, but wasn't bf60x introduced relatively recently? Do all
> toolchains support it? If not, it would be better to default to something
> more traditional. Also, the toolchains will need conditionals to check if
> they support the selected architecture.
>

The Blackfin toochain releases before 2012R1 should be removed from
the buildroot toolchain makefile.
ADI supports buildroot for blackfin only since the 2012R1 release and
bf60x is enabled in the 2012R2 Blackfin toolchain release.

Regards,

Sonic
