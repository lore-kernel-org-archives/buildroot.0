Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE62C021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 23:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA1240D35;
	Thu, 13 Feb 2025 23:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bj_622DVjQ37; Thu, 13 Feb 2025 23:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2710F40D39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2710F40D39;
	Thu, 13 Feb 2025 23:02:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE480199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 23:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD95160828
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 23:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBE2c6okOcNc for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 23:02:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0EEA6080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0EEA6080E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0EEA6080E
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 23:02:05 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:a40d:f720:8157:c874])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 74425B0053E;
 Fri, 14 Feb 2025 00:02:01 +0100 (CET)
Date: Fri, 14 Feb 2025 00:02:01 +0100
From: Vincent Jardin <vjardin@free.fr>
To: olteanv@gmail.com
Cc: buildroot@buildroot.org, romain.naour@smile.fr
Message-ID: <kll7phf3jaf6dxpzdv7fhc4n4a6rrw65dccs42xcm4yan5me5e@73qw4a2jqmkr>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739487723;
 bh=W1i96o3UbxfccivIh2TaTGOTiqR/+FBsdFcZmhT7dOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hklkQu5VA//SfEUUOr9KlUCf5Iplyr2MffRcJKCDyceIa63xLL7vKX8ypDNiy7oZr
 PQlSTgoAfXr4YB7TXDqy2cjMhWuFQQoU2k1Nxe9liIm/kiyNYUg3BQXtWnbJCyBBU8
 s7hmmUAM/RxyWo8ZMfWXPE/DffAISEFVyJj4Nzt+bMDHFvhxSze6frkl8fxyqV6IyA
 ETHzVmv3cZ+e9Xm2R7ubx0AJNyeUO5wunY/reSrGHhJeE1J35d7lREC/h0qECTf0NG
 GlAJJJRy9IufUje5qUVaZADBOwuTStEvKUdqGNkaxqavOBNdFyDqjhEEMGUbJEK2Sr
 ib+ZRNPVQOGtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hklkQu5V
Subject: Re: [Buildroot] [PATCH v2 00/11] Initial support for SolidRun
 LX2160A-CEX7
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

Hi Vladimir, Romain,

On Sun, Dec 08, 2024 at 04:37:51PM +0100, Vladimir Oltean wrote:
> This series aims to introduce basic initial support for the CX LX2
> and HoneyComb LX2 boards by SolidRun (both of which are based on the
> LX2160A-CEX7 SoM):
> https://shop.solid-run.com/product/SRLX216S00D00GE064C08CH/
> https://shop.solid-run.com/product/SRLX216S00D00GE064H09CH/

I believe that you should break this serie with 2 series:
 1- a generic serie for the LX2 packages, without any specific
    additional board specific patches

 2- a proper board support with its related set of patches. I believe
    that this board support should be pushed upstream first into the
    ATF, uboot, etc... whenever possible and then your patches should
    point to the ongoing upstream contributions. The purpose of the
    patches is to buy some times until they'll be merged.

    or

    Create a new upstream project (on github/gitlab, etc...) for your
    specific SolidRun and related cex7 drivers and tools ; then those
    projetcs can be referenced as a set of new packages for Buildroot.

    Combine it with a BR2_EXTERNAL for some very specific cases ; but
    your BR2_EXTERNAL should minimize the patches (so do some upstreams)
    if you still want to keep it easy to maintain along with the
    Buildroot upgrades.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
