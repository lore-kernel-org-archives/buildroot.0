Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB6ACCF9E9
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 13:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB7440CB8;
	Wed, 29 Oct 2025 13:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzC3Xoiz9gZX; Wed, 29 Oct 2025 13:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33D0040B26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D0040B26;
	Wed, 29 Oct 2025 13:56:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47FF1708
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29C0240B26
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00PW-5DDg5TE for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 13:56:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0489140B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0489140B16
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0489140B16
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:56:47 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C0DB26013D;
 Wed, 29 Oct 2025 14:56:43 +0100 (CET)
Date: Wed, 29 Oct 2025 14:56:43 +0100
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Cc: buildroot@buildroot.org, tim609@andestech.com
Message-ID: <2he4nakze3xlvoch6i7omj3txvv6jftdsqix436edyyhap4ygb@6wdm6ympvzff>
References: <20251027033242.1797230-1-ycliang@andestech.com>
 <20251027033242.1797230-2-ycliang@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027033242.1797230-2-ycliang@andestech.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761746206;
 bh=hbg9liZJxlxlM9xI5avPGhtXMQHQaOBB3+i9asLbaNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GIXs4oPgjf7I+7LjMOSn4ax9Fu34uWuVlWb7f76NNyfpA0jTrIFvyH93KuDICpz9W
 FvEpG45vcSm6BNE/czCAzBqWOc13XFIepbEEZQgcS8nt7jnNt3MBZmSJMvP9Bh+zG1
 uW6zLPHK0smNQaofUaCg+nGSGA3uERWK7QAxxO0ALcdDE1CNYyOuIVhH7oorybvmKw
 EOJOeYzJZ1BmZr4p/NBUtvcvAngjpggoefUQUm2Bq8D85H+YfQDBA9Lf1tOYsUifis
 CrwfiOKRLfed+LIIKLTN31kZMqugcpGAkOXOi3IFKpiRqYijGqwudEQAwHg3ftucZy
 Ch4bBHKQtCQbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GIXs4oPg
Subject: Re: [Buildroot] [PATCH 1/4] configs/andes_ae350_45_defconfig: Fix
 post-build.sh Shellcheck error
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Leo,

On Mon, Oct 27, 2025 at 11:32:39AM +0100, Leo Yu-Chi Liang wrote:
> Add quotation mark to fix Shellcheck error.
> 
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>

Thanks for this cosmetic fix.

Reviewed-by: Vincent Jardin <vjardin@free.fr>

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
