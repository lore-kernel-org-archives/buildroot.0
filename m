Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBEDF53D9F
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 21:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A5598242D;
	Mon, 16 Mar 2026 21:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5hNk-7XmkMq; Mon, 16 Mar 2026 21:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3413382435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773695841;
	bh=+2zKqNLV+3/KeCWjV+sf6bCYrSXs1NbrflrNe2p37tE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cfXQwjzqYQ1KcEwbGvr0+zu5nS2+G2O01HtlC6Ft7QD1dCq0WBKtDCSPN3qU7Fht2
	 fSJ25CzkW+0uowLkmJZXG9hOFEMIMvxAL88+zT12i2RUnS1ucJkzVAAjHBUVmW/aNO
	 z421gxiM4vy3xDoL9rxq7Kdcql2zA2scrJxiEWRgm6WCsAkz5kJWKCumfv2Prv0vkU
	 nnywvokAH3sIL7t0inqiBQDDmfHtGnpr+kyWhKva7vKnAQ+IoyLLg8mZCettrcvLwV
	 1wZYA35ZzPa/tXmRN6btS4exqPVLTEdTnFC2Q6HuGRSRtEx+8Gk0yZUYY5/k/ADRRH
	 T8SwylN0UVizQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3413382435;
	Mon, 16 Mar 2026 21:17:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A86043C6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A7874094A
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwLuqWqVdpw8 for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 21:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DCBF140173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCBF140173
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCBF140173
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:17:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BE78913F89C;
 Mon, 16 Mar 2026 22:17:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Mar 2026 22:17:15 +0100
MIME-Version: 1.0
Date: Mon, 16 Mar 2026 22:17:15 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de>
References: <aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.13
Message-ID: <e95244bf881f2090c51223b458dff34d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773695836;
 bh=p1FuHiVLrItjM9SZ2ZDUD4kqs4uMTslf84C9Q5Ls1Bc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YEyxMR1DU14Xal2qx6jAnszkDO1lCeptgVIfXwLNNEyBXMVAE7Xq/auSCJNBhjjqJ
 DkEpmL8Duwd9uH1tLSY/435xPcdR2PwDteGeg8N4wVCBAXQlW02f4TRX498DwJyh27
 rJrAjRYVjYhYcUNr6gL4ud1qOgh7rgPT9NyiI9ZjQ2HhVkds99yObM/+eSuAhKdKCv
 HGNUCz8gaOQDGRF/dDtCkJXTbV9/+dueIEObtR+KrGHi4UcqlMe8egE62P9VzFLxGV
 WPvwdqOGUtCZa60Rus3jHK0SnxYAhvLnOeLJQF1gnF14gyCwdehcVSOaWXEq/ywcqj
 170H1uw4YVc2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YEyxMR1D
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.57
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

On 01/03/2026 13:42, Waldemar Brodkorb wrote:
> Following changes made it into the release:
> 
> Joris van Rantwijk (1):
>       Fix adjtimex() with TIME64
> 
> Waldemar Brodkorb (8):
>       sys/stat.h: remove _STAT_VER/_MKNOD_VER
>       fix gettid() declaration
>       add statx syscall wrapper
>       sparc: add optimize build support for leon3
>       sparc: sync with Linux kernel definition, fixes gdb compile
>       fix compile error on earlier Kernels predating statx
>       select: fix compilation failure with very old kernel
>       bump version for 1.0.57 release
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
