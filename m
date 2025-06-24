Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C795AC77B7F
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 13:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8223D60B18;
	Tue, 24 Jun 2025 13:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejnbkCMUbEhC; Tue, 24 Jun 2025 13:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF67860A8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF67860A8F;
	Tue, 24 Jun 2025 13:27:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8042C43F
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 13:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61B4860A8F
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 13:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSfQKr70Zyho for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 13:27:51 +0000 (UTC)
X-Greylist: delayed 346 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 24 Jun 2025 13:27:50 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA7AF60632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA7AF60632
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.146.106.75;
 helo=smtp05-ext.udag.de; envelope-from=philipp.ludwig@passerro.de;
 receiver=<UNKNOWN> 
Received: from smtp05-ext.udag.de (smtp05-ext.udag.de [62.146.106.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA7AF60632
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 13:27:50 +0000 (UTC)
Received: from [192.168.15.156] (p578aae36.dip0.t-ipconnect.de [87.138.174.54])
 by smtp05-ext.udag.de (Postfix) with ESMTPA id 43195E0526
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 15:22:03 +0200 (CEST)
Message-ID: <4946d64f-534f-4034-a2c6-f82bb0a32748@passerro.de>
Date: Tue, 24 Jun 2025 15:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-US
From: Philipp Ludwig <philipp.ludwig@passerro.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=passerro.de; s=uddkim-202310; 
 t=1750771323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WLWUSvQoRlYP0lGr4LJ9yaOlx4lLpudJSALjP9o2oms=;
 b=JI3kaCWxHUbQZM/WKXG0YqSoGw3fpPJ0YzeC07aillkzX7mXPIqAMG+LCH+92ZbK2GGKUE
 nDjhgh/54XRLMPfimehkuEQ30wcia5u8QtEarDn7dO3udC3Z1pOJPiiOrDbOU+BNmZm2c3
 FAlF0JrUZb6cKagwyzDnU3FXV8bR9cuQjoi+yKatVEwoESlL2F427GUa4Ka49mxFy0iPRW
 3v4HgSyD/6jBJ2spWHfgj2KKKczIhGcxaiFUiu4KctjJBFgecnAge0CNkSdD8iWHDRac06
 kIzSi60edYV95qRncoMzQWzC/BM0yR58HEuPXHKr1qzgJ0e8pjCEc0d/bGV6gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=passerro.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=passerro.de header.i=@passerro.de header.a=rsa-sha256
 header.s=uddkim-202310 header.b=JI3kaCWx
X-Mailman-Original-Authentication-Results: smtp05-ext.udag.de;
 auth=pass smtp.auth=philipp.ludwig@passerro.de
 smtp.mailfrom=philipp.ludwig@passerro.de
Subject: [Buildroot] Upgrading a postgres database in buildroot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello list,

How do you upgrade a postgres database in buildroot?
This just hit me, because I upgraded a buildroot image, which now 
contains PG 17.5, so I can't read the data that was created with PG 16.

Now there is the pg_upgrade command, but it requires the binaries of the 
old 16 version - which I don't have anymore, since I upgraded my 
filesystem image.

So what is the recommended strategy? Is it possible to install both 
postgres versions? I did not find such an option in the menuconfig.

Or do I need downgrade my buildroot image, copy the binaries, upgrade 
again, and then run pg_upgrade?

Best regards
Philipp Ludwig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
