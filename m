Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F887CD98CE
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 05:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FCF684D76;
	Tue, 16 Jun 2026 05:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73AW_K1F0CXg; Tue, 16 Jun 2026 05:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BB884D71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781586913;
	bh=sf2Ss+qeHabf7+JnziK0X26L+o985hpYRkExXRQVYMg=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CtPqgdtAd3Y5yfjhJZY27A84SiXG6Wu9efQknSxip6j83VYVzzThLNsQi7S2g63FU
	 I3fcMXe2wRlWVVnsLgIhl2LKgtDtZApA0KNRtGX49WXuu72oePMyYDyu3I2OA6g0LL
	 H9B/oQixLPV2cr3AJ/tvEGNx6Um9Ap9WEQfn+EOrZ9UN43IYzvPmjVN9krr4++JWIs
	 wsvaED37oGOugaLmCuZUqFHyPDdkOoVgbykffxOF2nSig219/b8NEvZYkw+wkdHRJf
	 Fim+lQ3a62n0Y1oimNoJ8qapwxbobULmHVFV2ESkLnHEXvasklHaLpYMhhGf6+sFwA
	 TuqzNU9fkpzlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BB884D71;
	Tue, 16 Jun 2026 05:15:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61001169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 05:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 534AE61BEF
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 05:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPUr-k0qtVny for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 05:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BEA5561BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEA5561BED
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEA5561BED
 for <buildroot@uclibc.org>; Tue, 16 Jun 2026 05:15:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wZM8h-0008dR-U7
 for buildroot@uclibc.org; Tue, 16 Jun 2026 07:15:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 16 Jun 2026 07:14:42 +0200
Message-ID: <pan$192b$b482f28$6a2ab23c$e5df11fa@ID-313208.user.individual.net>
References: <20260615211608.372629-1-bernd@kuhls.net>
 <20260615211608.372629-2-bernd@kuhls.net>
 <36dd2cd2-ef7f-4878-9dfc-d303fd6bd279__46984.2816515424$1781559163$gmane$org@bubu1.eu>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 2/2] package/usbutils: only needs libudev,
 not udev daemon
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 15 Jun 2026 23:32:23 +0200 schrieb Marcus Hoffmann via buildroot:

>> --- a/package/libudev-zero/Config.in
>> +++ b/package/libudev-zero/Config.in
>> @@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBUDEV_ZERO
>>   	bool "libudev-zero"
>>   	depends on !BR2_STATIC_LIBS
>>   	select BR2_PACKAGE_HAS_LIBUDEV
>> +	select BR2_PACKAGE_HWDATA if BR2_PACKAGE_USBUTILS # runtime
>> +	select BR2_PACKAGE_HWDATA_USB_IDS if BR2_PACKAGE_USBUTILS
> 
> Is there a reason for putting these selects here into the libudev-zero 
> config file instead of adding them into usb-utils?

Hi Marcus,

both ways are possible but I opted for selecting the minimum set of 
packages because usbutils makes use of the hwdata package only when used 
with libudev-zero.

usbutils does not directly use usb.ids provided by hwdata, it calls 
udev_hwdb_*() functions which were only stubs in libudev-zero <= 1.0.3.

The other libudev providers, eudev and systemd, provide bundled versions 
of hwdata so they do not need to select our hwdata package.

libudev-zero 1.0.4 otoh does not bundle usb.ids, so in order to display 
meaningful infos we need the hwdata package.
Although it is true that reading usb.ids is an optional feature in 
libudev-zero[1] I opted to select hwdata to improve lsusb output but 
technically it is not mandatory so you can commit my patches without this 
part.

Regards, Bernd

[1] https://github.com/illiliti/libudev-zero/commit/
2bebebc9e0444ec53afd7f1f37aa80ff6b95f5f7

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
