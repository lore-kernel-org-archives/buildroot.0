Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF54C3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 20:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA0C2408E2;
	Tue,  6 May 2025 20:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4M1t4I0SZAKE; Tue,  6 May 2025 20:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B5AB408F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B5AB408F7;
	Tue,  6 May 2025 20:24:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD50E1A3
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C72681DF2
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2A23zZIPL0K for <buildroot@buildroot.org>;
 Tue,  6 May 2025 20:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A99481AF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A99481AF6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A99481AF6
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:24:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8643F19F74F;
 Tue,  6 May 2025 22:24:43 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:51386])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 May 2025 22:24:43 +0200
MIME-Version: 1.0
Date: Tue, 06 May 2025 22:24:43 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Zoltan Gyarmati <zgyarmati@zgyarmati.de>
In-Reply-To: <20250501080924.18726-1-kadambini.nema@gmail.com>
References: <20250501080924.18726-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <715c22b48e8588a356346d38032d1d44@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746563085;
 bh=LKMb997vMUc7WTEl/FGylkngmAch//27ocTMBCZOV4U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iXRPegusZvy2DAwO1vUamP/ujgXr8EzEj9FdN8qBjChMdk3SmwAdSXnhjJqA2nY3L
 jKBIFLljXTPE82lWLzdcz54VcDYyQGxrPGMVTXUY5XmW9ClQhoft2apKlCCrreSGBJ
 BUBctipXee3D0m2OM/jUJGlDWdcbeppPXgK0ZX2jE4A+qPhQN4U/F4oWrnv8utUCme
 1W4RBjUnLRaUHTDiVcFM9axdbefAvvDDzpY834ZHchGs1cq8+qu/zUoYMkZOpj8jTK
 Z9dQk05Z5OGJ+XmMtk7GoUsvVH7vn55xFbZYNipGnGhf32tOXMVeyP5iJwxCSdDpEj
 TnuxHK2bxGWNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iXRPegus
Subject: Re: [Buildroot] [PATCH 1/1] package/libusb: bump version to 1.0.28
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

On 01/05/2025 10:09, Kadambini Nema wrote:
> Release notes:
> https://github.com/libusb/libusb/releases/tag/v1.0.28
> 
> Changelog:
> https://github.com/libusb/libusb/blob/a61afe5f75d969c4561a1d0ad753aa23cee6329a/ChangeLog#L4
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
