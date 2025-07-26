Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708CAC83F17
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 11:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F2C412D1;
	Sat, 26 Jul 2025 11:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAgccWtM_NC6; Sat, 26 Jul 2025 11:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 671854128F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 671854128F;
	Sat, 26 Jul 2025 11:27:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6527F198
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5743B83E50
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nB-L9FMEmKBL for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 11:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A19483DCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A19483DCF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A19483DCF
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:27:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 59A6113F8BA;
 Sat, 26 Jul 2025 13:27:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Jul 2025 13:27:21 +0200
MIME-Version: 1.0
Date: Sat, 26 Jul 2025 13:27:21 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <20250726040120.250482-1-fancp2007@gmail.com>
References: <20250726040120.250482-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7650b6396a702cde8763ff457377434f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753529243;
 bh=zxfdDpgHbI6mMZzxoQyz/aiVHLpPEO217Xfg+EGODYY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZA6FqRFKCPNHePvkfKx5v824sMQVj9Fl5n1FMbmEexozL3zmwOihh70JGwyMGDtUt
 EP9K2/6C++ZAzu4cSlCjOzK7noDEGjMeUNBg1GIp8cxM75bSrYE91SyXT8MEIeGVgS
 nF1B/398/LJEWuFH0SGwi3os610VARueaWvlzmL58jIhpSiHayaOgtJ0j4pzMBDIRB
 1lO+InCgV0EuwrJNAIaN5k3YmI1j1i4yfvyJmEQ2XX2ltDYXaT/DQE4qJGUQE/AVeT
 AEvp4EFlPj85yOAmbQ3aXYwihMTo+ykq9VLKirgaKi6pJ+EgcDO/oqUgKq0We+zcLl
 /2A4j8C+QNCyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZA6FqRFK
Subject: Re: [Buildroot] [PATCH] package/mosquitto: bump to version 2.0.22
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

On 26/07/2025 06:01, Scott Fan wrote:
> Drop the patch that was fixed in the v2.0.22, see the closed issues and 
> PRs:
> https://github.com/eclipse-mosquitto/mosquitto/issues/3246
> https://github.com/eclipse-mosquitto/mosquitto/pull/3256
> https://github.com/eclipse-mosquitto/mosquitto/pull/3227
> https://github.com/eclipse-mosquitto/mosquitto/pull/3252
> 
> However, a new issue was reported by GasparQ, when WITH_TLS option is 
> off.
> https://github.com/eclipse-mosquitto/mosquitto/issues/3318
> 
> Fortunately, besmarsh had pushed a PR that fixed this issue.
> https://github.com/eclipse-mosquitto/mosquitto/pull/3321
> 
> The patch file was quoted in this commit.
> 
> For more details of v2.0.22, see the changelog:
> https://github.com/eclipse-mosquitto/mosquitto/blob/v2.0.22/ChangeLog.txt
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
