Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC4FC54F52
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 19:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90F0180FFE;
	Tue, 28 Jul 2026 19:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7Mh3R1nWBuJ; Tue, 28 Jul 2026 19:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1701A80F81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785267584;
	bh=fta+d8OetlgkYyKtYAaeDoiy/T7spqfAUSkSJSw+W5E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LUWl4I3ZTlE4U7Tozpgo4EwDfMWpYjgDdv1xUg0iQbb7+ltZ3SCiOc2SpxvSxHbec
	 MeFrH2NBocADn6NKY/TGA+MeWrooy6cFlnPmw6QZzjQAeeV0jh4Lbby4vCLY/wimms
	 dfRNy2faoHQAVHk5g84qX37B2f1AO50JAbtNEAwJnthG8Djyx+YwT9Q6E3dbg82ZrL
	 NzigQfIIyZjuYnkVhALBLzmwTCUuCfbE6wJfgqhAzjfwkiU5OcfL0lUk304wd5cthh
	 r/cuoi7kYbXIWQExbqfI8jBZCELFlesDpE5adJSwwGU09JDmymsgAV7k/Gnu0Yw1fB
	 PUu8nze+OtaYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1701A80F81;
	Tue, 28 Jul 2026 19:39:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6706C350
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5925540A57
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLkXY5wyFCqM for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 19:39:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DD6340A55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DD6340A55
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DD6340A55
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:39:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id ADF2D5FFB1;
 Tue, 28 Jul 2026 21:39:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Jul 2026 21:39:37 +0200
MIME-Version: 1.0
Date: Tue, 28 Jul 2026 21:39:37 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Kadambini Nema <kadambini.nema@gmail.com>
In-Reply-To: <20260727031519.104057-1-nemaakhilesh@gmail.com>
References: <20260727031519.104057-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <98878526f04d49c5d7bb3766734fa143@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785267579;
 bh=FcT7LILw3j9+42N27aZTSLHRGGELvtMbA3VOzL8b+rg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c07i+FYyXLKRbW7aCCjpY/5SzVRCxTk+x+DgM/Vju62Cs8IeRbNFNGeWkQlcOZwf7
 JBMRPzoFyi91cspTHcb+9r9uGuqAyRVtuM6kegMCwo2MTvZfXgSW7W6kCdgv6Gq0V5
 MQwBkQs3Pf7ullu2eysQvPiObhzZr4WJO0M/n2WukfE3FSSBcxhFbNGkn0uQp6fi+I
 33+iK8KPJ2KEPf5Cb+2X8SmWuMkOceS2oPFDfYsMVlaYpZ5mPV1WQ5PDVuPuFpncl6
 NuLHSarJG73naC9VV0V9e00v7hyfLYzXiKUyrsTOLa6bfEFArPqrn4CfS/lmzYb9Xf
 gj0erXRESsMAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c07i+FYy
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.61
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

On 27/07/2026 05:15, Akhilesh Nema wrote:
> Changelog:
> https://github.com/pikvm/ustreamer/compare/v6.52...v6.61
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
