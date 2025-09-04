Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3E5CA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D46C140548;
	Thu,  4 Sep 2025 16:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvF4mpgoiB3o; Thu,  4 Sep 2025 16:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E234054A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E234054A;
	Thu,  4 Sep 2025 16:53:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15AF6111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04A8F4005F
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLIm6nVQpkH9 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:53:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24C994005E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24C994005E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24C994005E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7F93C13F8BA;
 Thu,  4 Sep 2025 18:53:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 18:53:39 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 18:53:39 +0200
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Anand Gadiyar <gadiyar@ti.com>, Bryan
 Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>
In-Reply-To: <20250829-bump-6-12-43-v1-1-cbb173f16a63@bootlin.com>
References: <20250829-bump-6-12-43-v1-1-cbb173f16a63@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <af8b2cad93d38a1b8f89e8431a587618@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757004825;
 bh=EIh+bob1ss4tJEfE5rS7+v1mLAeIG2e++O0J6ILtUDc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KJkL8p6LEGmrFKRVxYxeGqXbYVvtKd3WrmrkD0vOtJfz3+OtEejKcmwR2VAKHCvHl
 8SsI5xB0FZql/qc2xCoYvTr+seituWJdE4sovJap+APMuM1SExZTIVpn+uAU4vCurG
 0ZsZbi7Ga2O2oP8W6J8mU5HKd1c0zM+4ouogV0YtNijZhvzUoXTJ2MyKAQj8hWR71V
 Kl3QAlm7NfLmo4NRnq8uQXs6ZecFM0em9gDsRMre/ucVw2Rm7/CFmYcy/20iaykg4w
 psEqtkeCB5t9YbcPNFh9wbGUCeZBQTkgNJI7hTRYNxzyQTIfYwTExmWppTD4zewDjC
 yA7hkgzRtnJ5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KJkL8p6L
Subject: Re: [Buildroot] [PATCH] configs/ti_am62x_sk: bump Linux to version
 6.12.43
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

On 29/08/2025 17:27, Romain Gantois via buildroot wrote:
> The Cadence QSPI driver is broken in version 6.12.36. It was fixed by a
> subsequent patch:
> 
> https://lore.kernel.org/all/20250730093234.216392179@linuxfoundation.org/
> 
> Which was later backported to the 6.12 stable branch.
> 
> Bump the kernel version to the latest 6.12.x stable version to fix QSPI
> support.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
