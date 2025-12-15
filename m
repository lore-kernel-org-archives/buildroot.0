Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C555D41D74
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 11:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0F3640944;
	Mon, 15 Dec 2025 11:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eN5V8RCMXwbq; Mon, 15 Dec 2025 11:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6AF940711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765798384;
	bh=AhEFrb3RioBVGleRNPBzUD9EcjXVxlsNro/tWmj+Dio=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UrxpShcjddbK23nwO4YnQsOoAiel18o8cigaHy5I7cCGk9QBuhbJU4JXgZPW0RLab
	 f3f7D9LNBWmh13jfMoNPtd6FtuiZQou+6HTJ7LkIwnH+vFCNMEO+7nq/1G76ymcIv1
	 pY8/Mh5GASB2lYhIX+M8pvKJo4pnOlCPX5Rg4k2A7Q4dAPnKZEQcNn57I/nGSszmfZ
	 6h6+bU/QsL6r+5Ik4nkQ7KvgnvM9r9Z31cX4J3jLryZjjOjPV02K8GpgfMMKYhRqMY
	 YSS+kbX4fQI3Weka6UGxJPOgjMxvmGmlZk6sZt+FurXeecMGVYaoHWEaAswqBvK7wC
	 IETjiQvVpoeSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6AF940711;
	Mon, 15 Dec 2025 11:33:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF204118
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0EBA81414
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fg9NAIEPfBLS for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 11:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AAF0A80FAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAF0A80FAB
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAF0A80FAB
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:33:02 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 74F3CE00350; Mon, 15 Dec 2025 12:32:58 +0100 (CET)
Date: Mon, 15 Dec 2025 12:32:58 +0100
From: Florian Larysch <fl@n621.de>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 yann.morin@orange.com
Message-ID: <20251215113258.wpxd2r5iwfubkvvz@n621.de>
References: <20251215104452.480722-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215104452.480722-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1765798378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pZZZY6toWUQlbL/cE1lXltdVBW68OtsOV7dUaFArpXI=;
 b=O2BvRikYsCFBl4XYjVB9fGd7gu19iX0D3LD1ttE+SWjnccvj2u5OcsM4MUEJ8DOZ56NpzA
 RsZbGzk/VFOYqbQnuUFTmX76WSnHBd+f9gS91/KwJ6xig4UNx+rxE/vW5vL02dXVSqPNnv
 b+jK6z+LoSQrBWzzYOYpoZEVsud+1Ow=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=O2BvRikY
Subject: Re: [Buildroot] [PATCH] package/libconfig: bump to version 1.8.2
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

On Mon, Dec 15, 2025 at 11:44:52AM +0100, yegorslists@googlemail.com wrote:
> For change log, see:
> https://github.com/hyperrealm/libconfig/releases/tag/v1.8.2

The release notes are a bit of a mess (they don't mention the CMake
change for example), but looking at the diff between the actual release
tarballs there doesn't seem to be anything breaking in there.

Reviewed-by: Florian Larysch <fl@n621.de>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
