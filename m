Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240A4C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF4D040277;
	Mon, 22 Jul 2024 08:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZRG9PsLGiIj; Mon, 22 Jul 2024 08:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AA1240281
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA1240281;
	Mon, 22 Jul 2024 08:12:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2FA71BF291
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0CD280B02
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyyYA2dLDzFR for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:12:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E7B280AE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E7B280AE0
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E7B280AE0
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:12:20 +0000 (UTC)
Received: from [192.168.178.79] (ipb21bd56e.dynamic.kabel-deutschland.de
 [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPSA id D16215244A35;
 Mon, 22 Jul 2024 10:12:18 +0200 (CEST)
Message-ID: <788e9bf3-15bd-4650-809a-9f67a650aeff@andin.de>
Date: Mon, 22 Jul 2024 10:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Naumann <anaumann@ultratronik.de>
References: <20240717194808.126443-1-anaumann@ultratronik.de>
 <20240717225938.31659b3d@windsurf>
Content-Language: en-US
From: Andreas Naumann <dev@andin.de>
In-Reply-To: <20240717225938.31659b3d@windsurf>
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andin.de; 
 s=kas202403131123; t=1721635939;
 bh=w418fWCKiA8W8M8cWXFnhjBscn8PglNjHLXccYmeHKY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=myuDD8RWvuwmUGCzyY7UEcJqUnY/2XfKbbS2CchWSLwKTP3CbLfxnwaIZrcpl2aKG
 wofpdtDYqzlGjG+OJQsvnGayaXtwypgX+Y6eI15CFGXVS5iGj1xMBbwMquwg9NsLED
 Qav2agxgGp2iblctV5EhSVgYdVrqftUQ0A2F1Q45lVg2Wwl6FJkotpnJft3BM690Gh
 tn1dhoEXJ5bc8nBSPWRkI6veKytDyAsdkSqrDRh9jNQ5mEBPo3zvH7080TAuZ/7tKF
 ZNuhAettC9cx15PAu0dgrelk/p+bSYT1eUotHGguqDuoYo82/xE+kyXTV2uVC1XK/5
 C35xxdaOEbi3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=andin.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=andin.de header.i=@andin.de header.a=rsa-sha256
 header.s=kas202403131123 header.b=myuDD8RW
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6opcua: new package
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 17.07.24 22:59, Thomas Petazzoni via buildroot wrote:
> Hello Andreas,
...
> 
> Thanks applied, with minor changes, see below.

Thanks for applying and fixing.

> 
>> ---
>>  package/qt6/Config.in              |  1 +
>>  package/qt6/qt6opcua/Config.in     | 14 +++++++++
>>  package/qt6/qt6opcua/qt6opcua.hash |  9 ++++++
>>  package/qt6/qt6opcua/qt6opcua.mk   | 46 ++++++++++++++++++++++++++++++
>>  4 files changed, 70 insertions(+)
> 
> Entry in DEVELOPERS file missing.

ok.

> 
> 
> 
>>  create mode 100644 package/qt6/qt6opcua/Config.in
>>  create mode 100644 package/qt6/qt6opcua/qt6opcua.hash
>>  create mode 100644 package/qt6/qt6opcua/qt6opcua.mk
>>
>> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
>> index e84806d5e4..29c1c25c7f 100644
>> --- a/package/qt6/Config.in
>> +++ b/package/qt6/Config.in
>> @@ -48,6 +48,7 @@ source "package/qt6/qt6core5compat/Config.in"
>>  source "package/qt6/qt6declarative/Config.in"
>>  source "package/qt6/qt6languageserver/Config.in"
>>  source "package/qt6/qt6mqtt/Config.in"
>> +source "package/qt6/qt6opcua/Config.in"
>>  source "package/qt6/qt6serialbus/Config.in"
>>  source "package/qt6/qt6serialport/Config.in"
>>  source "package/qt6/qt6shadertools/Config.in"
>> diff --git a/package/qt6/qt6opcua/Config.in b/package/qt6/qt6opcua/Config.in
>> new file mode 100644
>> index 0000000000..84a51f544f
>> --- /dev/null
>> +++ b/package/qt6/qt6opcua/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_QT6OPCUA
>> +	bool "qt6opcua"
>> +	select BR2_PACKAGE_QT6BASE_NETWORK
>> +        # qt6opcuda needs host-qt6opcua, and host-qt6opcua needs
>> +        # network support in qt6base.
> 
> Dang, I realize now the indentation here is with spaces, it should have
> been with tabs. I'll fix that up.

Damn, i was using some copypasta and was relying on check-package to
complain.

> 
> 
>> +QT6OPCUA_LICENSE = \
>> +	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
>> +	GPL-3.0 WITH Qt-GPL-exception-1.0 (tools), \
> 
> The tools are also under "GPL-2.0 or GPL-3.0 or LGPL-3.0" as far I can
> see, so I dropped this line.

Thanks for checking. And was not very confident in how to reliably get
this information. Basically I tried to reflect the contents of
licenseRule.json.


regards,
Andreas


> 
> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
