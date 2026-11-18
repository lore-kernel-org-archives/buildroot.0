Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A9606A325
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=djk/0BHF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBC2760733;
	Wed, 18 Nov 2026 19:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vtd8U4fhvieC; Wed, 18 Nov 2026 19:42:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9EB13606CF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795030955;
	b=I3gdCdk/MeE8MT34NKnZaNORLioFKHbA/aj1NDxfwajDPkrqLbdGtmKU8FJkIQasRO7U
	 L9erH3E+Rkxmh1vthouH1DmNJSms28uHm3H/I3F8Tn9QSaZUKZObh1Nahn4kF6+VohZx8
	 pOwX71b9eqzMHFapFLjVvqm3aXvQEAJgbD9LlesaECH92oBcO0TyoDzWy9+J9qwJ64PMM
	 77oa1Mcj+zxdUEx3REGDEF8tiduLXwsVS29VoF9JKJDGMBovNL/VVHOm13d4cqwZoK/sg
	 XHcaeO2BxFyr7bl0NlxfesL3SBMbkvUE5xK+2qFKjuRK8rihZdtDk4zPchTkvnGBpUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795030955;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Zbh5AcErpFS9n0o5jr4zrkSWzLO6J00F/ZR8jLD2xDU=;
	b=cDXZ/xicAQR1WYYtii3ujl7ACPm4PvgMFSTPz1UmUargimk7LzueWNmF24dBznlHAySn
	 6PeXXeh3hGwQL843rx9KzVfHiKSOmbsEsG2mgGpysyT0HXlXQeQ/XM3e5SQ0mB0aMDh+c
	 eW/mojmzrczHJjkVBjHkYCi0I44DMK8J1AGj1X2djL4Jd79/sjTDkSgjfeN3arFt3Wibm
	 /k9Tj6PInWqjcQ+V0uj5wo7fvV4Oo55S6CIQy7jGF/6lo+JwqVj22QE1bsLVL4Xl69Jrv
	 0NnpmfVG2fF/zdrAxl0YUrrzEBtDQ7CsqYlIzQEW/WU5yXFXjZLdyU1MsaOcQ2LVSsQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795030955;
	bh=Zbh5AcErpFS9n0o5jr4zrkSWzLO6J00F/ZR8jLD2xDU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=djk/0BHFjRVxYSbRYNtMpmoxyiz2wFTtAWknCGX5Sv8idlh40qdc0XCUm/S+1v0iH
	 cGusrJqtSGc16Cn+Ovxu9FO1ybkkIKIf6He4RX0HQz9YZS6DD5hZ4n0zOyzS7cmKfP
	 rstfTIhsesQa/M4SnSX9IkM38XKv/nx2/uGQWvhMcrki9tq7zGeItSYnjilShVheGP
	 bOxQ5XeWwm0bQU2loQs9T/o0MfUzxCmZfHhuGC38WRKICOnCjfXpjKdtc6D64S+7uB
	 UduAyrnHY13hHtTzvc5s4KgkM0P+JWGd8WpZHflZmcgZWCVastZm/z0+/6qdnZKdXY
	 QcZv0PyjteaRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EB13606CF;
	Wed, 18 Nov 2026 19:42:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64CE149B
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 19:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AD8440895
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 19:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcfgs0mntpHq for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 19:42:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BAEF940769
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAEF940769
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 19:42:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 96AC22003E0;
 Wed, 18 Nov 2026 20:42:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 20:42:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 20:42:26 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261118181302.156512-1-bernd@kuhls.net>
References: <20261118181302.156512-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <a729ab29145c1e74b9a87de6f57452ac@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/ytree: bump version to 2.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 19:13, Bernd Kuhls wrote:
> https://www.han.de/~werner/ytree.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Since it's a bugfix-only release, I applied it to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
