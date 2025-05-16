Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C03C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CDED60AB1;
	Fri, 16 May 2025 10:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EzhJIv7K0w5; Fri, 16 May 2025 10:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC9F960B0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC9F960B0B;
	Fri, 16 May 2025 10:43:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E5071AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14AA7822D9
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hF9P54adsgj for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:43:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CCC28224A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CCC28224A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CCC28224A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:43:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B8EEE13F8AD;
 Fri, 16 May 2025 12:43:33 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 12:43:33 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 12:43:33 +0200
From: Julien Olivain <ju.o@free.fr>
To: Patrik Olsson <johan.patrik.olsson@gmail.com>
Cc: buildroot@buildroot.org, kuzminov.sergey81@gmail.com
In-Reply-To: <20250513214226.1119477-1-johan.patrik.olsson@gmail.com>
References: <20250513214226.1119477-1-johan.patrik.olsson@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <30240233b7e4c85f098e56169d913dc1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747392216;
 bh=wxX2BzwiedLm+UWv3eWqp/sNuLJsKHlNIeB+kLCn16A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l9PMN7t5s10mQJo45JnK4YUQG7lqXqRS/H5BZM0XSdSX4ZXi+YbNEnWSpy0AyzhTp
 3PN7f9+1kIcWSiviumbHZwvVzHeyqHly0O1/V56yGiwHGeJAyN5/+5nAsj/Px8Nh0n
 JEcrYONb9uEvuYQCffguws1aaj9hda2Fubm2H8YR3i4ako/PeNQY8LCRl2Qc4wC/2K
 DS6nVvU/cxOIAcdirtbCy+LrksHxKlJflxqrNCvVWPivKGzorB7NAqUtiv/olw4xqi
 bEOB+8VtVQEt1Hl0mgVMhkseIZyXSSDnZMXOn6BbJnw/SKq4XlzjurUaAM0G2FK5VP
 nTjWbMTYSDvpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l9PMN7t5
Subject: Re: [Buildroot] [PATCH 1/2] configs: friendlyarm_nanopi_r3s: use
 Bootlin toolchain
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

On 13/05/2025 23:42, Patrik Olsson wrote:
> This moves the defconfig to the Bootlin glibc stable external toolchain
> as per[1].
> 
> [1]: 
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
