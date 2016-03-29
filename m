From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Mar 2016 00:46:39 +0200
Subject: [Buildroot] [PATCH] raspberrypi,
 raspberrypi2: add a serial console
In-Reply-To: <56FAFA19.9090406@lucaceresoli.net>
References: <1459202897-21440-1-git-send-email-luca@lucaceresoli.net>
 <56FAE674.6080004@mind.be> <56FAFA19.9090406@lucaceresoli.net>
Message-ID: <56FB05CF.1070808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/29/16 23:56, Luca Ceresoli wrote:
> Dear Arnout,
>
> On 29/03/2016 22:32, Arnout Vandecappelle wrote:
>> On 03/29/16 00:08, Luca Ceresoli wrote:
[snip]
>>> diff --git a/configs/raspberrypi2_defconfig
>>> b/configs/raspberrypi2_defconfig
>>> index ce41ee31adba..0ffc6cdaf158 100644
>>> --- a/configs/raspberrypi2_defconfig
>>> +++ b/configs/raspberrypi2_defconfig
>>> @@ -5,7 +5,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
>>>
>>>    BR2_TOOLCHAIN_BUILDROOT_CXX=y
>>>
>>> -BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>>
>>   Why not keep the default "console"? That should work, no? Or doesn't
>> that work if there are two consoles?
>
> What improvement you expect from using "console" instead of "ttyAMA0"?
>
> OTOH I think ttyAMA0 or tty1 is explicit about the device to use. And as
> Yann pointed out on IRC, "console is not a controlling tty, so no Ctrl-C
> for example".

  For the record, as concluded on IRC:

- "console" is still a controlling tty, it is init=/bin/sh that doesn't give a 
controlling tty;

- GETTY_PORT="console" will launch a getty on the last console= given on the 
kernel command line

- What I actually meant is that BR2_TARGET_GENERIC_GETTY_PORT can be removed 
completely from the defconfig (as is the case already in roughly half our 
defconfigs) because it anyway defaults to "console".


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
