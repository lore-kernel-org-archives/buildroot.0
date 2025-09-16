Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0A9CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 21:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71CEE61237;
	Tue, 16 Sep 2025 21:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_EzhQ1UU9ps; Tue, 16 Sep 2025 21:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08E1461208
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08E1461208;
	Tue, 16 Sep 2025 21:18:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47BB712D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DAB140B29
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiGi9tWaqzk6 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 21:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D14940B32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D14940B32
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D14940B32
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:18:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 91530B0051B;
 Tue, 16 Sep 2025 23:18:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 23:18:13 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 23:18:13 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915231306.2142460-1-james.hilliard1@gmail.com>
References: <20250915231306.2142460-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e3f1959408e42d505b0d769a1c81d9f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758057494;
 bh=wGyaPdFxm6b3y5gMgFF2BcazmD7Lv4pXhd/SnEhCRHI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LFgo7QhEBgFLZlvAK3J3mPoj4VDVSvPUrk0lUWSMX916aAsgLOSOd/HNvSQbOFH2X
 RSQuySQC89W8yyDZfl+5l3zsnXV4t/F6BqDDTxMr3Medr0GaAndsm+QTGNdOKBQAE2
 q+BnWMeQWPu+1Oka5J5X+gwTpdAF1dqPlbNIBO77cbpVqfKf/HUCiH4rnVKz8g+0tZ
 fXGp0ETOFR6DHQ35VKGGi+kUsVhBgT863wwBtJ2RY1Vrs0sXpd2/QGxYCFP9q+0gKb
 p+R9RDWyWXnaOMXumIt0FiQHquO8wTcp7tdYe+VWGJcquZSE/cL5sVdQ0VzrgTaKL7
 h2DiYM9Juzjeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LFgo7QhE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 45.0.7
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

On 16/09/2025 01:13, James Hilliard wrote:
> Add host-pkgconf dependency which is needed for finding openssl.
> 
> Set OPENSSL_NO_VENDOR=1 in the environment to ensure we use the
> system openssl library.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
