Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB1BD60D14
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 09:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12EAE851C3;
	Wed, 20 Nov 2024 09:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0Abl5vvdANq; Wed, 20 Nov 2024 09:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ECA6851CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ECA6851CE;
	Wed, 20 Nov 2024 09:24:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE698DB3
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 09:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BEAD606B9
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 09:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGQT5rKAkPNd for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 09:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C37DC6067E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C37DC6067E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C37DC6067E
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 09:24:25 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.11])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 849C978050F;
 Wed, 20 Nov 2024 10:24:22 +0100 (CET)
Date: Wed, 20 Nov 2024 10:24:21 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Simon Richter <simon@sinic.eu>
Cc: buildroot@buildroot.org
Message-ID: <wma5p3xw7npf2ei7amuy4b7wup65t7kvdfl5jw62ry3knqjkab@kvjydgslz37g>
References: <20241120073755.17583-1-simon@sinic.eu>
 <sy4c2ptgmdeb2ww3p2ofjtq3emcfx2shpsgqi7vwgalq6lonvo@ocnuadjhz6te>
 <4f503f92-b1a4-4b6b-96e0-89352680105e@sinic.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f503f92-b1a4-4b6b-96e0-89352680105e@sinic.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732094663;
 bh=hcAnQn2ACbFEispun2KB4uAPy+AkZL1PXeZ+WwgNGDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=exLn9rgZrZ9eJPZCC5JaD0hdWafObMvzZplXiMGvt/7/+hN9fGRqve9Ofqi1F7UUh
 /4EQomM9w/w/Phuh+l2L8V3CI/cXH7AtcUyK+t59xvANq2oEupQ3mlYERIeRUJFy4j
 yRRY5BgaamKLAQ0haMfpmX4JADRjmuhvw4t5CGstD7oCHbUWvzaQPrhajPv8g22dRD
 tl+skOlzbHZBIrMBzLRE+jrI7DaA9V9ZRobsrggulMcFHEwfPgbMX9X4FaRoCmUwoL
 tcV8ogmEEaHi53Sgwg2FkB0Yj/VmQ8IarGui7o5sXg3DJMhNYmjojvzAv8WwBXk/WZ
 2yiO8TZk+F7Rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=exLn9rgZ
Subject: Re: [Buildroot] [PATCH] package/pkg-generic.mk: add missing quotes
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

Hi Simon,

On Wed, Nov 20, 2024 at 09:32:02AM UTC, Simon Richter wrote:
> If there is a better way to solve this, I will be happy to implement it.

$ echo "foo&b a;r" | sed 's/&/%26/g; s/?/%3F/g; s/;/%3B/g; s/ /%20/g'
foo%26b%20a%3Br

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
