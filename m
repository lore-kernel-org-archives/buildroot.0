Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267BFC25B78
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 22:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0EEB40975;
	Mon,  3 Jun 2024 22:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFwbailRZMX6; Mon,  3 Jun 2024 22:58:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3FCF40978
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3FCF40978;
	Mon,  3 Jun 2024 22:58:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0A6C1BF2B1
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 22:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC2E940978
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 22:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nclwwZaQMye3 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 22:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.athaariq.my.id; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D03FE40975
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D03FE40975
Received: from mail.athaariq.my.id (unknown [117.53.144.211])
 by smtp4.osuosl.org (Postfix) with ESMTP id D03FE40975
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 22:58:15 +0000 (UTC)
Received: from [192.168.208.75] (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.athaariq.my.id (Postfix) with ESMTPSA id C86BC3302C;
 Mon, 03 Jun 2024 22:58:11 +0000 (UTC)
Message-ID: <3e31a13f-ae2c-4469-b275-9007ac82d17f@athaariq.my.id>
Date: Tue, 4 Jun 2024 05:58:00 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20240603074049.28426-1-foss@athaariq.my.id>
 <20240603084617.38508-1-foss@athaariq.my.id>
 <20240603084617.38508-2-foss@athaariq.my.id>
 <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
Content-Language: en-US
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
Autocrypt: addr=foss@athaariq.my.id; keydata=
 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
 GMviPu198f0Mg1RQmg==
In-Reply-To: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
Subject: Re: [Buildroot] [PATCH v2 2/3] package/raspberrypi-usbboot: bump
 version to 20221215-105525
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

Hi Fiona!

 > the commit message should mention the actual version.

The upstream maintainer won't tag the version anymore since December
18th, 2022. So, I have no idea what version of the latest commit. Last
tagged version has no Raspberry Pi 5 support, unfortunately. From your
perspective, should we ask the maintainer to tag again or we can safely
use the latest commit possible similar as rpi-firmware? Thanks.

Best regards,
Athaariq Ardhiansyah
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
