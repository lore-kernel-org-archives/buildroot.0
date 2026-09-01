Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0857C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 19:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98F2E406CC;
	Tue,  1 Sep 2026 19:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id diQvzXMSB12L; Tue,  1 Sep 2026 19:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788292235;
	bh=sjJgkIhaamEwJ0YOysQYkvAosxF8CiUepHB8f/boOgQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AoqPzCS48pjjemXxFoWOKypjAXnbPAn98w39f+6ep0yTRrsUkW5rXcauuO8A/4yDO
	 zOgLjG03FeTYEvatzx5nvc+Fq1AfMjGTqTBOseOTK6opqfqvSOeqdpBjEIhJlF2JKM
	 yVADKDf5LKAr2nxdLZ1xHHrL3m1+eCDmO4nhkJlVIc97HzAvUjoiAN4a+yDED5LIkp
	 FhHUkw+fSv+MjEJIkJGXHBgUPqCIWu6QT5JtzS+fNU6oLgBrs4sxN1YX9J3fbvWvpc
	 LAhKqWm6ut2yY2XPlU0WyWeGPvqu5OQfbNGXqWg9WWF6IdVRRJ0bDn+tU58vDG/mca
	 f9W11orCG5USA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA28407A8;
	Tue,  1 Sep 2026 19:50:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C1571DE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D934607B1
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNNM6fn1Zq75 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 19:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 445EB607AE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:50:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C5FB9B00563;
 Tue,  1 Sep 2026 21:50:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Sep 2026 21:50:29 +0200
MIME-Version: 1.0
Date: Tue, 01 Sep 2026 21:50:29 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260831205703.3909457-1-romain.naour@smile.fr>
References: <20260831205703.3909457-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <c4f7269cb31b062f3412ae7ed92fdfe7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] Revert "support/testing: TestMdnsd:
 improve test reliability"
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

On 31/08/2026 22:57, Romain Naour via buildroot wrote:
> The issue was reproduced in 2026.08-rc3 Gitlab-CI pipeline [1] despite
> the fix applied.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/16185948555
> 
> This reverts commit b4b1de1f7f1865af25f5dc47beac06a37b929c4a.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
