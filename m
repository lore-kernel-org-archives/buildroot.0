Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93555C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6288D61017;
	Sun,  3 Aug 2025 14:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_kJC-Gf1qR3; Sun,  3 Aug 2025 14:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C801C60F77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C801C60F77;
	Sun,  3 Aug 2025 14:57:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D64FA1A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C621040CFD
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOqJWzl3p81S for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:56:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00D8E40E0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00D8E40E0E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00D8E40E0E
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:56:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C41A4B00539;
 Sun,  3 Aug 2025 16:56:54 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Aug 2025 16:56:54 +0200
MIME-Version: 1.0
Date: Sun, 03 Aug 2025 16:56:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250801044203.9827-1-bernd@kuhls.net>
References: <20250801044203.9827-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <57705ba399bdc92e66d6cf29267377f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754233017;
 bh=O5Sq9k80SJPEHWCwX5woiywqoCyD7qpgaJcniR/Vbcw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RImpxv+YbOrWn0yZuIwUb6i6sJ88KgClMXQ20M6R5CumW6c3etkbNtJj0Aah98V+g
 zIj67FJldODFMcFt7vtEfidLDVIFu4FXwcdgyq9QH6/hyx3lq1iCGfdQ4UzQUah30k
 sXpJq7fye8e6dEzBhzYYlQ8anHo3QG0MhAlUui0q+MRD5cZOvmKnXf9Q0vn+WOnKy9
 Qs6itDzrzXiBsR1zTao3du41cowPO8AhB4Ju+JnqclZxUVjzZitI+nJXTIUlhXFWjj
 HaEExp2Dj8UsXXcvcj39DICTYl2Z7NDrkifvVwmqIuNRqsluStKs9zMcSeg4z+RWKg
 KGxdlQ4OIoY5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RImpxv+Y
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.7
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

On 01/08/2025 06:42, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2025-July/000814.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
