Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B5CC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 12:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AC82817AB;
	Sun, 23 Feb 2025 12:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fV2n3MFcnMQa; Sun, 23 Feb 2025 12:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0E781852
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB0E781852;
	Sun, 23 Feb 2025 12:13:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7A58943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C280E40F31
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X38lH6OfM6Zg for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 12:13:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3E8E40B65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3E8E40B65
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3E8E40B65
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:13:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B09452003DE;
 Sun, 23 Feb 2025 13:13:32 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 13:13:32 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 13:13:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Baxiche Su <baxiche@gmail.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Roy Kollen Svendsen
 <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250223083610.14229-1-bernd@kuhls.net>
References: <20250223083610.14229-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <d0017d805c0ccf20534e68cad4fabe25@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740312818;
 bh=sWCdMKItUV0VFenfUGSS+5p+Gbah+s7JKlbP/OXly90=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JIWMeuUlwUvq4nMsP5NUbW3zlKUdy6YxNAQsMhIvm+KdU7Oj32SKeg6AUtafS957m
 uoG8hCUnXpTYVwItUQlvOBDTkpFnvS18m8wri+mZ2yWQM8fasvaaBNoMrw7otEaOwM
 YU3VdYErKs+PTWZYOyEk+0dPlbVos9D0rY7odLBa6tcAeXok3g8l00aNJNoX/pTnZ6
 E8MBvV0VBva0hwsfP5jit2BsVfzAF7+AQ5OD3Y5Qdz8OosH5H24SiTsmfoBfCZqzBL
 ZpfUGZY4/x/mItNg55JawEbRBAm891EzqFT6WDNPwAugxpFDhEiGVtdfKlS6xVAd1h
 17EFOWzH/kqsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JIWMeuUl
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6multimedia: fix ffmpeg
 configure option typo
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/02/2025 09:36, Bernd Kuhls wrote:
> Buildroot commit 553c55e9bd3cfa05cb84fa4cdfc5d25d51c3486b added this
> package with a typo in the configure option to disable ffmpeg support.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
