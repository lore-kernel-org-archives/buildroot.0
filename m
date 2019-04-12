From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 12 Apr 2019 10:32:47 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: bump version for
 having msgmerge working
In-Reply-To: <20190411221915.xqqyv47qgq2lgvv2@vkochan-ThinkPad-T470p>
References: <20190409174606.31828-1-giulio.benetti@micronovasrl.com>
 <20190410133739.54867aa5@windsurf.home>
 <24a6255a-9727-cea2-f07a-f03a02a8a058@micronovasrl.com>
 <20190411221915.xqqyv47qgq2lgvv2@vkochan-ThinkPad-T470p>
Message-ID: <dc436ca2-f08b-2d6f-582f-3229bf2cfd3d@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vadim, Thomas, All,

Il 12/04/2019 00:19, Vadim Kochan ha scritto:
> 
> Hi Giulio, Thomas, All
> 
> On Wed, Apr 10, 2019 at 02:38:23PM +0200, Giulio Benetti wrote:
>> Hello Thomas,
>>
>> Il 10/04/2019 13:37, Thomas Petazzoni ha scritto:
>>> Hello,
>>>
>>> On Tue,  9 Apr 2019 19:46:06 +0200
>>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
>>>
>>>> On current version msgmerge doesn't work properly. It exits giving:
>>>> fopen: No such file or directory
>>>> The problem has been signalled and fixed by upstream.
>>>>
>>>> Bump version to latest commit.
>>>>
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>>
>>> Is this fixing a build issue with some particular package ?

Yes, this fixes:
http://autobuild.buildroot.net/results/ed0/ed0b14744106dc9b346fba3361d858ce36723816/

as Vadim pointed below.

So if you're ok I can send v2 reworded.

>> This was for package vdr-plugin-vnsiserver that uses msgmerge.
>> But as you've pointed me here:
>> https://patchwork.ozlabs.org/patch/1082580/
>>
>> i18n files are provided when BR2_SYSTEM_ENABLE_NLS=y
>> So I think it's useless.
>>
>> Right?
>>
> 
> I just finally finished built on latest master:
> 
> 	http://autobuild.buildroot.org/results/0c230e49b6e9bf27163f751e6912ee85c6eb62e3/
> 
> and got build error (as expected), but after I manually bumped to
> version which Giulio proposed and it fixed the issue. But I did not
> test the package in runtime.
> 
> Giulio opened the issue with msgmerge error:
> 
> 	https://github.com/sabotage-linux/gettext-tiny/issues/42
> 
> and the sabotage guys provided the fix:
> 
> 	https://github.com/sabotage-linux/gettext-tiny/commit/a597aaebd15ef73a65d67f0d6f746ca7ca812d51
> 
> Regards,
> Vadim kochan
> 

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
