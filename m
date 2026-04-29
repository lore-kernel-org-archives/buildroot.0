Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0914FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 20:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC3608434C;
	Wed, 29 Apr 2026 20:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICBsxpA7bEDg; Wed, 29 Apr 2026 20:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EADFA84342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777494840;
	bh=UpmWO53yvOI9Q2J+kD8X2UvHsk6wDjUP6EkYYyALp7s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aqZyzN5thRsvXfIjnnXHj9yl7Wx7kz04uD5WfLIzzyMr8ewHfVtMUD7FKZ0zeNcFb
	 H12Ubk5RPAfVbk+kg9i/sMOWwL/k9tb6y44do2a0HoL3T3z5EXACfmE0/nKHfOW9sa
	 WdJaWq15A2+9qI7XYtslZlE4TpTnidVYht2g7+IPHe0j7IsXumvIQIxtItHIgVHcAJ
	 qSw9Q0urjXbCER3KYoCLNA4BFgCzu8cPUUDBQkfPcQzycLy2sf3StAJ06BF+atFsV4
	 JOH5dsT/8FbTxG+PJDIsq3YA5Xjq5V8bkKYhR+ao9y/vbSxdmJQK0ddM9fBKYLne+z
	 4daNPOxQ/CFMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EADFA84342;
	Wed, 29 Apr 2026 20:33:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F89D18E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8172542415
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_VrJ4mA_B7B for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 20:33:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C161340F7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C161340F7D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C161340F7D
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:33:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6F2706013E;
 Wed, 29 Apr 2026 22:33:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Apr 2026 22:33:53 +0200
MIME-Version: 1.0
Date: Wed, 29 Apr 2026 22:33:53 +0200
To: Michael Walle <mwalle@kernel.org>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <20260429092343.979523-1-mwalle@kernel.org>
References: <20260429092343.979523-1-mwalle@kernel.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <a6b859f93fe88a018ca8bc4b4d96b2e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777494835;
 bh=pkPFZPa5aJ36Rs74UV1qcJzJG+V+B1IqU3KYLTf3HWA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FGCJuedX94OYuBuKE3g2x55EJyZ+OuSCrrsdeO1j47pzfJBCnX4lRlnnWyyQNd9MA
 KetsqwkA0ATIFzr9Cji0Igemn2ehLNKHIpDymE9GqYUf+xmzl3DiVZenAFsfW5x30M
 aTdIEP+y6UYXdGRdE4Au+b+tOOHjGLtpgz3gQSQKkqg2xMwuIG9q8Dy7QYr/e+mSlA
 8E3VK6zYj+irVA5cNcTPg2z1kPsBqSbILiOyITAa81Ml2xgtxQTsOgbgnNonL73BPI
 mDt3jjtohSNk9xXqcNxw+EASaSbu6GPFUORVzp4e0m6wvOSgEoz6s7m7vpGc1FlTd9
 2R512C5SdTQvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FGCJuedX
Subject: Re: [Buildroot] [PATCH 1/2] configs/kontron_smarc_sal28: switch to
 external Bootlin toolchain
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

On 29/04/2026 11:23, Michael Walle via buildroot wrote:
> Use the precompiled stable toolchain from Bootlin.
> 
> Suggested-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
