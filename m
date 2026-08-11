Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192D1C5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 147D960850;
	Tue, 11 Aug 2026 19:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djX_0zPSoB6x; Tue, 11 Aug 2026 19:36:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B37BC60788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786476964;
	bh=fU4Y3F3ki4+UILZ2f5i1uMOxO45rmXIiV1zeJGmSg8E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jHdzI7tj/O85+cToFKCWJh6tNrqDKRxc95EgK2d1DKBVKXMTfOWiJtdCAll6/q4Qz
	 pCNeR//44KSJHyFT1jTrsM69qJJBn2sd/nqjdSg4KcEccd034EIBHgWbOvlqx3bNFZ
	 qsCQmifK2WsFPSepAjkVsEKRiZ52nDptzkRsAGQOdiFdk5nDRLWDp+U7c9tLNKMyIy
	 m56RGNZ1lhJwjyUceu18D55EgISeEoXGOHHKRwgGK5xrH2aIC1+fSK4NYR8yCMjfvl
	 eP9OcIy9rhJtzcwctLjBcKMWc2u0y04ZGadh/3wg6fEkdg6Sb4nR0Y0pWz0srDqtHU
	 NVeB+ht+GzXsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B37BC60788;
	Tue, 11 Aug 2026 19:36:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B79782E0
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A97354033D
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wj8sEbBvy8Ww for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 19:36:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAC0E4034D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAC0E4034D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAC0E4034D
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:36:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E3EA66012D;
 Tue, 11 Aug 2026 21:35:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Aug 2026 21:35:56 +0200
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 21:35:56 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260811045801.234968-1-petr.vorel@gmail.com>
References: <20260811045801.234968-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <a89c6eb42eea4e1609f0a75dc157191e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786476959;
 bh=r30j2NQDGlYfirTZ13liqqPHWprHMJ6allPPJNTl6+I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kYvR461xgePW/aIxBiG4lGZnJO58dk7yorDK78+smu8AMA6Tb2Z05Qx5mAoL3U3nZ
 MIczvsVImd3GRxZZmY/3NXvA82GKJBD5otin8E7ISLTxCgr7w99oCrtDXY4CoNGer9
 dbsQz/vLqGj1LKJMgyxPdj32cJkSZJka8KFIz/2rcsoP8nKV60dIzxuFlkUNECupQ6
 vP+P74TYrWcMlgsEd6+YsR7WOcm85fictEDxisTAZKER4SQVWTpCuIGh0cw+eQm7L1
 Gt0gTdGOxYWu9pSHPoKDckP285W3whPmaU7xUm18iuXrAdjoRYJYkb+hNH0ivJuSVG
 f/S69vujRgc6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kYvR461x
Subject: Re: [Buildroot] [RFC][PATCH] package/nfs-utils: bump version to
 2.9.2
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

Hi Petr,

On 11/08/2026 06:58, Petr Vorel wrote:
> Remove patches upstreamed in this release.
> 
> Release announce:
> https://lore.kernel.org/linux-nfs/dc0f6f41-84be-4a70-92db-89890bded3ab@redhat.com/
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> [RFC] Building nfs-utils 2.9.2 with --disable-nfsdctl fails to link
> exportfs [1]. This is a regression from 2.9.1. Buildroot uses
> --disable-nfsdctl => we should probably wait for the fix.

I agree, we should wait for a fix before merging.
Please, send a v2 adding the fix or including a newer version when
available.

> Kind regards,
> Petr
> 
> [1] 
> https://lore.kernel.org/linux-nfs/9fec9f1b-1c10-4a20-8282-dfc9addb4ee8@est.tech/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
