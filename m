Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239C2C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDF3480F11;
	Sun, 20 Sep 2026 12:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4j92gSFREaV; Sun, 20 Sep 2026 12:30:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D220B80F16
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907435;
	b=jyKHzhU1mcgOtR6ldnyXCxGGUS9Z7vx0BfjnD/hpCRSx65T7Z4Gp99gj2U57pqBzTqsh
	 RJ7BroyFg2mg6YjgkGrPFdAnJH6t6iavgN3409T3977fNg6sV4YcPod37equ8ScwNgrgM
	 YLVbSt/yNngJoC0hT8O+8zfxcUSiX6Mlj/qi3YvOwyYJB1TOKblPvQnrndKt+WL+hME4A
	 9LOajS9hPL8VageYaz8pfqPnlP6Y7imhpOfg+Yr7lvsLZ7SYv/+OmpXZwdvO0qE8P3Zsn
	 Oe/rE32auaK7nPHdoGEM/WvvwGD0Td2HZCk8z7rqhwdE/UPRpvu/frRyUB+M/eqq9rQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907435;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TsbxqKFDJyaJABiVfQYSrmTG5ezQ+T2jgWxXpM8aKLc=;
	b=nfXF+F2CfM6fAMrVl5aX2kUhtzEz1bdewKKPcFDjGsHxuFlTS/as1oigL5AJiVYyNnCC
	 XN/jODKefLFxV6yvXKTBqUK/1qISjqERMA8KG7h7Vq8yylkhJNtK7YJsZSiwa7ZmH0Vip
	 6QOMbvjJ/PkodEseY0Tb9BpvSzq26VNpeD92i8vE9pecop6kMn0ddVdR7Rz9hCzzDDmwS
	 PzrU/Nu5+MICZSEK0t8Q1WtAdlhMk6P9J35nSSLenw8XXNUlH0a5k3/noMpinPvtyxrhJ
	 RmnkuLPT/QByOomdzevPp7y+yE4nnicLd+fV2H8XuwDIktEPRx9Vm2dDiDTsU4UFQWA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907434;
	bh=TsbxqKFDJyaJABiVfQYSrmTG5ezQ+T2jgWxXpM8aKLc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GTb5zQ+DrXaDuiZG8ztJoTqYIqgu2LMjuLG+59j2yXefCrfm0vqiOh93XFr1w0X4T
	 JUZ8zB8ytCNyMxl1nN/HKqkE45BLPiEawvBXQV6+fHy3LflNWO17NCYNLz9URaZeWJ
	 4eVhANFz7LsXT1OiUI1UoK/APTf/J3tWtQKN1YUm7fdcaAaHldqRGkHpBm6pJqWEiY
	 H3mNJZ4D1VshywqDsDmc5nD2ySJBDEOYOOq2p2uFo4KpiE7AqAoDmHOVyUR2un31iI
	 C2uCnevzblkxo93e8fQi8aA18zT+J1BMU7ZD/Sb3oLnYB6dc6bISeWLbDENOUo1RE0
	 FRCRyH3lP9Whg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D220B80F16;
	Sun, 20 Sep 2026 12:30:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F1BF224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74E924081F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOFwZvtcPyzY for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:30:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 340C7407D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907432;
 b=RI3rz7pq06WEdiZFCnG9T1LlXZI9sQZ/OvrgMmHzPBEb5GxBaQQT0w7cFus0dvOp3MTZ
 B8XZhwQZETEpozF/qevMs6NEMUst0oj4XXriOCVvMzGJhbtWbbPTAE85hMuibzMy7lh1n
 pr/VI6MUgcKymBRk/rJOKSZxtT4mW/yErQbm4uv5BOkFViPQ8Nwj3STjDv6LSlQNCsOrc
 iLSbXNAkmfgwHB9f8RSCcfyGvZ8QDZIbY32f7luzINfnWGU7551BrQuOSAJ5pfH4WMVJS
 tYPMol+COscQG2LfO/R1bRSYqozdVJAwKxtVH/WZwYNclPp0tOX8qLQXSIzgSV7EzsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907432;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=fKnarbP+Uif4ulmMjNjY8U8/HWlWU9KjREWj0zr8sY8=;
 b=R5QP5wc5E55EsLN+LGZHCUifAhbl0/TmjV5Br7yk/bn2l3sKqnKKgxgIzU2Hx/VDwVkt
 6cDtTYY4vW0IGD0Hd28cTPMImFtOITt0KVljMatZjx+nP7Ti8rMrYEEJ8kCDV406X86Bx
 3e+14LWpl2ITomU68cwUVEXUqT6EX2WgSzTA+zbbfPP4TL+lVinySam5PuKaS33rBbu+n
 eSjqrIQd2a2nMwyiI8xtZZ8O0EzKEwG0spBmJ/CzJYUdGYOM+ucAVThbKIw0c5kgFJJeX
 ipQ3+ovJDFMbRRU87uZLR8G2llh6bwpnO6R2tFCU32I4T+evE/L0eoplgMJovA62aHw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=aC4VvO22; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 340C7407D3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A387C1A0997
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:30:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 77D43604C9;
 Sun, 20 Sep 2026 12:30:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E39D81032829C; 
 Sun, 20 Sep 2026 14:30:25 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:30:24 +0200
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org, Francois Dugast <francois.dugast.foss@gmail.com>
Message-ID: <aq_R0NeHUvVrmm4y@windsurf>
References: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 0/4] board/visionfive2: fix boot issue
 and bump Linux/U-Boot/OpenSBI versions
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Sep 19, 2026 at 06:29:00PM +0800, Fengwei Tan wrote:

> Fengwei Tan (4):
>       board/visionfive2: add rootwait to kernel command line
>       board/visionfive2: remove non-upstream Linux config options
>       configs/visionfive2: bump Linux to 6.18.51, U-Boot to 2026.07, and OpenSBI to 1.8.1
>       board/visionfive2, configs/visionfive2: add support for v1.2a board

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
