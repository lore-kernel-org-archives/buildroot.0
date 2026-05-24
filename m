Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EADCD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 11:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F54060E5F;
	Sun, 24 May 2026 11:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luWMnk1HfHiD; Sun, 24 May 2026 11:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67F4760D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779621428;
	bh=NFBfJkryASbLVorvL+kwZ8bYJ1l+N5xN6C4Z3z7c4Qk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g6412gv57tTA8z03AGe7kLZSldjI/ywlnsYaKc7hvPhF1IB+/BpK6T3yeICOd2dAd
	 2ObIW+n8W0HQqd8MdTnjNi2LPZIC79jVDa1nH3UZyMHEx9RlmkMG1BAg+/YgUswmdA
	 jm+x4uJm7B7TQs4CUMqmEjvxrE/bZsh/9WnawhVAo5HYv+164th5pzrmc4z0d6/WaX
	 2RHUrm9zL1xIPVzhC0kzhhRy2FHBCvIZXqTAZSoHhxFnvnOU/4Ml9HNOxvxJCZIflt
	 N2JIkxgbpDCda1A9E77oUhY+OKZ386DikgIV3bFbLZr0TtksdAhehStBVw7anw1jGT
	 STUuE/bI+i4fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67F4760D9F;
	Sun, 24 May 2026 11:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34DA7265
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AD1E411BF
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_GfgwSRnqGP for <buildroot@buildroot.org>;
 Sun, 24 May 2026 11:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7564411B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7564411B3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7564411B3
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:17:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3B16060132;
 Sun, 24 May 2026 13:16:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 May 2026 13:16:58 +0200
MIME-Version: 1.0
Date: Sun, 24 May 2026 13:16:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Dahl <post@lespocky.de>, Giulio
 Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260524070704.2828646-1-bernd@kuhls.net>
References: <20260524070704.2828646-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <1a0804cdb242206bedc26f9f64ca7d2e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779621421;
 bh=PXfpPKse3MXRG8U6Ck//VNrh0i6hb0MwDdTNfAIdwog=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SfpFJadq7ghrzRAzYcwZGGVC27zw9aypD2r2lUM5opIvahhjQedNAeJT0tNq/PxZ5
 0M2Ho6KduAcyLRtrIW7X5L5P6TtuJhMJxL8h3+VuUENkHlzUNow3oUUNhf57zU5jN0
 J4SDt+9YfGwbjmDP6dSOn6iQF/r88dFtyD+Eq+tjIthefEGYpNu+NkTUlysG24ZLpH
 3YdNMtSpIf/jwccpNyqmDk+EguG7IVfBzAe63gKSYCPSDqRnezFKCp45auRfddil7g
 e33qQHv+WvL0i872ptCUS0HkJILc6T5icM052rHsXS3St60sqI5BeenEa9QscpFiw4
 lLsspjkh9Ft1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SfpFJadq
Subject: Re: [Buildroot] [PATCH 1/1] package/putty: security bump version to
 0.84
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

On 24/05/2026 09:07, Bernd Kuhls wrote:
> https://lists.tartarus.org/pipermail/putty-announce/2026/000042.html
> 
> Updated license hash due to copyright year bump in upstream commit
> 995b63a82bac4f6985958cb92943e807a9f35736. A link to this commit can not
> be provided due to the shutdown of the upstream gitweb interface:
> https://git.tartarus.org/?p=simon/putty.git
> 
> Switched URLs to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
