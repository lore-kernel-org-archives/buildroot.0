Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA36606A31E
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X9PB4yOU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6C65406DA;
	Sun, 15 Nov 2026 16:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6dDABnqVlXk; Sun, 15 Nov 2026 16:57:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E63B5406E0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794761870;
	b=DTGsMkZ/0jpZk7e5KHQdu6eCc12zHxPmfVJa2TcpgbSblheW2EDoOjGLJ0b7lPkCS/pl
	 Mcu0aHUQzvjQ3CVDTdpyibbdei2XMAcv970rmFPu0hoeJ2DYfUtfdNfMlV4OVOefSBapY
	 0RtcfaChgbi2xgn2aMx0+Q8E3N0TryO8LmX1BLydvKfq+2uq0Xt1jqIQpSs8iWaQTYlRc
	 eAbZDt+cpNnLm4bljGnLxoTXuz0noqSv2fs4Wo9xz2s5A/9/L4WHIpK5fNNXSupMq88qC
	 vzYmyEpJGzw/u+j4z4SqGThEyBcPmltooID5fA+6uib5kKs4gp2RUgj6yxFXpQIwnQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794761870;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=H5mVVFB3ky7wqBRNONiPgBwU5IJXonrdh4DSoSsIzHM=;
	b=Tb7tKg2CkfHxYnfGiGsQcrPrGy7pTQRYjhUvVnKtwUiAqfo5JKRbdiias34JniBvvYvq
	 g3kQub9vb0mUfnUxnXg/Fcszn7ipO9EJVJZZxHKW22UMzhNn+1b7GeTXkybNPYDFd56Cu
	 sA06h9kh/dqEdY/hXltQV34FoJ2FjFnyNcCdAOY1qK1p9AdFCNs0BTAP21vYGCm+XVp1R
	 JlOUmPJ/HiPaV4NSraXv+IIUC+7E4lOaa5n3u2D6+8rLnXGuIZhfZgFzvt+biU2J0Mxs7
	 8qO/XwHg6yYTQQtyj67kAZfettuA6Q7f28/AQ2EgsPdKZjJyo5UhtIxrpQkv2i8NfMg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794761870;
	bh=H5mVVFB3ky7wqBRNONiPgBwU5IJXonrdh4DSoSsIzHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X9PB4yOUDPCNgJLTOW0XG9jMsbzKfWybfTWW4kLCgqoKGrKF1ta0Qs++MvkU4/QKy
	 EKETwhYb/YbH0DeP8E39iAHj+MfLdHH/rHVpvKtl9cUVmpxJbAxHRCsT6NOlUuvpZT
	 yst4arQT3voRfF48SXO5cSuOFmnR+cozEvCNOxy1xF7EKOppJc/W6fBaydhW07BJ4V
	 duEVbmuf1QlAjZbtiITZPQLoTL05Wd3XNjpw+874qNO+Nb5VFceJfnTFzB/h5xXpmk
	 fjvDNQFSNk3+onZ/R3P0yGLJo2HmFxsXO69DqaIaxeIgX8mq1MIeBo9dMzJf5LBniP
	 C/rVdC2RZUl6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E63B5406E0;
	Sun, 15 Nov 2026 16:57:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17FD31E7
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 16:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14D1E406DA
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 16:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRq07xX1h-YG for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 16:57:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C7605406D4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7605406D4
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 16:57:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4FCA213F88D;
 Sun, 15 Nov 2026 17:57:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 15 Nov 2026 17:57:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 17:57:42 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Marek Belisko <marek.belisko@open-nandra.com>
In-Reply-To: <20261114210449.1550804-1-giulio.benetti@benettiengineering.com>
References: <20261114210449.1550804-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <4cdb08bd211b972c750f4e11a8c33dee@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/libblockdev: bump to version
 3.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Giulio,

On 14/11/2026 22:04, Giulio Benetti wrote:
> Release notes:
> https://github.com/storaged-project/libblockdev/releases/tag/3.6.0
> 
> The crypto plugin now uses libdevmapper directly, so add lvm2 to the
> dependencies of the crypto plugin (it was previously only pulled in
> indirectly through cryptsetup).
> 
> Refresh patch 0001 so it applies without fuzz.
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Considering this libblockdev is a bugfix-only and a security
update, I marked it as a "security bump" and applied it on
master (and next). However, the udisks bump seems more
significant, so I applied it only on next.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
