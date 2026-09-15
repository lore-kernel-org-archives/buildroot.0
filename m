Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8089CC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493E560778;
	Tue, 15 Sep 2026 17:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEQYlgPf0u4m; Tue, 15 Sep 2026 17:28:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 77DE96077D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493324;
	b=Mi5Uu62cZoYS+/grgR4AUArCUbyccM5+2wjOD6KjrPmPPY+wOoyQkxw0so1zZx1sQeLI
	 itUaOs7ZmRPV25cQGWuP2lz4HepsXxpkRI+Ugbu9gmHjHkXgb1VQECL55FBqK0fjd9ZjR
	 41yGFDJ+qQLeeU5FDf4d+rpePyH3YULphBVu5AH3rY0/o7Rl2jeXbOTO7vl8nTPp/wA1e
	 lCL2/COHz5yrW1XmdFa06OEIsbqHms5Veh6MoGZLRXESQGaBNTIOW1tPwwpmwfEYd05tB
	 h8Y0IZE20n/8RsFDxs/lEaoaXafRO6AszVWEp2qVVdI9Ln/ZHGYz4HPq3KdUFMqwEFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493324;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=sNVbiJlK3U/17kAFqDaUTKasNnJ880jt6yVHnP4Odtg=;
	b=FxPny/Gwvq+yb9YVJySdStMqvG6gS2e39V+3dxAbu8jxr7w3Uk4YhfbQHnuH6rmS6oiP
	 VNumqkVsRCqwdrhsea0kUfEXMTgTfHhznRPD/BByimGIbaHVmNCxGUAYySs74jmNIzk/Q
	 Km7V3Yc2qEribzwxnrB8XwpReSXvVdF89jAe9nmSMhxeY/03lsIjOXMFXnwCuKjA/TrRL
	 mOUys67zlOfssAyi/2WMqZJlI0mPMQ/eS1XS0KAEWC7wSkffJz1DXruAGP/qk5nZ5wAqO
	 CQ6YIywnHvzt1Qv9epGyBjTCjT47FobYwLtLKQ2ySYOL7ToeCdCKzGdGE7kjsYORGDA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493324;
	bh=sNVbiJlK3U/17kAFqDaUTKasNnJ880jt6yVHnP4Odtg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iZn5lb5ePHT+f57kL0qa0+YM0QWw3DWceYOb62CnqiYy2/Qkte62KMeWHjGzLd9d4
	 mV4CapBti80VMuX5vo5k5SSATHXSmIG53+7L3fEU8Wraqx3DnqEapjq0epS3CgMZiQ
	 islL3/zc4xLo9H/fOt0khsTeWdGof6OOYjNefjbbfMMfk9P97EVfCotpVehzoaakh2
	 S2tFlYPyvK4sSbo52PIM7QAEv34dI+m1lQKw8Ea67L+9ZdrhH8o+hUN8Sa/V/yUMmt
	 2o5OUO3Z8+Rw3yMtaU2f66SsGdLp7ZVMaJdrejsoOTlyLE+QHR+TiOrmVkAZ7BK+LM
	 mDU4+r3KwGqYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77DE96077D;
	Tue, 15 Sep 2026 17:28:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7684423F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67F2E400FF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WNFzryGX2L3 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:28:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 998BF400F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493322;
 b=nfyaAVwuFIEmOCPXSpzuOdNRsQn3tgbqs3D3BxxApmbRP5eBRlxD1cPM4FSZtCcPXzs9
 TCikBoM9wArjDTLC/a+SdoOhzikXKrgCxqUPEBGB2P5oG8gmuPUMeqkuwxldLwqXAY9wC
 pFJVC+EwScqVcF2gIcgU7yMy35en0dZiWmTyzYW6DpiYcIevAg5yWO6Rp4WgCUYWJVu0c
 ohuceezeOrImhYsmvKzAG1YjBmbVMnyjTde3XOKh4M0sx+yMxeHcJNl0vLsqs0iUHEdEv
 qX9OtEupfcLggFbQC2TQchlvFAJLYD/X6EOkBWBcEfdazRsB0rJPPtC4w2tiQSpStIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493322;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=uVyi8ugvlwm+i8zS652hkGXpun+xpTZgzVRy7qMggQ8=;
 b=T/BOLamgjGO4NaacezaOTPx2m0B8WZE/swHFj2xGfXoUareU/Vq+bZ8sxTgy3dzVGAp7
 QqX9w89rdYf1Y9kTKEaW98B4Vt2Vp/mtiCpAFXI3h2RoGuYDub3h91uuWfKgGM1MvQEu3
 vQvte5e1py/KJY+b2cY57+s+BCPr3oeG53h8sUQCCQgJiWumZcu9+qqTW/PG6zlYjI7NG
 whD2E4yVcxYlyOc9BHJ/H54R5uPTsmfsJMUYTvcR3Z6XE5NuEcwKcXhgk3nx6JY1MSURr
 ftfz2ajo/fqV187kGwT/wY1sbLB/MrfN0dyfyZoD6ZEcEfMo2h6Ga2bXGr1tVs0hNHA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=maDjQnZF; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 998BF400F3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:28:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2CAF219F54D;
 Tue, 15 Sep 2026 19:28:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:28:38 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:28:38 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?=
 <jezz@sysmic.org>
In-Reply-To: <20260915120830.1926973-1-thomas.petazzoni@bootlin.com>
References: <20260915120830.1926973-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <e3d1131733df29aeaf775376b096b263@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/strongswan: fix
 BR2_PACKAGE_STRONGSWAN_BOTAN dependencies
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

On 15/09/2026 14:08, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_STRONGSWAN_BOTAN selects BR2_PACKAGE_BOTAN, but since
> commit 10a70b1af67cf79986c2e401f7a54aa850ea82d6, botan needs gcc 11,
> which was not propagated to strongswan's botan option. This commit
> fixes this issue.
> 
> Fixes: 10a70b1af67cf79986c2e401f7a54aa850ea82d6 ("package/botan: needs 
> gcc >= 11")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
