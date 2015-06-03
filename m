From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Jun 2015 00:29:17 +0200
Subject: [Buildroot] [PATCH v2 2/2] arch: tidy up binary formats config
In-Reply-To: <20150603212753.GA2858@fox>
References: <1432227249-15345-1-git-send-email-guido@vanguardiasur.com.ar>	<1433340749-7711-1-git-send-email-guido@vanguardiasur.com.ar>	<1433340749-7711-2-git-send-email-guido@vanguardiasur.com.ar>	<556F682B.1030306@mind.be>
 <20150603212753.GA2858@fox>
Message-ID: <556F7FBD.5070207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/15 23:27, Guido Mart?nez wrote:
> On Wed, Jun 03, 2015 at 10:48:43PM +0200, Arnout Vandecappelle wrote:
>> On 06/03/15 16:12, Guido Mart?nez wrote:
>>> @@ -272,13 +276,13 @@ config BR2_BINFMT_SUPPORTS_SHARED
>>>  # Set up target binary format
>>>  choice
>>>  	prompt "Target Binary Format"
>>> -	default BR2_BINFMT_ELF if !(BR2_bfin || BR2_m68k)
>>> -	default BR2_BINFMT_FDPIC if BR2_bfin
>>> -	default BR2_BINFMT_FLAT if BR2_m68k
>>> +	default BR2_BINFMT_ELF		if BR2_USE_MMU
>>> +	default BR2_BINFMT_FDPIC	if BR2_ARCH_HAS_FDPIC_SUPPORT
>>> +	default BR2_BINFMT_FLAT		if !BR2_USE_MMU
>>
>>  I think this should either be without condition at all, or with a condition
>> that matches the previous ones, i.e. if !BR2_USE_MMU && !BR2_ARCH_HAS_FDPIC_SUPPORT.
> Ugh, right, either fully use the short circuiting or not at all. I'd say
> we use no conditions on FLAT.

 OK for me.

> 
>>  Also we normally don't do any vertical alignment at all, so just put a single
>> space instead of tabs.
> OK, agreed.
> 
> Would it be better for me to resend or is this simple enough to be fixed
> up when commiting?

 Better resend, then the committer has less work to do.

 Regards,
 Arnout

> 
> Thanks!
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
