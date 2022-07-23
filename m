Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE6CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 607E1848E5;
	Sat, 23 Jul 2022 12:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 607E1848E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bDm52bzOJYSa; Sat, 23 Jul 2022 12:06:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63003848B7;
	Sat, 23 Jul 2022 12:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63003848B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E417A1BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C30854174C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C30854174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uD8EjjUfoKOF for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:06:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0CB9416F8
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0CB9416F8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:06:17 +0000 (UTC)
Date: Sat, 23 Jul 2022 13:06:04 +0100
From: Paul Cercueil <paul@crapouillou.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-Id: <4Y2HFR.1A53UFE79W2J2@crapouillou.net>
In-Reply-To: <a96703d8-83e8-fc44-0d89-0d5e7e0ba395@mind.be>
References: <20220721183503.369200-1-paul@crapouillou.net>
 <a96703d8-83e8-fc44-0d89-0d5e7e0ba395@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1658577973; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hi6T+Sqk9N03AbKQH21yZPkWddYj1r5uVoW+2ADnVjU=;
 b=WwqyV134RGz/Ku/blX4TgaKC6ug7fT/DmsawzU7qAhu1xSY1ZBAs2ABKPv0aP8JUPI9Cba
 97meVen/KvOrupw7n95SQMI560ZbzRwvVs4gBmOo0VwW9r500Lv+fUJgoXZ3ruvcVH1Uz4
 nuXrNVIQdchCor4y0UQ2pa/DMlGahn8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=WwqyV134
Subject: Re: [Buildroot] [PATCH 1/1] linux: allow modules install path to be
 overriden
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



Le sam., juil. 23 2022 at 14:01:12 +0200, Arnout Vandecappelle =

<arnout@mind.be> a =E9crit :
> =

> =

> On 21/07/2022 20:35, Paul Cercueil wrote:
>> On my system the modules are not installed in the root filesystem
>> directly, but in a separate squashfs image that is then shipped
>> alongside the kernel.
> =

>  That use case is way too specific to add support for it...
> =

>> Support this setup by allowing board files to override the install =

>> path
>> for the kernel modules.
> =

>  This works for in-tree modules, but it stops working if you have any =

> out-of-tree modules.

Fair enough.

>  The proper way to do this would be to add a post-build script that =

> moves TARGET_DIR/lib/modules to where you want it - or probably just =

> run mksquashfs on it and remove it afterwards.

But this would only work once and then it would be impossible to =

rebuild.

-Paul

>  Therefore, I've marked this patch as Rejected in patchwork.
> =

>  Regards,
>  Arnout
> =

>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   linux/linux.mk | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>> =

>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 322ccabbd9..36896a3b4d 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -145,6 +145,8 @@ LINUX_POST_EXTRACT_HOOKS +=3D =

>> LINUX_XTENSA_OVERLAY_EXTRACT
>>   LINUX_EXTRA_DOWNLOADS +=3D $(ARCH_XTENSA_OVERLAY_URL)
>>   endif
>>   =7F+INSTALL_MOD_PATH =3D $(TARGET_DIR)
>> +
>>   # We don't want to run depmod after installing the kernel. It's =

>> done in a
>>   # target-finalize hook, to encompass modules installed by packages.
>>   # Disable building host tools with -Werror: newer gcc versions can =

>> be
>> @@ -152,7 +154,7 @@ endif
>>   LINUX_MAKE_FLAGS =3D \
>>   	HOSTCC=3D"$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
>>   	ARCH=3D$(KERNEL_ARCH) \
>> -	INSTALL_MOD_PATH=3D$(TARGET_DIR) \
>> +	INSTALL_MOD_PATH=3D$(INSTALL_MOD_PATH) \
>>   	CROSS_COMPILE=3D"$(TARGET_CROSS)" \
>>   	WERROR=3D0 \
>>   	DEPMOD=3D$(HOST_DIR)/sbin/depmod
>> @@ -519,8 +521,8 @@ define LINUX_INSTALL_TARGET_CMDS
>>   	# directories, not relevant on the target
>>   	@if grep -q "CONFIG_MODULES=3Dy" $(@D)/.config; then \
>>   		$(LINUX_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) =

>> modules_install; \
>> -		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
>> -		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
>> +		rm -f =

>> $(INSTALL_MOD_PATH)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
>> +		rm -f =

>> $(INSTALL_MOD_PATH)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
>>   	fi
>>   	$(LINUX_INSTALL_HOST_TOOLS)
>>   endef
>> @@ -528,9 +530,9 @@ endef
>>   # Run depmod in a target-finalize hook, to encompass modules =

>> installed by
>>   # packages.
>>   define LINUX_RUN_DEPMOD
>> -	if test -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
>> +	if test -d $(INSTALL_MOD_PATH)/lib/modules/$(LINUX_VERSION_PROBED) =

>> \
>>   		&& grep -q "CONFIG_MODULES=3Dy" $(LINUX_DIR)/.config; then \
>> -		$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) =

>> $(LINUX_VERSION_PROBED); \
>> +		$(HOST_DIR)/sbin/depmod -a -b $(INSTALL_MOD_PATH) =

>> $(LINUX_VERSION_PROBED); \
>>   	fi
>>   endef
>>   LINUX_TARGET_FINALIZE_HOOKS +=3D LINUX_RUN_DEPMOD


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
