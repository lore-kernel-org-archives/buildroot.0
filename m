Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC97FD005D
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 10:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB13283AD9;
	Sun,  1 Mar 2026 10:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnBaOJk22IAc; Sun,  1 Mar 2026 10:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5789483AA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772362271;
	bh=IqibAaG6HkBTsCzav+Np5s2eHpx43wktrnkwSpyOM5Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h9LKO6Jnua2BJJNcrcWCmnop+nLTtJB58sVAq1lPGW59NHUMmceofFKAZXNFt3Out
	 enp2dWfJkvv6sVqbPcHk7fpU6ZvPeUOhd1+jFl5W+YmGI0apPbreOj3BP7uADj6cJ1
	 jmiC/1L29uUFlIDWCLU3pC5T6AO0f2kGM1azh3xAUOOfJd3r8HlwyLWZKDR8qoQmvw
	 nvxAmhsF30ObKLVvz6BrJITlZNtChTKh7f1EG4phiF2nk2an5CMClUg+mI2PNi+0Oj
	 w2tksDLNaY/vHoKt9T0MawFDgvDGsg7BhWsXuwPVXeYmIGHLeDpEM3yNoiScu56kSZ
	 fKAfcqTFAodaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5789483AA3;
	Sun,  1 Mar 2026 10:51:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E072B24E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5CC083AA3
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPdk0EMahEVE for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 10:51:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 064B683A9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 064B683A9A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 064B683A9A
 for <buildroot@busybox.net>; Sun,  1 Mar 2026 10:51:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 22E8719F738;
 Sun,  1 Mar 2026 11:51:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Mar 2026 11:51:05 +0100
MIME-Version: 1.0
Date: Sun, 01 Mar 2026 11:51:05 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260224074414.337942-1-francois.perrad@gadz.org>
References: <20260224074414.337942-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.13
Message-ID: <f9a6e2785adc29f2645e06e7bba80945@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772362266;
 bh=RUFnI2mH/ssMh5gAAvvSQXgLup09XdtP7ebuDXVDheM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tNi4rMKPFo9QZASjouj58A02FiTLww7o8235pyyOGiuG8AYXDnlnJI4VQKU8C/+9Y
 qaQLJELUhYoe9tgvn21whg1os4FcLi0lSR/+xObvM1MWgLWP0XM9UNLfCmtDkqRwmx
 QPr8rRVQVFLi3/5gnAUergRlBFIq7DuOu2d5sBT9BsxNoyyQaxd4hexeFlRvu79iJQ
 zgDpzTybnD3ZO82Su+uaQY0J/bOHfDUNoIoDjTSY9IpkMtI6y8p8fNUvGWJHT1jwdo
 qp/3s7Nc/h3dRAmmdEiWKFaJBh1yOZEmKGeOk3S1ZM/BAGoweHfCtb91p2Dd39SWxG
 NhO8VZuSZAn9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tNi4rMKP
Subject: Re: [Buildroot] [PATCH] package/mstpd: bump to version 0.1.1
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

On 24/02/2026 08:44, Francois Perrad via buildroot wrote:
> remove upstream patch
> 
> release notes:
> https://github.com/mstpd/mstpd/releases/tag/0.1.1
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to next, thanks. For info, I fixed a check-package error, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/a773d00904f9ae543c54b44ba02a2e8b0190adb8

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
