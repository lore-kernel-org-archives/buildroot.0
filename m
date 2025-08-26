Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5C8CA0FED
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 22:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C01406B3;
	Tue, 26 Aug 2025 22:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8psG8FyESNYt; Tue, 26 Aug 2025 22:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C779406AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C779406AC;
	Tue, 26 Aug 2025 22:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A14C2B8C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 22:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91AB880D10
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 22:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPDQLFqwPHLW for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 22:07:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A7B380D08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A7B380D08
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A7B380D08
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 22:07:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E53275FFAF;
 Wed, 27 Aug 2025 00:07:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 27 Aug 2025 00:07:46 +0200
MIME-Version: 1.0
Date: Wed, 27 Aug 2025 00:07:46 +0200
To: Yacin Belmihoub-Martel <yacin.belmihoub-martel@silabs.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250825234140.2080155-2-yacin.belmihoub-martel@silabs.com>
References: <20250825234140.2080155-1-yacin.belmihoub-martel@silabs.com>
 <20250825234140.2080155-2-yacin.belmihoub-martel@silabs.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <017ac2eca62c06cd8b4af852b9d70d54@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756246069;
 bh=XNxgM96eWZC93GjDT3pWBNy5HHf+uIqvEKSn9v/sHr8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mVOUTMcnA4OV5NoCvw8aV0BPWbnBwcamqOXgpTiSBN6WYOhXjZHpJ8nDGkZDRMedh
 rqYJWOBHHhqbDZ+qqE4L8882EJeGFUZHIonWe+tUbLzzU4JiSwehrqoRHMQth9vhhR
 u74amyw2Io+8yFftS1O+jOp0JWPJkqlg+Gd7l09ReJjqlPC8s8wmVcyz03g7tNAP+h
 5FTsTw1aX5vN0Vdrdt6yWOCMvTbqThAR2A/tm6Tz0yRmsePdWQKmEC4EaGq23F0DxR
 9nhLwK4pMuYC0AX8P8jwHU0g50Nj5PNEfw8AK0W7203ZtpzerI9ZjzumZYbd+ZiNdY
 JaeSA3fpnhdOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mVOUTMcn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyroute2: add missing
 python3 ssl dependency
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

Hi Yacin,

Thank you for you first contribution!

On 26/08/2025 01:41, Yacin Belmihoub-Martel via buildroot wrote:
> pyroute2 needs _ssl from netlink.rtnl.probe_msg [1].
> 
> [1] 
> https://github.com/svinota/pyroute2/blob/4205dfbcd0fd4ac7ca78196a83f411906f5a5d72/pyroute2/netlink/rtnl/probe_msg.py#L5
> 
> Signed-off-by: Yacin Belmihoub-Martel 
> <yacin.belmihoub-martel@silabs.com>

I applied this patch to master, to include this fix in the upcoming
Buildroot 2025.08 release.

A similar fix was also included in our "next" release branch.
To better explain the situation, I rewrote the commit log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/c399b6d682c480512622d71ac2317c8494d2d73e

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
