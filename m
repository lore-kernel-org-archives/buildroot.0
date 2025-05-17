Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4232CC3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0800B606E6;
	Sat, 17 May 2025 10:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcRVcHLYy7Qo; Sat, 17 May 2025 10:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39CE360A89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39CE360A89;
	Sat, 17 May 2025 10:48:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1365FE4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A724160A89
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kd-qFn8VGExf for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CD78606E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD78606E6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CD78606E6
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:48:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7830F19F5AF;
 Sat, 17 May 2025 12:47:53 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 12:47:53 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 12:47:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adam Duskett
 <adam.duskett@amarulasolutions.com>, Daniel Lang <dalang@gmx.at>, Eric Le
 Bihan <eric.le.bihan.dev@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20250516171116.3366550-1-bernd@kuhls.net>
References: <20250516171116.3366550-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <2deecae3da3e0bad6212e23ada5a23c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747478880;
 bh=Zs1eoLO1MSOciTM0x5tJ8Q0dPDvSTz2B8XyEWUeepOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iZM0pCPWwIpOCzLewjoXWxR+u0Xj3l4Tx+DBdb/r5I6egT6FMLJjjNWJFqV5Yl/rG
 NgEh1AvKhrFqDUkkIe79Q0UDYN+qnwpzLfkfhB9aH/x6kYc8qgG/gdYFLqWhkQPq5A
 2hamFlwMv68L5UOv/A0UvqezDlgDwMYf1h1x6UiIVXerNO/w2lAOP2Shkdv0Gdsln7
 Fw2WemesDOLqaXbgGbPSni5avdCQpLokQL23OfYC7RRLPZL5r3qT3bl6Drhw8LEtzF
 E9UXsoQN8GryjZjZ7GB9PFivqO5/ur+w/kg+W2Nqnm/FDwIe2b89/93X+A6/UpJ36O
 O4rGIv8zZoWxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iZM0pCPW
Subject: Re: [Buildroot] [PATCH v2 1/5] package/libdrm: add host variant
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

On 16/05/2025 19:11, Bernd Kuhls wrote:
> host-libdrm is needed by host-mesa3d (introduced by this patch series),
> which is needed by (target) mesa3d, when enabling the Gallium Iris
> driver since version 24.1.0.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master (finally), thanks!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
