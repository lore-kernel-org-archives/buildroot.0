Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C813E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 17:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 766A180F31;
	Fri, 10 Jan 2025 17:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-o0iX7kyXoW; Fri, 10 Jan 2025 17:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0590680EC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0590680EC0;
	Fri, 10 Jan 2025 17:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B522F76C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 17:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A96FE80E96
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 17:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwIuKRp2Yz5V for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 17:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C282B80E97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C282B80E97
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C282B80E97
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 17:42:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 245BD13F86A;
 Fri, 10 Jan 2025 18:42:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58288])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jan 2025 18:42:43 +0100
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 18:42:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109221116.3611958-1-bernd@kuhls.net>
References: <20250109221116.3611958-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <1be785b43c0b0234cb18c549464e3590@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736530964;
 bh=WGRlH8VZElN1Ma9vHwXbbSYyG8G1L55UfUnmW2pNKrU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qtyOl34cXhpJTikoGEp3dniaoGsiINfLzZ17wjx2MK+Dk54mkjN3T+A/5imQ6YQ+E
 WXsNDhJZcMDWIhm7cOTpTl2OpUUrxXjlm1Pti3sTYD5WJXxXGKocfiDwUMY2e39XE7
 Huc2v9dg59fC5iop+EJ+LTokQMYY0B+lw5wHcv++iveh9svzckeXRGS2qFpqXJAwNs
 tyYU6j2OorRClI2+YEKm/TyzIOqu0rDFwuKSMnZhx6fEpSb4Bx7qYrokLouCZPKbwo
 4dCG1rJRV4E6bbHlEIVyaYvXFgLy45P69ZTbniErgA/eyEIjG4oygfCKe+KzQk+BY6
 pwFEgjqjBfPhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qtyOl34c
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12}.x series
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

On 09/01/2025 23:11, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
