Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B32CC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 629CC80DE8;
	Sun, 13 Sep 2026 09:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAtX_ACw50Dt; Sun, 13 Sep 2026 09:53:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 64A8080DE9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789293239;
	b=fn3L7iwyle52CIvVzXT2XSJ11FKiOif3SE1Ry1O3E4XsaXA0fAKEql68JEHH5Z6W4GDH
	 OnWEOlDQc7gS/7xDxIOj4Eq3RVFDczApOJZiEtUy+aEhuESbLCDMZrosbdN9L+VpNjegU
	 LtaoAUjIwKlDrd6ifE/ntkMW306dgyJrv9vdxC+bvDeLXzjUnMso9bDAEr3OW0YTanDWT
	 Z6gNdf/17TN33XwNcnd0kgsZUOHPbVhL0/h5cbwp84LFYTOV/hXN4UPIveH+GfCquCyfD
	 MtWqWWiYjQ+uNyByxCD/REIgqxdGJWNg1R24TxthhSyfp7GWneAJwFSORDUGzN72arg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789293239;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=gfAsMwiOV1vqtsO89FrF/QHK6vOajGINcBWhyH5Wrqk=;
	b=cOVrjdXlsqADtNt2vWF/zbhxCq/8VvidsQvO1YdtKseMsKm1P18WgZAGHZo9QXsdYeJ+
	 1zFEgkvUpVdE9FQC7opuOKWAgIUDBP8uAFV/p3xyU29fqyWr2ioxDGX1OeHiALkuoOyIA
	 bVQ2ElSmggKTrd3ojrMxrX9kY+4C9u4ufdpSgnY9xnfou/jyZQcw8SFjK7JgOLjbn+tRp
	 NZ+Q9cbK0jL8pI6Eihdeb/pz1moRsIVoLw5xdSoh/Wajf21/m1WMu4Bgs8q5n1diJP1uM
	 UAtx8ztwsdQ0YVXCNO9sJdlS5HnWqEvsg1GrgxB4o7yBB/5uyqZAChQ/ffnqPAdnpeQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789293239;
	bh=gfAsMwiOV1vqtsO89FrF/QHK6vOajGINcBWhyH5Wrqk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZRM6EpuSdXbjXayVZSJVLA3MN+OIw96X+gRVgUfx5UPLg1C4YwnJPjhnd7sy7P48Y
	 7MzXSDP89br9/T/hmb9IyWIR+9jh7KaOlfmynbvDu1X79WTtBnYoJOgyhD2AWuWPtK
	 9GM0BDQK8tqo1eQjrcL4T4PXD7HmTddpvnWAs2kA3eObTidQQ+pF4nRb0rvB81YFqm
	 /ONhJ1B++4oNFWpl3uF6plwObv5Dz8IvFVFgGzNXjJstCo0+Ybd7fsy8Dg+VhNTLBg
	 2++GrvWQkCmYtGy/q1Zcf8C9v4SWo6cLoDb45ztPp4le+g+ZKu195mMnrP7P9EkqaU
	 uGBB4sSKZYfxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64A8080DE9;
	Sun, 13 Sep 2026 09:53:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83AA924D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7178D40650
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fN55985yJARo for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:53:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 05DD840648
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789293237;
 b=HzXVprW3eKZDJaIUOuotgGhW2d7TWut+c1fRS6KPAWqms0+uO3mTNSiWA/Sr3wql7PHN
 UPmFKDduCekR4CtcTbZYoBQOyOxsfSvVWeoZLSZXu+IFEGAIQqOUIVwStBSGTSYxRBO/i
 gjDQNr8C3xn4cLComWHMSoVrJLlYealXaNBhPnkTUM1B8/OvsiIclf9ZVU5kA4U28qq5I
 NoPjoUvf9RFHHPKKFOem6k5/sLRicseOSsRyIU63Ubs8QN1StjQA1Jre4WzZnLDokmzgr
 vc393W+RXuMs95MD2MtdHwy3q4u3Letpg8NjE8ubxdTj/ImMbvntb3WFWsrTvTIB07Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789293237;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lpxeTh71dTDZTOlJLw82XJ+4SiCcYwwgqlS3+eA4FRI=;
 b=QYQuBm3FWiwacw2ZjNF2xz1XcACGxU69KJ+0ZK0YDmL1/EzLfCNxxOQ/EIH1GvcS/Ajt
 XMGpRjIpNEVJsPCYbrU+AEIxDuwqhx28MPYXeeprqmUno/utlUrNT8JUvzowE5YbPEXYD
 ZK7pH79nAEpd7FBNquYu9JzQf1+Pb/iKFUOLqD1advrxGDORMyHsm1nRZoE0anjVmImni
 oW7RcbPhShXxIlsxjway14xG3I1Ax3cU0tU9GdYYndl73gwHwH3Fzi/KzCOvrBIJoxGPY
 S/+qDZYT+J2079w6m6D5TTg4Oiv0lFk6RpBaZoB2vRuz2sy7HdWSC7DywBr4f1XJLDQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HWGCvQ88; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05DD840648
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:53:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0319560139;
 Sun, 13 Sep 2026 11:53:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 11:53:52 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 11:53:52 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260910230207.1934197-1-aperez@igalia.com>
References: <20260910230207.1934197-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <6e8b407e70e100b2e27fc12e4f6e1c23@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/cage: bump to version 0.3.1
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

On 11/09/2026 01:02, Adrian Perez de Castro wrote:
> This minor release fixes a crash that could happen when a surface
> requests to be fullscreened right away during startup. Release notes:
> 
>   https://github.com/cage-kiosk/cage/releases/tag/v0.3.1
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
