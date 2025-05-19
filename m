Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E28C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9166160E58;
	Mon, 19 May 2025 16:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYnrXqGSUvmp; Mon, 19 May 2025 16:50:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C681560B09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C681560B09;
	Mon, 19 May 2025 16:50:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 402FBD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D2EA60B09
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mP44PkI95RqJ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9957160AED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9957160AED
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9957160AED
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:50:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4E2B52003DC;
 Mon, 19 May 2025 18:50:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 May 2025 18:50:42 +0200
MIME-Version: 1.0
Date: Mon, 19 May 2025 18:50:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250425201824.141234-2-thomas.petazzoni@bootlin.com>
References: <20250425201824.141234-1-thomas.petazzoni@bootlin.com>
 <20250425201824.141234-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b0696add694d98d8f65188836dd10a32@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747673445;
 bh=tEqIGHm99XmctNorDpx3P7BBgD4zx6HEYxLHAEPnXY4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nrHxDjzx4MJrMThAZwSuE9LZc6eVuJPDk8+T9wNzFdTa9GPiMZHhhtA0frNM0YocV
 XQMmC/3yHskSFwe5Q35dtlb1EOFVgjuSLAud/5apPR3ajDVGLTAsvcIEj8X/Mef71I
 6ggkab0fNRMbPVLeDrpy5pdCJYcZypIJV7DdeFlj9gQTtMMzitsOOO9GdwVMB+YoCS
 Q9eoa8XBl1cWgV1m05FVr367ijYOJtSMVXJ4l/qU7ecl9mdoTKggDEyrUtlE2dx5dR
 S7E6315w1Urs6YlQ50JvNU5+V+sjuz/rAvqyAWusbAAmIh50Eg6hm6aHxWWdaD/7Ui
 PRhn5Cy8EcWSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nrHxDjzx
Subject: Re: [Buildroot] [PATCH 1/7] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_15 blind option
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

On 25/04/2025 22:18, Thomas Petazzoni via buildroot wrote:
> In order to add gcc 15 support in follow-up commits, introduce
> BR2_TOOLCHAIN_GCC_AT_LEAST_15 symbol.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
