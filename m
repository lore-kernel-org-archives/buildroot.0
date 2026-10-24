Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB146606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=J+BOg2OO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98C9060A6F;
	Sat, 24 Oct 2026 13:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01r0V44vbdc4; Sat, 24 Oct 2026 13:43:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CC198606B0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792849404;
	b=odHmTCiBnpo+oAg6Bzunv+ryZA80ym3yRlxC6sObMBb3IRkR2XtyosczjS9iJx3pYLR1
	 SRpoOfoiHZekssGSdaZqqUNzqBWcdUkCeDB6v1cePoZclDX6bHLVja2EWfSl+W21s9f3K
	 vH/K09gu6dB26eON2R5d6h2wx5JaF0Pxgk2aQnIbyj/eBZsFUawsQRykiwpUqxXe2nBf8
	 N9xxdzFhwctKhTh1CL2hEraAbOfcbJSaYuyxCdL27CPCvGYgMTdFcNWwFBT8MBM3KrkhY
	 lFJE2st6M9j0dnvs0ydD/1ygnVKJzQ3AfkRnLvSS05Ao0cYiBZ8lmV1iTnCTF2ModwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792849404;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=VIsX091ZEUQNSN7bbgwEtVs0Y2bFLYpGb2ytvAFYXk4=;
	b=fhkNav2eZDsQqKebDaJe+27i7kHsziO+RdnALzH1JzNV3AvZD13zb8TLXV6uFx7KKH3Z
	 OLLt19wwshsXuXpsJDdd3Q57WThS1XNAMq6K0ar4gyR9h4/u7TYa6b4SyeehJohR6hMrd
	 5p5FHtyReu8EvZIh5zUunm3ToxAW6NVJXMmAnjpm3CuVGqJryYHNsZw96fiwEYwCNdqE2
	 vXsJGiPXDxcFDIdKkzukmmsxfqCKAoLvwhdo+X4K+X6M4Ach73ydC6UgAuEwLfdC1ih1T
	 3B11p9fLchQQVEXpdkhVhGASwi8Tpjph7F/9+VkDEs5EsmybIVXBaCifcYiU+jkCg2w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792849404;
	bh=VIsX091ZEUQNSN7bbgwEtVs0Y2bFLYpGb2ytvAFYXk4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J+BOg2OOu/6rozNCvg1TDgPMZAK1P7FbOgGNhMFBokuOxt9VyS52kz2bFYNgwlmAk
	 Yuaog/4gM2VSSyxatYatrowyaw71lUWHf69j8coOhwzkgrCKbwMkWk9m7GhE8Pj5En
	 gobIr3PdQyty/x0qEez/oDhtfYB7Bk9K7PtzHZEdv45MCBoyBpRRKFL7TvYyse/VD3
	 e3FFRVgV8ixR9HEKZVK/3mk0XjGpMZD/XFNVaWO/AKe2AYnA7JsaixSvy3UHAv86pE
	 SCFtpgQaPEyP8DgvjrefFXJTiaZWTxxSWxvzzeAMygXNHQXMVPanPBHt+Fge+XZ014
	 J6husXx/frLLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC198606B0;
	Sat, 24 Oct 2026 13:43:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24A384D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A091606B0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQ5EWY0GN0CL for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 13:43:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 271E66064D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792849402;
 b=F7HLW8i+VpwH/MiDK2cLkNFsmmMO7b8zK8QJ4mv2D8SzXXDnrmFXCRaamUoN2plTzLJp
 unFHx2ZX57xqHq3Q/pvo4Px5YfM1ua6ocVvJjhFPlE24DKsxDXjw6olrcmY4SCL3ae97q
 bizYoi+3wTEYKj5DhtPLAu0ui1UbgfGfd/BhaJq40HXpnoPEqIAWldzMbmcU8oC25Gd6Y
 /x7XJj6c5RU9sRSZuhWI0OhklUAAIQq9JVusj54MeeG/FP5f2tTs6H5i7HJUIUUCJEMba
 xM3H2CGOx/Y8qY+YEBd25SWfa75XpNQdoyLZPkqr0z5aQZg5x8hzmBrwmmNvFpwsjFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792849402;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=WxDcbuk35iCckrYPkNZSG9VmoT64YVYqDNDfu5vbg+c=;
 b=QOe9QgMEQBRxmrfldwT0At7e4aXEtVA7aAdX6TbPZeqaThQM8xgS8v1L3PdPtA9pPaUn
 aaMwNFDDeW181t8nrwaApeKLc+aDtDmA8Y98Rwz2lLIouV6x1HUS547zL8x10jeiw+YWb
 bDjgZAWPAxbLuWdobqU7X1xxSoteqwzESHtSd2HT8n7Z4SwKh8o2as54pzl/O2Oc2Pu7G
 QBf99zq+Hbl9fjdJ4V2UMXE/BFzUB+6KSbWI54UdLSHLJrSu9Fbk5/rk4KONHTrzkEE2z
 nm5D7ll3bD3uSirZgSuUJJOhpJET9mTZsvjQMj8+P6qzieeqsVF2+No90uTk0/V5Ncg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="Ufs/AGqs"; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 271E66064D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:43:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D605F780368;
 Sat, 24 Oct 2026 15:43:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 15:43:18 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 15:43:18 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-5-james.hilliard1@gmail.com>
References: <20261023181818.920329-5-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <0f0aa04d871e7ccfd13b1d17c7611589@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-brotli: bump to version 1.2.1
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master.

For info, this bump was in fact a security update, so I
rewrote the commit log accordingly. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/f904d35dce2f40226a115cb0e440bc486a7ae48f

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
