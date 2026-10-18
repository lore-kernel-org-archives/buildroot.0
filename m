Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1520CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B805B60693;
	Sun, 18 Oct 2026 14:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGIpBdUsxcaW; Sun, 18 Oct 2026 14:27:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EAF466062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333675;
	b=Kc24jo/aV/hT642lXpx1+Y6FnNG0XLg8P6lMA7NjiOAtmBijE4liSAKpw1+mEPnCb5gZ
	 yZiBxW6onoIJ8j/g3ED/8O1eiploY+LoHUJkphtGOhEZ4bl3AXGrxH/K5YRmeMIGC+Ck5
	 QOYAGLjFrFp8+DVAbRToU1Hip1iPKAGcmXsDQBDIEerH3lsYDf8b3FJZuGnQIT/rUGMev
	 XJxNlniwWVN/bRj1UPc52wmXDBOzWpXQKr8avPMxAlWBkDIu/0K3cCoOI7ACXv2uJMSNh
	 SkbxSIS+VGBT+XVvotHi5oh6l1T01uRpCl42FjrUhty+KgD7cp9GYBB9W8wzGeToXtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333675;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=DtQOqu3xNgK8GxNZeo5svYvMc1DN4HWLWbGOlF+9dqJgIskSexLmr8Uak4eyk4g9qzqJ
	 B7KI/EB6CbhiWh1FKv1ePyYTIQA6ZUflIrCPbSp1kt2Z2+KdvIKzhNdOYi5+6o1mNVF8L
	 E5xNW6A8w434FZqVzYXqubEaE+qMovFFWJiqRNew9AsIFxFTGVzXwDYETEoOY/EhbjDpA
	 bIkf6EHhnC3DUjFz9RuA3OwO83yTRhf+jdXwVJ50eokzekpgQ9SINMH+t+oTClfYF7MBi
	 W86A69VkeqG5wrjr2MqG82inFthUQZAchK5cJPDIWgIJ+jTABfQDfy5LpiSekaHZ+gg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333675;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZvLt/wfQ3r904+d02W70qUJJGOTbOHRpf2iUDAdK//syHieqTKFQhulAV5gGbokzF
	 FmDvI7jIYkoE2oEmn2IxQF2BZbV4GUD5jL4j93qhRrbdetr6DODSrCdqNfsfoLVhLg
	 2e/xrksH4K78nLnapwbsdtvujxkeHuf4MkgTqNpUTjT6keRali+u+qI0Xmg2txN+Hr
	 rlS0Bbyatwu/6n/z/+jJdIqkvZLJXBTxT3kiRIHZOkxkdbloSOkzYUMdZwVzJ3fe7u
	 q84hOhJLIhCju2VYQ2izBbGQnl+Zv7+rIluUMyCLrdvowntZfjrQRONag0+AdRG6hg
	 REBnSTdKV+Yvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF466062C;
	Sun, 18 Oct 2026 14:27:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07DA42A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1D756062C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-lOr4Hhz-ZX for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:27:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 371936060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333673;
 b=ewqriZdVQKF58qICVyRmsYvH+no5SV6dQuWak4Gjk3QW9orCOIKKtyH16opzNFQRssTR
 /jpTM+ieegiCzQ+e8uzxvomlA1vMvD2uy3y0u816BO3/pL5J+Hj7Xu6JHb2dBsFS4B8ZD
 mO2vqBgpCJgwpK3rXXMNMCFcJ+Z3qLy+3ct7EzcrjwTky9E5KgJmCTbNH3MwsXldB/o0I
 HCMdqcWpHXBBlCarDOG3f4e0bPqzAaq+GwXbNC/iMw4oQBMrVWzV4LPeAk/7njGN+nZwN
 DjMACJ0z2PNaKnDJZaqpupdC0QUvpNxfrN0hcJhORUZldPC8zUT4INGluItPTMrA/9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333673;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=PN1j1c1ztPPfzWV036Vncjt4JfQPqKGUqobH+k9qVF+glWj52LcBidvfvdEUTk2FoJs1
 AjK5+UQhcMss2YSaNB2GXmUTjzfOT6NAfLdWw6p3B/ld2uZLxvbNsLpbxwez4xA87DS7j
 SAee7yuflTMmK+VS/ZfUhVM7WGNj2rKRXeq2Oo2PHInyHJoQMooIxLghwSY4Wc4avxzBw
 ah7q1QFLnlTOpD/B7dxmyS7OpHOe5l+fQumIJsM7IqWzPoEJ2S8LptmnttdiXhE2JC86l
 7XCzI3MmVB17Y/sykm9bk/ZkBVTLEmF4Ysnm2PU51folLheUeoYN8GuMYqjdHSeD7hQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Jba2wCP3; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 371936060C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B0C71B0054C;
 Sun, 18 Oct 2026 16:27:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:27:48 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:27:48 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261015215210.3426895-7-james.hilliard1@gmail.com>
References: <20261015215210.3426895-7-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <3b9acdb5b505c601d5a98400944ad4da@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-git: bump to version 3.2.1
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
