From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 18 Apr 2016 12:28:18 +0200
Subject: [Buildroot] [PATCH] [RFC] U-Boot: don't check hashes for U-Boot
 external patches
In-Reply-To: <57100ABB.8090206@mind.be>
References: <1460644321-13849-1-git-send-email-julien.boibessot@free.fr>
 <57100509.8040804@mind.be> <57100ABB.8090206@mind.be>
Message-ID: <5714B6C2.6020204@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Arnout,

thanks for the comments.

On 14/04/2016 23:25, Arnout Vandecappelle wrote:
> On 04/14/16 23:00, Arnout Vandecappelle wrote:
>> On 04/14/16 16:32, julien.boibessot at free.fr wrote:
>>> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>>>
>>> BR2_TARGET_UBOOT_PATCH allows user to give URL of patches on the
>>> Web, but in
>>> that case BR dl infra tries to compare hashes of the downloaded
>>> patches with the
>>> infos from boot/uboot/uboot.hash.
>>> So, for that case (user specified patches), tell BR not to check
>>> hashes.
>>>
>>> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>>> ---
>>>   boot/uboot/uboot.mk | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>>> index 48f40c3..9e24b48 100644
>>> --- a/boot/uboot/uboot.mk
>>> +++ b/boot/uboot/uboot.mk
>>> @@ -109,6 +109,8 @@ UBOOT_POST_RSYNC_HOOKS +=
>>> UBOOT_COPY_OLD_LICENSE_FILE
>>>   # directories or files.
>>>   UBOOT_PATCHES = $(call qstrip,$(BR2_TARGET_UBOOT_PATCH))
>>>   UBOOT_PATCH = $(filter ftp://% http://% https://%,$(UBOOT_PATCHES))
>>> +UBOOT_PATCHES_NAME = $(notdir $(UBOOT_PATCHES))
>>
>>   Since only the non-local patches will be downloaded, perhaps it's
>> better to
>> use UBOOT_PATCH instead of UBOOT_PATCHES.
>>
>>   Also, there is no need to use an additional variable for this, it's
>> used only
>> once.
>
>  Oh, and something similar should be done for LINUX_PATCH as well.

LINUX_PATCH is already working well with external patches that have to
be downloaded.

Regards,
Julien
