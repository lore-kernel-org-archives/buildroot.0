From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 May 2013 09:01:56 +0200
Subject: [Buildroot] [PATCH 1/2] mxs-bootlets: add support for custom
 patches
In-Reply-To: <20130522085804.5dbbbf4b@skate>
References: <1368905110-23303-1-git-send-email-gustavo@zacarias.com.ar>
 <519C60D6.5040207@mind.be> <20130522085804.5dbbbf4b@skate>
Message-ID: <519C6D64.8040109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/05/13 08:58, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 22 May 2013 08:08:22 +0200, Arnout Vandecappelle wrote:
>
>>> +config BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR
>>> +	string "custom patch dir"
>>> +	help
>>> +	  If your board requires custom patches, add the path to the
>>> +	  directory containing the patches here. The patches must be
>>> +	  named mxs-bootlets-<something>.patch.
>>> +
>>> +	  Most users may leave this empty
>>> +
>>
>>    Now that we have BR2_GLOBAL_PATCH_DIR, I would prefer to avoid adding
>> config options like this... Admittedly, for bootloaders it is more likely
>> that custom patches are needed than for any other package. But even so,
>> the global patch dir is sufficient, it is quite useable, and it reduces
>> complexity in the buildroot core.
>
> This means that a defconfig would have to define a value for
> BR2_GLOBAL_PATCH_DIR, in this particular case. Is this something we
> really want?

  I would say yes, I'd prefer that defconfigs define BR2_GLOBAL_PATCH_DIR 
to point to board/xxx/yyy/patches. Then they come much closer to how you 
would use buildroot in practice.


> Also, what about the existing *_CUSTOM_PATCH_DIR config options we have
> for Linux, U-Boot, Barebox and a bunch of other boot/kernel packages?

  Here also I'm in favour of deprecating them.

  But probably it's better to start using the global patch dir now, and 
only start deprecating the old ways next year.


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
