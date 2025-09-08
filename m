Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3D6CAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 11:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A314223F;
	Mon,  8 Sep 2025 11:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owWz6sEUqNVo; Mon,  8 Sep 2025 11:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3C57421EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3C57421EE;
	Mon,  8 Sep 2025 11:51:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91B991D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ED5661B74
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4PJs0IVC5Lz for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 11:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.224.244.102;
 helo=mail-244102.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B1BDE61B01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1BDE61B01
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1BDE61B01
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:51:21 +0000 (UTC)
Date: Mon, 08 Sep 2025 11:51:03 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
From: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip.molloy@analog.com>
Message-ID: <6Tqx81yo61LRw5paRYZs2n9JWaY78vU7u48mjfRQXAMqdgnJGn0AhdW6UCvmmRCHN0iLnK-lsHWkwWRjDUo_aLIvi1dfdWjpEMWszHnk9qo=@philipmolloy.com>
In-Reply-To: <20250903213213.15ac10fa@windsurf>
References: <20250903135005.1803497-1-philip@philipmolloy.com>
 <20250903135005.1803497-3-philip@philipmolloy.com>
 <20250903213213.15ac10fa@windsurf>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: 08f62438a9595426973f28ffc422d6089a9c7a06
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1757332268; x=1757591468;
 bh=zbA3Xa/QlIWDANwQm6WE/mTvEMo0nLYsKl+THa7M84g=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=WKmyOSjz6OBvTZPhiNb5B+ieIbTNIUx7l53JbFse/ONcTdi3ydDRxddfRrHGjFCrf
 A/sWzpVLkrTIuSgLK9lXBjIrNeb7tCBN1EqeJ0NTPbkGCQ17ECGE7o4e0jl13Z3JUm
 buyuOk88d8qaXazTIeRMwjKXproKiLVAvSc79qk5Nkcfz2Hg07ftSxPzDcQSBY1Okm
 w+4SzyedGQ5uatru+uqG3UAU2dZ8SxcV3ThAm9BAObBuX4PnCCeKpEgD7yLkavR7ox
 g8Qr7aCFF7e7FsW+/57wHgAi2SBZwe7G9yeodU1tKwFg/Sn5khHsi/+uwP+GN0pZmE
 A6vEnkXmlaepw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=WKmyOSjz
Subject: Re: [Buildroot] [PATCH v2 2/2] boot/uboot: add ADSP LDR binary
 format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wednesday, September 3rd, 2025 at 9:32 PM, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> Hello Philip,
> 
> Thanks for this v2, we're getting there!

Thanks again for the super speedy review. Especially with a bunch of changes between v1 and v2. Applied everything and will send v3 shortly.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
