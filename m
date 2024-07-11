Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED13C3DA47
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 10:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 296F0607AF;
	Thu, 11 Jul 2024 10:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_JO8bJqFErZ; Thu, 11 Jul 2024 10:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1F46106B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A1F46106B;
	Thu, 11 Jul 2024 10:31:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83CA41BF40D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DB71409B1
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0kzuEV9Q_pY for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 10:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.selirafood.com; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB1D440197
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB1D440197
Received: from mail.selirafood.com (mail.selirafood.com [117.53.144.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB1D440197
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.selirafood.com (Postfix) with ESMTP id 90C8951711;
 Thu, 11 Jul 2024 17:31:07 +0700 (WIB)
Received: from [192.168.111.115] (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.selirafood.com (Postfix) with ESMTPSA id 15A5933FB7;
 Thu, 11 Jul 2024 17:31:06 +0700 (WIB)
Message-ID: <f52e97f3-5fcf-4f0b-98e7-af5bbe3d5d57@athaariq.my.id>
Date: Thu, 11 Jul 2024 17:30:58 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
 <20240603230940.51746-1-foss@athaariq.my.id>
 <20240603230940.51746-2-foss@athaariq.my.id>
 <20240709225233.7e44e407@windsurf>
Content-Language: en-US
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
Autocrypt: addr=foss@athaariq.my.id; keydata=
 xsFNBGWZYswBEADAQ+BO2k+TyLHXyCKu8yFvAKQ5uNwi3E+tq2C8oaol8OUOwkDOR7MElhtJ
 N0vT0BUq0EBV5GJY21NlIJopQ8LG7l1nfJtZDm3nvvJGN8J9eK+E/P3KXgBiW+2mDz8vKS3z
 vlqrL8LIssdX3AAz5rXlpZpE6Ak4xDCr4+66HBTM1Mcn1M70AGJdEif+1iVl8pKT1h6khqHt
 wY+d6afLNq5r/fczwHlvX4rCeeNtyQyueBbeLTatIzcmWMao75YslMg/ipCKte1O6xk3Bj65
 a9vZZ1LAmtO9MzWSkeHHAnvxyu5j6WkbhGIHf+VJtrZvk0Lk5Lns5vQYCTZpTTnXZBQgmwss
 6Zah8A+r8UT7Ao1TkKnq1i9tSku9XUBcAkyv+sAeaPzdzfLoT8fwMZ5HzVnTN41LnFcPtvjV
 M3pgkX6X4YNkjbgntLuytqyIrC7eLI2RzXi/RGmCys7imKfDA1bgAFCbAvQ5DAkcOZsJrD1E
 p4VGq+eNqNDDa+7lZXbxxkX8kDs/DeCjSZTes1Ae+7fQvoQHNpT7TGLqEkrizPkGZ+M/1czS
 +hOxzBbgxNMt2Mjn2SJqMelv+m/uF6aKysO/Dr9MznNvd/ieS9ush0ecp0e1nQFoeYQEGooB
 IpDL808iPtg5h8G00zUbvQtwR0MM4YKFJV12fdfFPsAKYMX3swARAQABzSpBdGhhYXJpcSBB
 cmRoaWFuc3lhaCA8Zm9zc0BhdGhhYXJpcS5teS5pZD7CwZEEEwEIADsWIQTdrvywSY1D19wo
 SFWk5ieJ9DG8DgUCZZlvpwIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRCk5ieJ
 9DG8DjMeD/0UvG8SGWAqdFXJSwXzpbVRWI0yxa4E7ThdMAnLRZElTMwWYV/wUDz/U8O17cNv
 2kY0vFJO8Ez42bmHnR2Nu2mZBE3LCOgDH55TgAUfHxF2c/4oHK3woCygzqKvokZ/wqT8yRRu
 7AguO7NBYUCH+GhIVeKv9zvdmLgOHOzkrGopSi4NDVzqErhDR2g+BbRyohsJKFbU9bAefA5W
 Qr2hhZ/42qoFka92OkFbHt2WjNo845NU/0R855XRWQgzDNIiD6cyQdJXOmlcE+zba4chlTUw
 Mb9iXATpLt7ze/Znxl/T5Q2LtFZA6y2cHv/qppWbVEPMYT3NjazfVmjmaVExDqxKwXmp6+k2
 ZNMw0lsLStXBmwClCqJOl9fGAxbV83PtbKoSAPcZekZQuqMiKtMjISeDFLBcNWkIs5pVuojU
 b+066w4SAdpEh/9FQZS0N2TFoYLMbgoVgSJsWZj2+/pOWhZtxoz0G9NhDW0eEhSVcVckzGno
 KZTHpADr5gC1MGHP9bDYTnjD0ZzAZtXaTtT8fxlyr92/xyZPKjHNOyhfi07IgmIYj2P95lZ7
 UV5WHneLymx+TxeUm9BcWsTKR4Rcb1FoP1IE1jdPTNxWtcV+3IJkH0HNKC2KZcJER+nG5dcO
 aXEB5UOR48x4Xd6M7wFeSSJOrUbuNcfPb9+sXZR3+EyeIc44BGWZYswSCisGAQQBl1UBBQEB
 B0AdJGMmZGTSobNXHSq5jD41VlY/y3RZeo+8W8gahKDAAAMBCAfCwXYEGAEIACAWIQTdrvyw
 SY1D19woSFWk5ieJ9DG8DgUCZZlizAIbDAAKCRCk5ieJ9DG8DvXoD/9mJ+zo4BIY5OAnzrvx
 OYDQuu7jKltsOZyNDMvRDWJSWdJdu0a9JdJMtUs8rodaLp5sRJbILVH8jgexPRxhrTvZA6m7
 OKKUbwW1dv6OuZM+4k3kFiOUszEgSL5m/hesd8TO/ziymkZInStvVYObYWTLGk6ImmpjItO2
 +qtpEi2ujyrcbT3FGsoT4lX/Y9M6m4YI2In3ZIulPrMh3CZlBci+5D6kgTs39te0wJJ/q1XX
 k1EVqOA3E+xyLi9hErElkqzeatcnizLhgi7I+oEYmG1nds+rWsruUwRXhiSOSR5Fv8Szu6GQ
 JQRSHHYakg+8UsFvIZ/1KfUKAzjWHU9U24xWZ1bkZG6g+5yIaL4p9Qb84x3ofFFn9fTRs4vr
 MrDf822GzFzWgIY3Zb9tXTZ+l7q63DPGLClSQt0ptt0ytKMVsof0viY/NC04yOAwOfo27X1u
 0dEGnjFF6CYWFhJI9WyAeqJdqlxIznCM6Xj97Y1yAMu8ZlCuaU3zGNsesKmgpHDYhSQU9v5V
 BlpKhAABlYFb4ZPCbyVpnxcWwHQ0u6M4f/1M0HdJRGQjWJfMrZZR6EYOFFHFhbuFjLw1uRyE
 /9ZmpUvCc8xKu0MykBQt0R1SoNCUnehkVzbCFSe3zYGq28gyHN6lmWoAWR0Lc3jU3JH4k0uR
 GMviPu198f0Mg1RQmg==
In-Reply-To: <20240709225233.7e44e407@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=athaariq.my.id; 
 h=content-transfer-encoding:content-type:content-type
 :in-reply-to:from:from:content-language:references:subject
 :subject:user-agent:mime-version:date:date:message-id:received;
 s=dkim20240121; t=1720693867; x=1721903468; bh=Wt7lRln1gtrPXKU/
 qXoLehPHI8v1xDv9jH8t7cM5NHw=; b=KjaNDduq+kBI3L5D6uqRcChp5Hmc23iD
 0BYP/3tHK2yh25xHxGkCyGciokDy+BCOFPTY08MyApRGf147E+P+N5eoeC6yfOpw
 HkUDdnEh5UJqF8ct+d+LC7i33ThvJ1RCyjaExO2tA1hdXbz83u8Y1GGlypvhlSj7
 dxua+srTYATFxGBxqKJZ3TghcgCXKiWbQE1ov+Ut2DR3AjfpCBxom26JwMYc1u/T
 +qCxg5SOLWEzpZkc5l6ojsNQQbmPphknLL3yikYGU2MS6SNOM3DyuwsGrg9C+zGm
 awLqTNAjvssHCiUEvJtlvIHo7egWAMikwjJ9dez+9z11WVuggWxOKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=dkim20240121 header.b=KjaNDduq
Subject: Re: [Buildroot] [PATCH v3 2/3] package/raspberrypi-usbboot: bump
 version to master (commit 4a3d311)
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
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> I have for now applied the older patch from Fiona Klute. Please submit
> an updated patch if it still makes sense to update raspberry-usbboot
> even further.

Thank you for the Raspberry Pi 5 support! Unfortunately, I broke my
Raspberry Pi 5, so I can't do anything for now. Let's see if I can get a
new one on the next payday this month.

Regards,
Athaariq Ardhiansyah
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
