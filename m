From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sat, 1 Jul 2017 21:45:11 +0200
Subject: [Buildroot] [RFC PATCH v5 03/11] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <CAHXCMMJL1KpuWnsyt1iF+zBPWL_8-woP8CwFLJ0E0S0JNLEgDg@mail.gmail.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-4-git-send-email-wg@grandegger.com>
 <e2a39afc-2f57-ce78-2a1c-9bf97fa679ae@mind.be>
 <39f7fecc-16e9-9670-4e04-5010bc902fa9@grandegger.com>
 <CAHXCMMJL1KpuWnsyt1iF+zBPWL_8-woP8CwFLJ0E0S0JNLEgDg@mail.gmail.com>
Message-ID: <48e0ffa4-b597-2261-ceea-157ac3799c80@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 01.07.2017 um 15:13 schrieb Samuel Martin:
> Hi Wolfgang,
> 
> On Sat, Jul 1, 2017 at 2:15 PM, Wolfgang Grandegger <wg@grandegger.com> wrote:
>> Hello Arnout,
>>
>> the latest patch was a rather quick hack to demonstrate the per package and
>> installation step approach...
>>
>>
>> Am 01.07.2017 um 12:36 schrieb Arnout Vandecappelle:
>>>
>>>    Hi Wolfgang,
>>>
>>>    First of all, let me commend you on the large number of comments and the
>>> general clarity of this script.
>>>
>>> On 30-06-17 10:37, Wolfgang Grandegger wrote:
>>>>
>>>> From: Samuel Martin <s.martin49@gmail.com>
>>>>
>>>> The script "fix-rpath" can scan a list of files provided via
>>>> command line argument, identify ELF files, check their RPATH and
>>>> fix it in a proper way. The RPATH fixup is done by the patchelf
>>>> utility using the option "--make-rpath-relative <root-directory>".
>>>>
>>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>>> ---
>>>>    support/scripts/fix-rpath | 100
>>>> ++++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 100 insertions(+)
>>>>    create mode 100755 support/scripts/fix-rpath
>>>>
>>>> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
>>>> new file mode 100755
>>>> index 0000000..405108d
>>>> --- /dev/null
>>>> +++ b/support/scripts/fix-rpath
>>>> @@ -0,0 +1,100 @@
>>>> +#!/usr/bin/env bash
>>>> +
>>>> +# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
>>>
>>>
>>>    Almost nothing is left of the original version by Samuel, so I think you
>>> can
>>> safely add your own name to the Copyright statement :-)
>>
>>
>> Well, fine for me and nobody else complains.
> 
> Please do, you contribute at least as much as i did on this ;-)

OK, I will just add my copyright (keeping yours as well).

Wolfgang.
