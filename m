Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39CAC3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 11:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70E8960A65;
	Sun, 13 Apr 2025 11:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1MWfGOU8odQ; Sun, 13 Apr 2025 11:37:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99F01608DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99F01608DC;
	Sun, 13 Apr 2025 11:37:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D8FCD4
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 11:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EB334099C
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 11:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5CVlwvzch1W for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 11:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D223E405AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D223E405AB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D223E405AB
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 11:37:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 95C012003A4;
 Sun, 13 Apr 2025 13:37:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Apr 2025 13:37:16 +0200
MIME-Version: 1.0
Date: Sun, 13 Apr 2025 13:37:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bryan Brattlof <bb@ti.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250412-optee-fixes-v1-1-14bf0f629d1a@ti.com>
References: <20250412-optee-fixes-v1-0-14bf0f629d1a@ti.com>
 <20250412-optee-fixes-v1-1-14bf0f629d1a@ti.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <eda39d1f7383d8d1b169d072af6a45d8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744544237;
 bh=Qv/PS8OaSMt6u8HGulQOiMx6ay/bobtL6hWVem4SKCI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HQ11m+c1HhrYeRyMAF8NvnS45L/CM/BKoyjwm4LFtMl1OJdzta2fDsEEkFwxalK0k
 RbzivFKwx7SL8FYy1zUGQhjfUFU6KrnwFqpZY80CBNX2x8omG9FrPW+BOi+HlTJh3G
 OpXfpRyOiuBOwMc0iRyUnoFzRxiTfSwnMIUKj7lhLurHHXWfYqqmKPSYO401wAFGO4
 Z3XlG9K92fYYT4YXGLBIUccrSQ9ObJbgZHKMuKMV5ZzsMJIseWwXqxQJXKgvtLHFM3
 LXDlUl01V0D8uMPmyzd210l1n5f4eh8kC2Yvy8DBCcwH3N+PG6u7A00AFOsN3CSqBt
 u0h4tX9vZirTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HQ11m+c1
Subject: Re: [Buildroot] [PATCH 1/2] configs/ti_am62ax_sk_defconfig: switch
 to am62x op-tee platform flavor
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

Hi Bryan,

On 12/04/2025 20:39, Bryan Brattlof via buildroot wrote:
> There is unfortunately no SA2UL_BASE defined for the am62ax in op-tee
> which is causing the op-tee builds to fail however the platform is
> identical to the am62x platform. So for now let's switch to using the
> am62x which has the proper configuration for this SoC even if it's
> mislabeled
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

I applied this series to master, thanks.
I also added extra info in the commit log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/b1fac04a6e3d979e8dbcb436b42bbe167db96bab
https://gitlab.com/buildroot.org/buildroot/-/commit/637eead755ebb1b89aafd9345f2c6dee8412fb19

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
