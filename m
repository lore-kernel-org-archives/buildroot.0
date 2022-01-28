Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4048CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA03040359;
	Fri, 28 Jan 2022 20:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qI-fCO2frdMr; Fri, 28 Jan 2022 20:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02E9740261;
	Fri, 28 Jan 2022 20:27:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32A981BF842
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DC5461177
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKutqNZnUQSL for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 20:27:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E3B361176
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 20:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643401664;
 bh=zeXmU6fT9RG6QWX4oDaGX/bN7q5M7Nc6PCH2MO9uLPo=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=BT7Js8iDnpIB2HtDNYEImU6CMnnIlajolkYn9bCA6CC1CXeUhzqSscKTN5y2F6hkY
 gH1APCfwnruAEW2Tlvw3AtvINetX7ggGv6ILALOPqYWBo2ENl1hxAgTHjtSYaRfxqb
 PvAD06vWS05Cpi1FUW45SduS9NrNvndxQP17RAOM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.101] ([62.227.220.115]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw7f-1mWXrf2LUR-00j0N2; Fri, 28
 Jan 2022 21:27:44 +0100
Message-ID: <2d6ae233-5b36-8fd9-3bdf-3c4c01eafc22@gmx.de>
Date: Fri, 28 Jan 2022 21:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Robert Hancock <robert.hancock@calian.com>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220128145103.3422-1-universeiii@gmx.de>
 <24f645845a855b039cfa19432c2417e9cedce104.camel@calian.com>
From: Andreas Ehmanns <universeiii@gmx.de>
In-Reply-To: <24f645845a855b039cfa19432c2417e9cedce104.camel@calian.com>
X-Provags-ID: V03:K1:boDpcp7fsuqJ2lIkwoY4gdiXEyaOvQR8zWffZ3fs5PMLqWaoIi5
 +SEyCmHcJKh50PC505ENYKSZJ45TkNqQikfYXx5nBgbH2UFfgpqctvFfr1wZOOnSLFuL9Zd
 ORFiFyR9fpP3Q3t7N/lZn4W4MoBaytNlZdjwl7Fv5lMsduhS5WiHV85LqUHb96cf3y9dj8e
 iabj2JIn+Pbm6P+yXgZQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G31SgBEzS1s=:fhUeV8n8tk/9xpLl75+wey
 E1Po+H2rP7U8kg6iQjn/JgozM+8ah7Qn61QiMwUZCtMrZO0BBDPVfWAl4jZHWRiqRyynQUCGt
 AQYkwVmJtmMSOQ5ItNQg1K4G3Yc6OLLSnHFSkS2qUPEog+LGEoMpnYgopet+z2UCyG7LAD3RF
 M1eiE2zKN3NKgfxz4UYkWIBL7bkykkIyq2winZqfKECy4HiZ3ocIFT3gTXWLOAzcqRInSzqEL
 Lmr2oBKIrV3rggeT2YER7tJ8ZZnyaaISkA9jo7u1ZAM/8lC8fCWkDYOGIcU5o9s1hlKk08epA
 BeuMEdWt7yBk6uR3hlQkI1G/pUA/4+/cQLpd0FOFqHKeEJsKT2fw592bXNbQDltxV4G5JlGUK
 vdiVw4DQcqmIyRrE5WCyDMtTJ7vFmDKFVHvy6U64lTs7HZk7H90GjJMPt3U/VcGEVJWnVfeNY
 dOFS4jGJ/cNKUYInRxk89octfrMe1i+0CI/8W5SQlpwxDFX0bj3PpFAFZoolVuwJ7QzbPhTsm
 f2YSS6iBGqAJzT2xrIa0jipcRNdCUVpsguVr1o1m2mDhiOVejLlZX4vierCa0nC56VPYa1Q2Q
 XL+ZVcVMYXds33G2i9ftAMxIO1XcHISaJKdXq30ns9Dz/lOdbr3QzIIfHxHHH2d+Ne4/gECDw
 HfsoHpHjAwrRCruGrduRb/hjjD/R7O25zhWBAoLkVzFIgYQPPnnq4t8W6m2zo67YtcL6eo3as
 yo6j8yvjAO+JEIwVh3AJS/F9sM2kXUMppUTzASFa1CB6nalfsycoxFIEziyU0enyBWvv9e6zB
 gWjO3xGXowEM9hiv+7ZMwbmiFchgUwQiRQKemkhlKrhLRLy5crDDzR1UsbKtGXYjuXJQII2qB
 m4nDjfIMxEbQyLuur+aqfY3u9AynT8HrAiu/tbp0guI3ti4wEwiEeU/hZLWgcAop61QPigpKg
 KIWYaz4vIaavrHP+6i1+YBphQ9HBmO1tca4bV4JhB+PKISycCzIgPMTh7xE2a7Eh4N3x/7n3V
 oFsn+VjOUuBGpYI5ATwik2NneaBd6AEfR6DdDbFgvboiKJgIo5clPyKOcvkE6OLVYOyjvNO+S
 VRsWpBjls76/vk=
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: add config
 option for custom patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/28/22 17:25, Robert Hancock via buildroot wrote:
> On Fri, 2022-01-28 at 15:51 +0100, Andreas Ehmanns wrote:
>> Many embedded board manufacturer provide their BSP as patches to
>> linux kernel and u-boot. They can simply be applied by setting the
>> corresponding buildroot config (custom patches).
>> Nowadays patches for the arm trusted firmware (ATF) are also part of
>> BSP deliveries but there is no config option in buildroot for ATF
>> to apply custom patches.
>> This patch adds (similar to linux kernel and u-boot) an option to
>> apply custom patches to ATF.
> Hi Andreas,
>
> You shouldn't need a custom option to add patches for each package. If you add
> patches to $(BR2_EXTERNAL)/patches/arm-trusted-firmware then they will get
> applied automatically, we are using this mechanism already.
>
> I think the specific patch options for the kernel and U-Boot may predate that
> mechanism but don't need to be used anymore either.


Hi Robert, Hi Yann,
I typically store BSP Patches under board/<manufacturer>/<board
name>/patches/<linux,uboot,atf>/<version number> ...
This is necessary for me since I have to manage a lot of different
embedded boards with buildroot. Every manufacturer has its own patches,
often different patches for different boards and also for different
releases. A global patch directory
does not help because I have to configure in each defconfig which
patches from which manufacturer/board/version combination should be applied.
For that I use the custom patch option of linux and uboot since a lot of
years and it works perfectly for me. So I transferred this mechanism to
ATF too. This patch helps me managing all the different combination of
BSP versions, therefore I thought it may be helpful for others too.

Regards,
Andreas

>> Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>
>> ---
>>   boot/arm-trusted-firmware/Config.in           |  8 +++++++
>>   .../arm-trusted-firmware.mk                   | 21 +++++++++++++++++++
>>   2 files changed, 29 insertions(+)
>>
>> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-
>> firmware/Config.in
>> index b1fc03e10b..786a3083a2 100644
>> --- a/boot/arm-trusted-firmware/Config.in
>> +++ b/boot/arm-trusted-firmware/Config.in
>> @@ -63,6 +63,14 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION
>>
>>   endif
>>
>> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PATCH
>> +	string "Custom ATF patches"
>> +	help
>> +	  A space-separated list of patches to apply to ATF.
>> +	  Each patch can be described as an URL, a local file path,
>> +	  or a directory. In the case of a directory, all files
>> +	  matching *.patch in the directory will be applied.
>> +
>>   config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
>>   	string "ATF platform"
>>   	help
>> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-
>> trusted-firmware/arm-trusted-firmware.mk
>> index 03fa83b7b5..d329bdbfc3 100644
>> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>> @@ -29,6 +29,27 @@ ifeq
>> ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST
>>   BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
>>   endif
>>
>> +# Analogous code exists in linux/linux.mk. Basically, the generic
>> +# package infrastructure handles downloading and applying remote
>> +# patches. Local patches are handled depending on whether they are
>> +# directories or files.
>> +ARM_TRUSTED_FIRMWARE_PATCHES = $(call
>> qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PATCH))
>> +ARM_TRUSTED_FIRMWARE_PATCH = $(filter
>> https://urldefense.com/v3/__ftp://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-rcq9bSBMIxBB8jTXDxe6jH78mYZP6cg$
>>    https://urldefense.com/v3/__http://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128
>> fh66I9s3_Ij-
>> rcq9bSBMIxBB8jTXDxe6jH78b3MIP3A$  https://urldefense.com/v3/__https://*,$(ARM
>> _TRUSTED_FIRMWARE_PATCHES)__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-
>> rcq9bSBMIxBB8jTXDxe6jH78N2PO7_g$ )
>> +
>> +define ARM_TRUSTED_FIRMWARE_APPLY_LOCAL_PATCHES
>> +	for p in $(filter-out
>> https://urldefense.com/v3/__ftp://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-rcq9bSBMIxBB8jTXDxe6jH78mYZP6cg$
>>    https://urldefense.com/v3/__http://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128
>> fh66I9s3_Ij-
>> rcq9bSBMIxBB8jTXDxe6jH78b3MIP3A$  https://urldefense.com/v3/__https://*,$(ARM
>> _TRUSTED_FIRMWARE_PATCHES)__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-
>> rcq9bSBMIxBB8jTXDxe6jH78N2PO7_g$ ) ; do \
>> +		if test -d $$p ; then \
>> +			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
>> +		else \
>> +			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` ||
>> exit 1; \
>> +		fi \
>> +	done
>> +endef
>> +ARM_TRUSTED_FIRMWARE_POST_PATCH_HOOKS +=
>> ARM_TRUSTED_FIRMWARE_APPLY_LOCAL_PATCHES
>> +
>> +# We have no way to know the hashes for user-supplied patches.
>> +BR_NO_CHECK_HASH_FOR += $(notdir $(ARM_TRUSTED_FIRMWARE_PATCHES))
>> +
>>   ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
>>
>>   ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC),y)
>> --
>> 2.26.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://urldefense.com/v3/__https://lists.buildroot.org/mailman/listinfo/buildroot__;!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-rcq9bSBMIxBB8jTXDxe6jH78CXtWZJI$


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
