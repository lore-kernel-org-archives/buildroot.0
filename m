Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B91CCFA05
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 17:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DACD64078C;
	Fri,  7 Nov 2025 17:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70H5L_SL1CqF; Fri,  7 Nov 2025 17:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01D0B4040F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01D0B4040F;
	Fri,  7 Nov 2025 17:11:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3EF393E
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 17:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2B696060A
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 17:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUTtdOBYCea3 for <buildroot@buildroot.org>;
 Fri,  7 Nov 2025 17:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 499D060605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 499D060605
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 499D060605
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 17:11:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B0D49B00576;
 Fri,  7 Nov 2025 18:10:59 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Nov 2025 18:10:54 +0100
MIME-Version: 1.0
Date: Fri, 07 Nov 2025 18:10:54 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Marek Belisko <marek.belisko@open-nandra.com>
In-Reply-To: <20251106221646.977086-1-giulio.benetti@benettiengineering.com>
References: <20251106221646.977086-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d77e0f618c15fb0b25ddc422e6bb4f7c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762535462;
 bh=UfJ3d4ocCQYf3QJFk3eYyXlrAc9nEjtT+gOZU6LVXsA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kWh3/eYrQKHXvfCaRnw+s8behiY8hnBXfX0EGN5mgA0IDOqEyZ62MOr34/0SRgK1i
 TfJu/bBp/LiJ21XkF/IWtJP+NpeIdd3B9kkCqHrqUtb6Ssy5v8ZZKlXFfk+Kn0Fgjm
 z/7qJdO5bA4BVRBZepZfGJdjWDOWrjEKCEnMH1CfBYw9x62BYDbOVV/m8T+cXMndUa
 aXZVzRnxZRIuq78j5lSVaE6dCpTCRRSIqE6NLPsv/Y+AuFI5lE1L7PLW0lJukVItVW
 DxTap0SSFwXuKB2IFNewd2D9DM9n4WokMjNvusU3tJr9Ge3nRK07UuSjWcp+Qcx2Sd
 RoZAH/jfdgWUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kWh3/eYr
Subject: Re: [Buildroot] [PATCH] package/udisks: security bump to version
 2.11.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 06/11/2025 23:16, Giulio Benetti wrote:
> Release notes:
> https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.0

This commit title is marked as "security bump". I don't see any 
reference about
security fixes in this release notes. Could you provide a reference 
please?
(or confirm it is a copy-paste error from the last commit).

> Let's also add support for ATA SMART according to libblockdev package.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
