From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Thu, 02 Oct 2014 14:25:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: Fix build with uclibc
 on SH4
In-Reply-To: <20141001231851.325e4460@free-electrons.com>
References: <1412197256-618-1-git-send-email-jkrause@posteo.de>
 <20141001231851.325e4460@free-electrons.com>
Message-ID: <542D4431.3070600@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On 10/01/2014 11:18 PM, Thomas Petazzoni wrote:
> Dear J?rg Krause,
>
> On Wed,  1 Oct 2014 23:00:56 +0200, J?rg Krause wrote:
>> Add missing header file <cstdio> to the uclibc patch to fix build with target SH4.
>>
>> Fixes:
>>    http://autobuild.buildroot.net/results/e5be8fe46a30f0b417fe5fc19a27c480d885791e/
>>    http://autobuild.buildroot.net/results/a3453afddff4fc03681f7fbdff3ccab9706eb189/
>>
>> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> Do you know why the issue is SH4 specific? Is it because our SH4
> toolchains are very old compared to the other Buildroot toolchains (due
> to the SH4 support being broken in the internal toolchain backend) ?

I don't know. The SH4 toolchain is not so old, it's gcc 4.7.3. I guess 
it has something to do with the ability or strictness of the compiler to 
dissolve header dependencies. But I'm not a toolchain expert...

We will use the tool "include-what-you-use" from google to fix missing 
header issues for upmpdcli.

Best regards
J?rg
