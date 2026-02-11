Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D1ECD6D3
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 18:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A97AE600C6;
	Wed, 11 Feb 2026 18:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8COOSV694kxO; Wed, 11 Feb 2026 18:18:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7FBF605EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770833895;
	bh=VV5066zxKyTyCN8hVLJNrVTyT+F8cHkHfuiZkxoOgE0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZCWFABi2RVFeDkH/vFItWCRyiuNdsYbObIQW0/Re4gqZdgu+ndpc0McIf/cD87CV/
	 5f1shz13d2oZb5zfiCszOuGgEhqb9RWEVcC3ivVix1k8Coy989GFBgNJnGMJiBEZ1p
	 3rq5LxAMhPVU8yTWRTifGgZuTCTv3rI+HGUx7cASheHqN8PQet/TpYB2NDmL/rX3ly
	 tRXgelv9rekyD/NAAJlpr+i9AgIANpk8FcJQcH2F1VGyJ2abIf5cCJCOdTNyaoOFV+
	 GBIQq25k9JOtD8IRstIXusAqJ0MFJekysPEDVjJnIG5YaCJVwp9EbCdHe7grPwq9sx
	 VqZ/yaBOxrOCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7FBF605EE;
	Wed, 11 Feb 2026 18:18:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B696B1F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BED560B1B
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27PZc2ix-J8c for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 18:18:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45AD1605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45AD1605EE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45AD1605EE
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:18:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A41145FFC0;
 Wed, 11 Feb 2026 19:18:04 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 11 Feb 2026 19:18:04 +0100
MIME-Version: 1.0
Date: Wed, 11 Feb 2026 19:18:04 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, "manuel.diener" <manuel.diener@othermo.de>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
In-Reply-To: <20260211141944.3610996-1-buildroot@bubu1.eu>
References: <20260211141944.3610996-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.13
Message-ID: <38f525d0953c841070f63128e3aa45ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770833890;
 bh=RniFb62nT89MT/4kFKqHUMceLJPPvPRadlmBmz+FIbI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KhGqI6W7M2jL94tUt/s7io8wPLW0lUObXo2icp2VKR899fKQHItETRZrrvm1bDPfF
 wCY3g9YUcuBtUwe6jglEsQvB6zL5EE6M11GInyUN2hWWq7q+ABmsFt2uJNfpVQ2mwq
 iWJa6Lko3nK004cGt97cXSPOCsnd4BkwAJBjNdUsr2d3j46g1KzeNOF2w33+FOMCNP
 h1yV7mE8ZOWrK5mhQ4rHM2EtAttOAJvgUlhoutSit6kNNyQgnoNo/xCqIQI7HOhAea
 JBnrOOt1wUxAnSKBn2/1CFD5voZu6jfjgqEpSGke5tQRDh5iyD2vvTibtnsbd1Sums
 bp6rwgf591aWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KhGqI6W7
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 6.0.2
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

On 11/02/2026 15:19, Marcus Hoffmann via buildroot wrote:
> From: "manuel.diener" <manuel.diener@othermo.de>
> 
> Fixes the following security issues:
> - CVE-2025-13473 (low): Username enumeration through timing difference 
> in mod_wsgi authentication handler
> - CVE-2025-14550 (moderate): Potential denial-of-service vulnerability 
> via repeated headers when using ASGI
> - CVE-2026-1207 (high): Potential SQL injection via raster lookups on 
> PostGIS
> - CVE-2026-1285 (moderate): Potential denial-of-service vulnerability 
> in django.utils.text.Truncator HTML methods
> - CVE-2026-1287 (high): Potential SQL injection in column aliases via 
> control characters
> - CVE-2026-1312 (high): Potential SQL injection via QuerySet.order_by 
> and FilteredRelation
> 
> See the release notes here:
> https://docs.djangoproject.com/en/dev/releases/6.0.2/
> Also includes the bugfixes from version 6.0.1:
> https://docs.djangoproject.com/en/dev/releases/6.0.1/
> 
> Signed-off-by: Manuel Diener <manuel.diener@othermo.de>
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
