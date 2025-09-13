Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07862CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 13:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A822241B93;
	Sat, 13 Sep 2025 13:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qu7e3ua3NqBn; Sat, 13 Sep 2025 13:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E477F412B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E477F412B9;
	Sat, 13 Sep 2025 13:43:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 497D112D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F6E841B46
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4_4AUw7PYUL for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 13:43:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 698044064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 698044064C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 698044064C
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:43:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7B8BA19F576;
 Sat, 13 Sep 2025 15:42:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Sep 2025 15:42:55 +0200
MIME-Version: 1.0
Date: Sat, 13 Sep 2025 15:42:55 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Kamel Bouhara <kamel.bouhara@gmail.com>
In-Reply-To: <20250910125410.3890456-1-buildroot@heine.tech>
References: <20250910125410.3890456-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.11
Message-ID: <9278b27a77f2669c739d3a31c2226128@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757770977;
 bh=FHbeCd3vWb+wwakz3C52lj/xFGOtssjlvV+nHucTBEg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i8i9+MTyz+7ewPEvF4tzzcRl7PY/3o2R3DLvNZVxx3uHN5uTlKpk4V6TYKd9gqaeq
 RjfJ26P2Ps4gwPCuBfNvdACIyFOB3+1ZyPUPX1d2mbvoK354wQ3YRDkLMmYabsnzRe
 SiZKU8KvdWGeEHHzW0MBd+GZ44ZaPYeGK4kZ2eP9Y1HPd3Xi71rtU67nFfCVuMXjxV
 aT1gEj1DiZCuo2FRukna/tsHU20nltmGPVmQtPS01qzxKBgIgK9vSkJq3vNDr6JPLl
 xRvrxXwQwecqWvI47OusQpXVr2R6MiEzDDX47tGbaxbtfu3+wgiwYKWTPKgogedmPV
 3vbosJg0uD41w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i8i9+MTy
Subject: Re: [Buildroot] [PATCH] package/usbguard: bump to version 1.1.4
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

On 10/09/2025 14:54, Michael Nosthoff via buildroot wrote:
> - brings compatibility with protobuf v30.0+
> - drop upstreamed patch
> 
> Changelog:
> https://github.com/USBGuard/usbguard/releases/tag/usbguard-1.1.4
> https://github.com/USBGuard/usbguard/releases/tag/usbguard-1.1.3
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
