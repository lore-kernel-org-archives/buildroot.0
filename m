Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A93CA1010
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 17:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD718229D;
	Fri,  5 Sep 2025 17:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxS2BZaJ_zEQ; Fri,  5 Sep 2025 17:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A9F582294
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A9F582294;
	Fri,  5 Sep 2025 17:30:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3606328B
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 157C140E4B
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUYPV8W0IPt7 for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 17:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C84BF40E52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C84BF40E52
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C84BF40E52
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:30:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D82E72003D6;
 Fri,  5 Sep 2025 19:30:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Sep 2025 19:30:33 +0200
MIME-Version: 1.0
Date: Fri, 05 Sep 2025 19:30:33 +0200
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250904211753.92305-1-osama.abdelkader@gmail.com>
References: <20250904211753.92305-1-osama.abdelkader@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d1aedaa8a326c1a201b9d5be32f72d3e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757093435;
 bh=ZH36YMP4CbRpR6rYCc8LjxtHWfbLIcs6stY8IY8iLGw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sB2dyOIOz+yz67zfJgqQnGHxRV9ra+v9krYY4oTFmJ1UYgIOzjOviUOwcf+jDkdrC
 K5hI3mmBrIAePIVkT+kNAXmI4huTh2n6ry9pVbuzur86aKIMhqf6sKSxOjUedlokf5
 StrswSh0iT5pIXQhGVE+s4N5uYokvCozXptxx+toYWRf88USg4Y7MnF+7lQI8/sbjA
 sWvAevz0ssNrm+0cJu1FRSeqBp3EcI7ruCbAHGYeMWojzf3micbTUKl3nS8qlLgBOW
 FPb8dgnqLNGDwoBnhEz4VucLnsJ33iob/s13n6+CKySsEtdpX5yEC9TrNscQuktdEz
 gr/V7T4M++gCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sB2dyOIO
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 8.6
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

On 04/09/2025 23:17, Osama Abdelkader wrote:
> Changelog: https://www.nano-editor.org/dist/v8/ChangeLog
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
