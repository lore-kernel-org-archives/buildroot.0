Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD11C5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 13:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 887FC406BE;
	Sun,  8 Jun 2025 13:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_l8RnKVRMIK; Sun,  8 Jun 2025 13:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8A6E406DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8A6E406DD;
	Sun,  8 Jun 2025 13:49:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58EC01F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AF66404FE
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpe5sEZKAcrp for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 13:49:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 965F740378
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 965F740378
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 965F740378
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:49:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 74E8C2003C3;
 Sun,  8 Jun 2025 15:49:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Jun 2025 15:49:53 +0200
MIME-Version: 1.0
Date: Sun, 08 Jun 2025 15:49:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Zoltan Gyarmati <zgyarmati@zgyarmati.de>
In-Reply-To: <20250607021849.37636-1-kadambini.nema@gmail.com>
References: <20250607021849.37636-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <edc5f27a2840687a3ae39676295f034a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749390595;
 bh=xmc+MAcX38/IdPL/rjPxbaJD8q7/0Qd76qb0OaPXQrI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kp9NnvHZAQ2YU2N0j73yh4kDkkXjJy5p2+ZDCZfk8As/16bo6LzB1LsLrJowjNs7c
 bnfR1sHtJyFKO2W51j2c+pQ46UKh5xaoqnfdrhQltYZWKt229NepunrBXJhr8zqRTW
 5LtjyTAmtwX6+kvGjXiYIlRhRAoeVzdaXV/Yu2KjA06TwfFWmp8A5DtBz5FjMbE++S
 GHE7pNtBSRW4B7dKX+m27Yb97FPzl4p6IdV8FK2nMJK4x8TGcqCk5fh3DG4CAcnNA1
 n8ZunkfT0n4xnU7kpl5BeAMy8yPewbcvRim5moQp9NBg8bFQ8TdmRnQ5wUlJ5IBcVj
 /wLEVWtDZcmSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Kp9NnvHZ
Subject: Re: [Buildroot] [PATCH 1/1] package/libusb: bump version to 1.0.29
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

On 07/06/2025 04:18, Kadambini Nema wrote:
> Release notes:
> https://github.com/libusb/libusb/releases/tag/v1.0.29
> 
> Changelog:
> https://github.com/libusb/libusb/blob/v1.0.29/ChangeLog#L4
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
