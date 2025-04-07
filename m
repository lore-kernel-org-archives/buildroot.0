Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E28BC36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 18:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E88B40C2D;
	Mon,  7 Apr 2025 18:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8_kOaDBYxEC; Mon,  7 Apr 2025 18:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A89540C26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A89540C26;
	Mon,  7 Apr 2025 18:54:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3073ADA
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 18:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 210F46107A
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 18:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sq43zzhxiv0 for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 18:54:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34A5160B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34A5160B5A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34A5160B5A
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 18:54:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 284CD13F86E;
 Mon,  7 Apr 2025 20:54:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Apr 2025 20:54:30 +0200
MIME-Version: 1.0
Date: Mon, 07 Apr 2025 20:54:30 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>
In-Reply-To: <20250406-fix_zxing-v2-1-0bce0e835a60@bootlin.com>
References: <20250406-fix_zxing-v2-0-0bce0e835a60@bootlin.com>
 <20250406-fix_zxing-v2-1-0bce0e835a60@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <417880a22f127335118d9cde3c781ffe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744052073;
 bh=zsgb2Y+fH4REIQ3OCanGQDcEQixH6Ash+VEwdbCPtZ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RQzPf8ajtrdzVMiFHhvyDqjfBQjfW1ZF5MobGDY3F3pdltISJbwV9zVFtIhhDkbJ0
 4OVNPHyRO3MIlpiGKD7uWidnJ/qsddhhHfC9xv/joiw018Jkl4n6RrDHVzpAdMlTxB
 x3IpZqT0YiZQSwk/0ORn7anwD0zhvRcqRfZQLJXp70RR0eSgh4CNvtmZFYs4HLN0bA
 Ljyh2twMDr1tas7iwsMevUqrr9Yx+P0B/Lrbc73/jBZRcvdnT1cxWcuyHRylHD0XE+
 6HEV6cd0YxMd1OXJKxvqka7Yw7WGbLeG/ExcKIz9QwSHikmMh6IA6jFYOtFSBzX7qa
 NCt4+XQJ6w1vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RQzPf8aj
Subject: Re: [Buildroot] [PATCH v2 01/11] package/gstreamer1/gstreamer1:
 bump version to 1.24.11
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

On 06/04/2025 02:48, Thomas Bonnefille via buildroot wrote:
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
