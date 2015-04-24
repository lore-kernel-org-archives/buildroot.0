From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 24 Apr 2015 15:02:44 -0400
Subject: [Buildroot] [PATCH] uboot: add default for
	BR2_TARGET_UBOOT_PATCH
In-Reply-To: <553809A4.5060501@mind.be>
References: <1429623936-4438-1-git-send-email-fhunleth@troodon-software.com>
 <20150422222225.4b80a2bd@free-electrons.com>
 <CA+-urNTdraNR-jsAbCM_DxnMMdx=YfrhsUgW973oXwO5guLsWg@mail.gmail.com>
 <553809A4.5060501@mind.be>
Message-ID: <CA+-urNSJrpPcZ7edkn6TM70stwkVBHCrL2c=u3VHMBt4XZfROA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 22, 2015 at 4:50 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 04/22/15 22:31, Frank Hunleth wrote:
>> On Wed, Apr 22, 2015 at 4:22 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>>
>>> Dear Frank Hunleth,
>>>
>>> On Tue, 21 Apr 2015 09:45:36 -0400, Frank Hunleth wrote:
>>>> Automatically copy over the value from BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
>>>> to make handling its deprecation easier. Thanks to Arnout for the
>>>> suggestion.
>>>>
>>>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>>>> ---
>>>>  boot/uboot/Config.in | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
>>>> index 4f01499..419b183 100644
>>>> --- a/boot/uboot/Config.in
>>>> +++ b/boot/uboot/Config.in
>>>> @@ -84,6 +84,7 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
>>>>
>>>>  config BR2_TARGET_UBOOT_PATCH
>>>>       string "Custom U-Boot patches"
>>>> +     default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
>>>>       help
>>>>         A space-separated list of patches to apply to U-Boot.
>>>>         Each patch can be described as an URL, a local file path,
>>>
>>> Does this actually works? I've tried removing BR2_TARGET_UBOOT_PATCH=""
>>> from my .config, add BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="foo bar", and
>>> ran 'make menuconfig'. I was hoping to see "foo bar" in
>>> BR2_TARGET_UBOOT_PATCH, but it wasn't the case. Am I missing something?
>>>
>>
>> It only works if you have BR2_DEPRECATED_SINCE_2015_05 enabled.
>
>  Right, it's deprecated, not legacy...
>
>  Perhaps it's better to move it to legacy instead of deprecating. Deprecating is
> for when we remove a feature, but here it's more like we renamed it.

Thanks. Changing it from deprecated to legacy is an improvement. I'll
send the new patch as soon as I finish testing it.

-Frank

>
>  Note that string handling in legacy is a bit special, look at e.g.
> BR2_PACKAGE_TZDATA_ZONELIST (renamed to BR2_TARGET_TZ_ZONELIST) for an example.
>
>  Regards,
>  Arnout
>
>> I
>> almost posted an email asking how useful this was. I very rarely
>> enable BR2_DEPRECATED. However, I justified it to myself that if
>> nothing else, it was documentation that the former value in
>> BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR could be copied verbatim.
>>
>> FWIW, I did try reordering the options to see if putting
>> BR2_TARGET_UBOOT_PATCH first would make this work, but it didn't
>> change the results on my end.
>>
>> Frank
>>
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
