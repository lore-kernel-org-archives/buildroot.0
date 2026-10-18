Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A146CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F1E060611;
	Sun, 18 Oct 2026 14:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3k0gi4sEsWI; Sun, 18 Oct 2026 14:26:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 731226060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333592;
	b=oNVmRYDBy7ibucIUqpuQ8rYAeOG0MvWXXAGfKQgdDK/5IhQMp+G/AwmPAki4AwkDLeQ8
	 1NBl/ZxCZ6HZwCmc6fiktOs3v/wlgY8G5kSjkysQltPsx2wELrsmws+reA+43fDSChiN8
	 XicAKsOmIsn4A5UxUrqoJXY3mpFB7dx2OxMusJ6b4OhYFTyccxGMrYDnm6NAMwoHHrglU
	 rO3RT/9eHBy9EVDvaYMKcanNugh+zT/X+odvgUEFd0+OIP99zN6Y3NJjoSp/ypMs+aZKJ
	 Ub1+hMqin0vbZS7s5LuxmOzCtF2Xbl1CDEA3AJlOGMs5L8qLVeQmDKHNy7i8+sm3xHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333592;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=nTy6aC0aCVE3Zpb9+XMoyH5wezZxhVeURNClWlLL+qWycoZEfCpkm0Ecwqf7hNsS9Msj
	 CUeTU4MD3Z7FJ4rNJmVOYTffHFLKO7vKOLFgTIzewspgbgbOG5OZ4VPzlXcBjtExs+CR8
	 cnaZewqs2lnwVUS531cc2fwNIhssW0eMQsZNRn3i4Lie2dKZB4PpcVMB4jD5BxQck/HvV
	 HtHgO4vVF8l71M9lc3t31LVRu8S/+u0UkO6SFOtxhak35kaXzRQUH2W6B+zBfwkfKC1pl
	 br14jOKqUuxgla18TD84657dgZ4nuQvt4dasxvieuToKchhvVZC/C9eiP0ExwyWQpTg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333592;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ikdkEQdXiO5nYAJ0xaIRxOtJzA56uhCTUwq7ZRVUtNYK8/ghaHv1wsACoM0SwBi8d
	 AFjOmxlBdgGWRafWTImZWnjLZGHOicO+peLXLatEJU//xhpJdiAUgFU7Tg7dxVJeRi
	 k8l4q5rhvFaXKqo1Cmw+ARJ+RrWIzSULcTyDai18/k9pbU2p9bFsBepmwANCngXx99
	 TqSZzVjhQfDzXf6NsQGDFVjb18ISP/1a4JAvktWoYMEVOnp0yeg2FGg32CJ+MC6/V2
	 UgAIdvYwmf4Hh6gWf/JgMDLlTBeazNZN6ZAiPH7i4SH76VmcMitB6WdGrtO0s6thwK
	 PpTMl+G2zMXig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 731226060C;
	Sun, 18 Oct 2026 14:26:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E0661
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66FFA4009E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7_7u2nPlNBb for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:26:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A87344005C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333589;
 b=hntbE1/FxNo83wIoGHuovbWTZtBCv114tMOqwvjOGfEbgVhfHz+ucWn+oIZ76KLBYAVh
 2wXNGUGwoCYIlbkEuAz/aJAfRMBiftks2RD7MN/0+SUF0g9G4ucJ0Kvov6JD46Plgl1gv
 R/0hiYo0yFcIvucnEaEnFZMbJAE2ioa0Qqr/gwAAq9EsTZs53dpJ7qbXnXi2D7R+BNVuS
 iJRH+zesyBVBxR8ClrJfU7p/uZTQmwUeSH4L0Lr1rXHoPLWYBkG1q8olK7H5F8RMmZjOz
 1Vku69Dgrc1Zpolr5b9YzImuLfQqWBCfqOx3RDlaoWxMvG7dNaXeNROWubkcbDGGgFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333589;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=BQ++7z3gn53wgv8Kk6vTS/ecSCrB7ep4Tt11a5pdOrMyrRZ8EvDn4g0FQq4zUygZTnqY
 m5dG0W9xoOLiS+3eziIyGxxCbHUVqyet/K97Tp4mQaEj4i4y3BEsJEGY9dgDyOofHBeSA
 eJaXBPoQhq+un+JZVE0An95bJy+KwRa4yQ4gJ7x9oTRnn1fp3NgzBktpHMrbOv3MEin0d
 YTqZyw9edAMTF5dOVd6vC6pNniajBy5DXH/rhed8QwE73InyqIk1Wzc6kdp2Q7mjzjHYI
 3TJnl+pvYvDlDtdOWmXT0D9+SDU9LiwiCjy6tlwG7qA/2yrpea2+DFR2AfOvPWCObnA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q9U4+RCl; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A87344005C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:26:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2E2AE19F574;
 Sun, 18 Oct 2026 16:26:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:26:26 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:26:26 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-2-james.hilliard1@gmail.com>
References: <20261015215210.3426895-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <4ce03648a72ee4d3f577523525189e44@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-dunamai: bump to version
 1.26.3
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
