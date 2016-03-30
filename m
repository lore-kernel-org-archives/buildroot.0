From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 30 Mar 2016 14:04:27 +0200
Subject: [Buildroot] [PATCH] raspberrypi,
 raspberrypi2: add a serial console
In-Reply-To: <56FB05CF.1070808@mind.be>
References: <1459202897-21440-1-git-send-email-luca@lucaceresoli.net>
 <56FAE674.6080004@mind.be> <56FAFA19.9090406@lucaceresoli.net>
 <56FB05CF.1070808@mind.be>
Message-ID: <56FBC0CB.4030607@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

On 30/03/2016 00:46, Arnout Vandecappelle wrote:
> On 03/29/16 23:56, Luca Ceresoli wrote:
>> Dear Arnout,
>>
>> On 29/03/2016 22:32, Arnout Vandecappelle wrote:
>>> On 03/29/16 00:08, Luca Ceresoli wrote:
> [snip]
>>>> diff --git a/configs/raspberrypi2_defconfig
>>>> b/configs/raspberrypi2_defconfig
>>>> index ce41ee31adba..0ffc6cdaf158 100644
>>>> --- a/configs/raspberrypi2_defconfig
>>>> +++ b/configs/raspberrypi2_defconfig
>>>> @@ -5,7 +5,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
>>>>
>>>>    BR2_TOOLCHAIN_BUILDROOT_CXX=y
>>>>
>>>> -BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>>>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>>>
>>>   Why not keep the default "console"? That should work, no? Or doesn't
>>> that work if there are two consoles?
>>
>> What improvement you expect from using "console" instead of "ttyAMA0"?
>>
>> OTOH I think ttyAMA0 or tty1 is explicit about the device to use. And as
>> Yann pointed out on IRC, "console is not a controlling tty, so no Ctrl-C
>> for example".
> 
>  For the record, as concluded on IRC:
> 
> - "console" is still a controlling tty, it is init=/bin/sh that doesn't
> give a controlling tty;
> 
> - GETTY_PORT="console" will launch a getty on the last console= given on
> the kernel command line
> 
> - What I actually meant is that BR2_TARGET_GENERIC_GETTY_PORT can be
> removed completely from the defconfig (as is the case already in roughly
> half our defconfigs) because it anyway defaults to "console".

Thanks for the recap. Will do in v2.

-- 
Luca
