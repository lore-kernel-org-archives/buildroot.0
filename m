Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAB4C88E59
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 14:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24565406F2;
	Sat, 12 Sep 2026 14:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRcOe3pAtKyY; Sat, 12 Sep 2026 14:58:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 47991406EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789225095;
	b=l/G4cUP5+XKUfKnoTlQat2FhzSwmVTtbuHhqG1A4n6q8sbMGcsLS9bg1IPsWxWla42Sy
	 2N4ujhtrv2ZkQHByTVWYqACbEsIwuGTS14nZs2Svew3JyTQ2rQGzwlfXS1y+ne/oLPJuS
	 NVo3XSXkADM0z2CCdX2uoy4u3ipDWCOMl2lYxqcoJqAp+yErXju7MuwCP2joB2IJV0lCN
	 65FubjTa8R6WHLjPzzSzExAPj7ZRhcirZUbCAMzXjpa0i2ml0OD4jy9dPN2AyIDCytu3M
	 mDygASxdNfUrgm70Hteyzpgrjmik2zdIXIL6zBOHSZopZ2eLWzhNWV7ZY/r//T7RlJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789225095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=PamR9co5/xUCSHuDxPZHp/dHm0UJRuQze5uuYHXzDXM=;
	b=Wd6upK8kr7/ODWEkLOiNjI02k/yz9+lpElNt/9HZu1dxYhCSI3FEZHXFsPwsU2UydJAZ
	 22aNiHKvSGT+wjrVQzUsPhdLxQV+886+5YMtHTLF4wIYygPKBs7a8+DZmGIXXAFzzoUmY
	 gRzxu4iRRZinuJ2+L6a7cS86K7oOsLjtXeLRgoMPWosXi9s9wsv9bmW8PoNabWLOXPMyz
	 7/eBg+lStY4fxE059XiQ6Ifw5RGZ3PxYMDWbgqueBF1R01h/SvbKzRccLDUyn5sPAQ6AH
	 c8hcGtUC5JQzhTskbbeZmuLRc09czRaKVbdblA0rW/atrHPXcFXmmX/R9SzigeoF72Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789225095;
	bh=PamR9co5/xUCSHuDxPZHp/dHm0UJRuQze5uuYHXzDXM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ORsQNvBXrerdEDnm78qN4ZIicgflwsXfIA0PRAjXvg2JzsZtoSxPp5sJRNtJLZJ6h
	 DEqg39ByxrLE58P9unIfHT9knAe5yQE4o1iPdsirdkafUclmWn3AOWyDtIR5a4UG60
	 SFCkYQDHj2H/o/ByzRyZ7qVfCiyxb/GKV45pSfRz44nkiocaELVlVUvr31uZ1Z3g7P
	 YJFRIEC5ZvYxMrk0gDwAQeetiRfFnmf78MKyOW2T59Oc3nYE8zlsyjpunEA2GUC0aD
	 cublS6obLT0KevZ58F7ZiNTMzGUWjQYY7vmF045A3C0G2IQxBhd3OPYfekdqbRjkjy
	 JymapRAjT1gnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47991406EE;
	Sat, 12 Sep 2026 14:58:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDBB932F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C376B406EE
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LTFQ2iZ3Fe9 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 14:58:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D87A1406EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789225093;
 b=TAoAgvlHa7FFXDcyvnIDwzlmFNS5N++qwtAOSxH9/qW7bYeOfpuC3X9vh1uLobtO030u
 GwbX6gvr9njmcTyOmSYpVe30m+IzL4dF1f55DIol/YZHBuzxkreUmk/YFWEKsLVobSb9d
 dwcDJXdU9W3Jcduvoz8QWqIfB7MB9jjXENKYVTjrRS55WdppODcdamuDQ4Wm9uZxaaUWk
 al4N30xLCX+Qi2NTHD0ttZvMLLiwcvhvKwx3S1IFmHPW+lcWDd7UhPcoY0Nob91muX+1q
 atoyKllGG5ieRxo9PNe1Tz0v4MDfTqYj0jtFszKM7hICnNnG8bMfUoBGu6/rPXPwBwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789225093;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=x4ou4MHXhqC51KOdJC8Yc2DSX95ZxCN/b564XtkIKwc=;
 b=i5CGGTDpAlXhr7SOMd3YDsozzwILH0nOufmJxAln4r8NU4ZLRAr5+JJmyKQvF1YTAOsO
 wxpdCw+wTbiLdMWoFKDPj4ZN5Z54BE2JdMgO8XkqbzYFcU/7RX3bzyDaCtfhFC3bYC/Ji
 xDHn0RZWf55k9ltaBCPI1OWp+M2IjL4IGqv2jqecJQiKV5eIiDNLaLvkkE1B6/B8tBac0
 lJy6WO0AsPTJSvYlTaQ470cgOp3Q+6SQkIfk54929l2gWqdiGmQtQ0rHh0ui14Kbgmaga
 V8L2ObtHD/s0Qqw/fjkD07nqpZdNvjFz+c+0hFynkfev3r5Wa2c+PQeN1CYNgnjTW6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o4EwvY4L; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D87A1406EB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:58:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BDAFBB00585;
 Sat, 12 Sep 2026 16:58:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 16:58:06 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 16:58:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Yair Ben Avraham <yairba@protonmail.com>
In-Reply-To: <20260911211410.775928-1-bernd@kuhls.net>
References: <20260911211410.775928-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <1b5534e0020d41923266b612c7e13ab7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-pkcs11: bump version to
 1.10.1
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

On 11/09/2026 23:14, Bernd Kuhls wrote:
> https://github.com/tpm2-software/tpm2-pkcs11/blob/1.10.1/CHANGELOG.md
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
