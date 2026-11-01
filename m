Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E28C606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MKKHVleE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 102AA40556;
	Sun,  1 Nov 2026 17:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcTNUsc0po6y; Sun,  1 Nov 2026 17:38:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 57CCB40574
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554682;
	b=UjA3Zw5UGM3mqUvfDn8rQMr8O10DaXPUyZtoKUnpIsbH8QecZftV36rZz/OZHzkaV0Es
	 e5fGW4BlarO4aSMjNoiao1YVGhC5kYhW2aOCCOJsRZOIAMFvod1AEmV92N/OcK+uccrw4
	 i1/7cVUlpv65aPu8fkDa/MhWB2S39vFfWUpKGfwItnSVz6t3BC0t9TWjdSNgGD2k9A4c7
	 I/ozRuM/NmNQFyYB3Bo/2jp/xCwSNAmtiIkX+gdBtHVKhDIRFK82Q7rgVlfSxMmUW4uNq
	 urYIsFEzOuDKrBuePQnTPFq6QZEXcAK/pn1YW3km5GAdgqRzmaFLDl+3nPH3gImUQ7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554682;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=me3hYoOXjxm6KImymz1PYZiaHzkWgWoebhL/pfHGmAY=;
	b=k46TMgxwDFj5n+tt3Wv8sxJyIP80YZ7HsVfCnFc4DWexgoBS3Zzd6nRsVAyGCUfA4UFV
	 DcEn3hoyFVYa/Hv6c4S9Dpr83XThNQIMtNuGPL84/HA3vpdL9TpMsmsENNyAzsQjfnIe5
	 8O/UdyCZ1kTrLJEJpqs9hxd26a4WAjl6cyVeMVZh9n7cXL39IZHsBj8G8mB+jUUk1PCKs
	 eqVwHPX59HX4kjSw7zBCbEh1fNaa1JeklGOu6LJN9ob9W8LBYzHQt7Y+zOeEuo1elnJlQ
	 2UTUJb9j2lphJxzFluc7LrDoAcsCuaaumi5bHCUHeKC9XOdt5aDPyqFhBpaJmq/Osfg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554682;
	bh=me3hYoOXjxm6KImymz1PYZiaHzkWgWoebhL/pfHGmAY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MKKHVleETU2tj0Nklh0Xw0Cu9dGxsm3e3aS1I87Ymyy/5J8m4g6gaBGSyaFh34kig
	 bnHXte7agf1CU+wK+UBx6TROOQBnI0s11KkbMaQPAsXiMPJia7zg5bKiGDuNZSFN1b
	 Wiq2kwLRO9cyjtUjGFQmrplP/4Ec6TcDi8UYJmnfFPIz3MFWyesVVCMFL8E4HLrgBJ
	 4DqlEPpO8z+6plkkQI50BLpIFPka8ROkIO2H97rFACNjdmiwy4JjcK/mkgNHuP0BtW
	 rF/pZZQgYdStmIN2dF+r6MzOz6LOKkCKlmMwbAy0oERutiJaDCAGlBL4ZgPiJzrJ4T
	 v0uCYIeiBDVvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57CCB40574;
	Sun,  1 Nov 2026 17:38:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE03323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 003FA40574
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlvcX7ARzkUK for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:38:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B4CD40556
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554680;
 b=nVX61IC+8DQ0mPJ3I52gkJokJPSSQILWCLEZoBp7OCIOCJNTOknpNmoO5m/p9NVni4Gw
 ea9mGkC0OPNQJKcXg3CxH17pmbY6SjsSyilYi6gNJSep4pVueLcDGXfvD1ovhIxMLTqhk
 H44loCbytwu22hbdMiTwPpHUrS1oOgUWdeiMI/Rw0e9pkBYCUrrceMxZGKM95WJQ0aD5C
 u+2DpHj5+wMtudVbpfhCB0MwM3CBf3iPMWaJV5KYi2xnlQNxBPAbe4RJTZGiWJFCsCgzY
 kLZzygn1Ua7Fch5dAx+ImandlL4FvEeyTDCX30ZGDYMK7m3g7vxiCK6TuJH4Ar+96VQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554680;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=4p2TtauO6k26RNYVaMUWmADvw0JWy1PX+LfXcSX+s5E=;
 b=fsnbkhn4ZkSj3oRIn65LAbyZn3PpsXuKT6fYxWz4ux7mksBQp8IYkWcgHijMqdni6s31
 j1Ke3otR4wdNXSU3y8JH5qZ6PUzpb6Czi+JnPbgTe/qol//SgaE/2WxwtbCBZjxikmrVp
 hwv/X5sK62MtSZjPCi2CeqmFm5PKvRCf3ZylSZuBPxrNVE69dbwCDqs6eJbakbE1GRK6O
 DxmFNH4XXqr5dbKqX64MaRyq1pWy9yg0Nc4usRZnSGg03tYAFo/4qX0k48DMVmZBGJtfv
 zqAg5QSqoFFjtB07HY4Aem43qE2rXxosYWeeNx0ueUKWAXrSsmI47AtyKkf2QYr9ERw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OOUdLsM0; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B4CD40556
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:37:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4103160129;
 Sun,  1 Nov 2026 18:37:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:37:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:37:57 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031201918.2850153-7-james.hilliard1@gmail.com>
References: <20261031201918.2850153-7-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <a3802e51302653b1071a12c92f1649d6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-socketio: bump to version
 5.17.1
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 21:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
