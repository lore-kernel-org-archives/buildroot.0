Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9242E8783D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E91140B5D;
	Tue,  3 Feb 2026 15:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIaRG1A0BfCl; Tue,  3 Feb 2026 15:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B66140B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770132167;
	bh=xurJbVQW9D3bxeWu67fk3cH6TjlTdgOJgYJG8XZa2fw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OKROzkha6OiS0NtUAZ0tQlaP0qmsV1005QBkncH9JvtdhuBoS2f4HodAJ1ClneqwN
	 92JTS1CP7uAgvSzHqtL1Q6DnwwzoACpCQ/fiSK5byfouca09X7FonEKWHwjxsGlye5
	 /rwdu/F1TUnV+auk/Ipa7bqihIg3Qu29bd6Y3L8KJE9LUiNUnfE1Iat/fbxeOgg46z
	 IY3b/ZL0ovt8BJVGFPJQRdFEdiBY/lLtP56CoLjoo8cKKXSrgXRUQRKnY1XWTNa0Jy
	 NxtPtk4hGb6yJXdykBsFkeYjgIuL9a9bBcth37k8FCetkGOH/i+1HKVSYXJTFw7egv
	 fOfHKqTa34Z9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B66140B35;
	Tue,  3 Feb 2026 15:22:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADEC3F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 990A340071
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuZ5rfKeoNG6 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:22:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89E7040025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E7040025
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89E7040025
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:22:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5722C5FFB4;
 Tue,  3 Feb 2026 16:22:40 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:32846])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Feb 2026 16:22:40 +0100
MIME-Version: 1.0
Date: Tue, 03 Feb 2026 16:22:40 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale via buildroot <buildroot@buildroot.org>, Thomas Perale
 <thomas.perale@mind.be>
In-Reply-To: <20250728224733.1d1727e9@windsurf>
References: <20250727192537.1164560-1-thomas.perale@mind.be>
 <20250728224733.1d1727e9@windsurf>
User-Agent: Webmail Free/1.6.12
Message-ID: <c83800fb29d9fa1d094f1ecefafeb761@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770132162;
 bh=NEpK7P8+krwPQh3UD8S8lauq7ENBRA4zrhX5xzIL9vg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b/502mOiND31pyEjywdDPIBoLcuCSEZbfbbs3Gh7hUVtGywpzgaDtWGklvcYQbKG+
 HdOsJbg3GRy/69XM9SB1gfe6435lZ3rcB1JWcx9+XLOW66aVwh55rfkucxx2sqVpG6
 opi/VCLvJd/44tq5C+3uyU8lh+ADvU3HBVzE1FqF5UJGCOHC63u13nLiUChbFfuND0
 KBXVtGEodWQhnOw9q1aaengCqAioRAIERnXByxFXnQzA6Ow/jWkGvyunLIr6sM1snR
 +dDZAITPJdyIUGgxIGG/og0D/kMlA3aCySMPnPDNCibNypy1ZTGDvBZGi+LVA4mKoK
 O3jYa/InT0hig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=b/502mOi
Subject: Re: [Buildroot] [PATCH] package/aardvark-dns: add CPE identifier
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

Hi Thomas and Thomas,

On 28/07/2025 22:47, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Sun, 27 Jul 2025 21:25:37 +0200
> Thomas Perale via buildroot <buildroot@buildroot.org> wrote:
> 
>> The cpe:2.3:a:containers:aardvark-dns:*:*:*:*:*:*:*:* is
>> valid for this package.
>> 
>> See 
>> https://nvd.nist.gov/products/cpe/detail/5F79D5CD-D716-4190-BE08-31EB5EEB233F
>> 
>> The CPE version strip the 'v' prefix from the version.
>> 
>> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> 
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> even though, I would really prefer us to be able to have the _VERSION
> field without the v prefix in the first place. Indeed your tricky with
> AARDVARK_DNS_CPE_ID_VERSION works for the CVE matching, but it doesn't
> work for release-monitoring.org matching.

Until we have an generic infrastructure handling that, I applied this 
patch
to master.

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
