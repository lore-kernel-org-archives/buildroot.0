From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 16:25:38 +0200
Subject: [Buildroot] [PATCH] Makefile: add help for
 linux-update-defconfig target
In-Reply-To: <20150406151856.17c47bc3@free-electrons.com>
References: <1428003286-13449-1-git-send-email-yegorslists@googlemail.com>	<5522871B.2050603@mind.be>
 <20150406151856.17c47bc3@free-electrons.com>
Message-ID: <55229762.4040302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 15:18, Thomas Petazzoni wrote:
> Arnout, Yegor,
> 
> On Mon, 06 Apr 2015 15:16:11 +0200, Arnout Vandecappelle wrote:
> 
>>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>>
>>> ---
>>>  Makefile | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index edb122b..08b5c1e 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -878,6 +878,8 @@ endif
>>>  ifeq ($(BR2_LINUX_KERNEL),y)
>>>  	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
>>>  	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
>>> +	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
>>> +	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
> 
> Why just for linux and not for all kconfig based packages ? Why
> <foo>-update-defconfig and not <foo>-update-config ?

 Here are the reasons:

- update-defconfig doesn't exist for all kconfig packages

- update-defconfig is preferred if it exists (for Linux I certainly see no
reason to ever use update-config)

- documenting foo-update-defconfig would perhaps be better, but that's part of a
bigger change that would completely remove all the specifics. When I did the
'make help' patches I started on that, but it turns out to be a bit more work so
I dropped it in the end.


 Regards,
 Arnout

> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
