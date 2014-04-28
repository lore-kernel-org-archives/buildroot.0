From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 21:17:52 +0200
Subject: [Buildroot] [PATCH 4/9] boot/syslinux: rewrite options prompts
In-Reply-To: <20140428173651.GC3501@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <8977ed467510f41bf80553eb104ed93e52aac1c8.1398378217.git.yann.morin.1998@free.fr>
 <535DEDB4.4030601@mind.be> <20140428173651.GC3501@free.fr>
Message-ID: <535EA960.1080800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/14 19:36, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-04-28 07:57 +0200, Arnout Vandecappelle spake thusly:
>> On 25/04/14 00:29, Yann E. MORIN wrote:
>>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>>
>>> Rewrite the options prompt in preparation to adding a new
>>> type of image to install.
>>>
>>> Add help entries to each option, too.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Frank Hunleth <fhunleth@troodon-software.com>
>>> ---
>>>  boot/syslinux/Config.in | 12 +++++++++---
>>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
>>> index 1b8c527..b92f28f 100644
>>> --- a/boot/syslinux/Config.in
>>> +++ b/boot/syslinux/Config.in
>>> @@ -12,10 +12,16 @@ config BR2_TARGET_SYSLINUX
>>>  if BR2_TARGET_SYSLINUX
>>>  
>>>  config BR2_TARGET_SYSLINUX_ISOLINUX
>>> -	bool "Install isolinux"
>>> +	bool "isolinux"
>>>  	default y
>>> +	help
>>> +	  Install the legacy BIOS 'isolinux' image, to boot off
>>
>>  This sounds like it's a legacy image... I'd just skip the word "legacy".
>> BIOS is BIOS.
> 
> Hmmm. OK.
> 
> Side-channel rant: I always wonder how I should call the EFI 'firmware':
>   - EFI BIOS
>   - EFI firmware
>   - BIOS
>   - firmware
>   - EFI  (but that more a spec than an implementation)
> 
> So, I usually refer to what we called BIOS in the early days as the
> "lecagy BIOS", which is also what you'd find in most EFI BIOSes when
> you enable "legacy BIOS" (often as a simple and efficient way to
> by-pass the secure-boot.)

 OK, good point. So "legacy BIOS" and "EFI BIOS" it is, then.


 Regards,
 Arnout

> 
>>> +	  optical medias (CDROM, DVD.)
>>
>>  The plural of medium is media, without s.
> 
> Yep, it always bites me... Thanks.
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
