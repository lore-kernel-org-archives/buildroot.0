Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678F8CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 219BA60680;
	Thu,  4 Sep 2025 16:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRVBPwe1WD8c; Thu,  4 Sep 2025 16:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55CE860673
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55CE860673;
	Thu,  4 Sep 2025 16:58:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5325111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB5E84005E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62cXzGZWmjWz for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 139D940051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 139D940051
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 139D940051
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:58:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 419F62003D0;
 Thu,  4 Sep 2025 18:58:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 18:58:25 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 18:58:25 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>
In-Reply-To: <20250829143407.1970907-2-thomas.petazzoni@bootlin.com>
References: <20250829143407.1970907-1-thomas.petazzoni@bootlin.com>
 <20250829143407.1970907-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2259eeb183d48339032fc1232883b8ef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757005107;
 bh=KCV67wczXQ1YJm96j7RLY8IjEAJWrgdrHq7XX+mylWk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JLY+JZ5NEpHG0bCDdV/0FyGcb4Zg53R6pQdkm5DIcvx5UGSgis1cEL9D2MFIKLN9X
 7Ey4XF9tzZzEQYGH35PoTHxTbRAv3bAH2HcVIZil8IMSyxLOuFOrQeJumAulkLy4ZI
 I8rrRDlofvwoXr/mSpvAxLXiDW745WuwF3BKuBAeHVk36/TRWaDOfuHa1fFroeJaim
 0AnFYJ2bB1L25ljgdc6vlOmtaVLk8iJpbxjCfs8F8GWvV3w4VW9LUrTB6UYm7w5Lvx
 WBvLIXc3JbY979rgshZqXlcnjcWnr0FGeMZfi3lXfhfHJ/2dBju1L5Ak+h4ats0oF2
 gCVDdfQUcI86g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JLY+JZ5N
Subject: Re: [Buildroot] [PATCH 2/2] package/libkrb5: bump to version 1.22.1
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

On 29/08/2025 16:34, Thomas Petazzoni via buildroot wrote:
> This version builds fine with GCC 15.x, without passing -std=gnu99.
> 
> Changes are described at
> https://web.mit.edu/Kerberos/www/krb5-1.22/. Most relevant details:
[...]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to next (after cherry-picking patch 1/2 from master).
I also fixed the NOTICE license file hash.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
