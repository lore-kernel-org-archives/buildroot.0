From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Nov 2013 09:12:06 +0100
Subject: [Buildroot] [PATCH 4/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <20131125230340.GC3435@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <ddf2a31498f7f8e1ec0d40d73849bc254ec00b6d.1385157864.git.yann.morin.1998@free.fr>
 <52931907.2040207@mind.be> <20131125190551.GA3435@free.fr>
 <5293CEC8.9010601@mind.be> <20131125224548.GB3435@free.fr>
 <5293D598.20408@mind.be> <20131125230340.GC3435@free.fr>
Message-ID: <529457D6.8060700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/11/13 00:03, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2013-11-25 23:56 +0100, Arnout Vandecappelle spake thusly:
>> On 25/11/13 23:45, Yann E. MORIN wrote:
>>> Arnout, All,
>>>
>>> On 2013-11-25 23:27 +0100, Arnout Vandecappelle spake thusly:
>>>> On 25/11/13 20:05, Yann E. MORIN wrote:
>>>>> Arnout,
>>>>>
>>>>> On 2013-11-25 10:31 +0100, Arnout Vandecappelle spake thusly:
>> [snip]
>>>>   Anyway, I think it should be:
>>>>
>>>> BUILD_DIR=$(BUILD_DIR) fs/custom/genimages \
>>>> 	'$(call qstrip,$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE))'
>>>
>>> I'm using double quotes here, now, instead of single quotes.
>>> Otherwise, consider it changed. Thanks!
>>
>>   With double quotes, it will not actually be quoted because the
>> ROOTFS_$(2)_CMD use adds another level of double quotes and they cancel out.
>
> Yes, I was again too fast to reply: I'm using \"$(BLABLA)\"
>
> My reasoning is I want varuable to be expanded, like in:
>      BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE="$(TOPDIR)/board/raspberrypi/partitions"

  You do know that make doesn't interpret quotes or backslashes? So the 
\" construct is passed verbatim to the shell. The $(...) on the other 
hand is always expanded, except when quoted by doubling the $$.


  Regards,
  Arnout

>
> But since $(TOPDIR) is a Makefile constrcut, the shell won't expand it,
> so it must be make expanding it (since it is working).
>
> I'll try single quotes, since they look better.
>
> Regards,
> Yann E. MORIN.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
