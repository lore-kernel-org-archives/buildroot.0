Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD890C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 756406076C;
	Tue, 15 Sep 2026 17:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6x5_iGC6xBd; Tue, 15 Sep 2026 17:34:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 95C176076D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493656;
	b=UdjEWNwybFz36EffyD/7iM26xA7SGBrY4rD/DOff1CosIarg6XoWOhzR1sRGPWuf/Zn9
	 pshq7YYDDTKrouWkQRMz2B3TLA2iWLxWTf0KhET/NTFznkng2a7UWZwJPmYJ4fF7Y2Mqv
	 l2UlxsweXVHzIj8hT9fxteJZCr7r7mCdgt6ia+uyjDw9RmttT8oVbe3NSZQXHsBakjD5/
	 Ny3Ee7JJhUPyOzQRohxHKlWXid7sLr+BcpDEx+Jov0J7ab1/Q6W5tJtOY3FKsoFk8uob8
	 fvcYFhEHbEfZuaeF3nM4RespeMwpsgRFSIdbsjLEM2pGp/tOvRAzCCMMRV0aavq8zJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493656;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=4Y/81ClOCp8Jxv2LZoqTmC+gzS+k21+Dn08CRoZGrN8=;
	b=chl7lDMJgpof6GKgnAw3mxAZH/0vaeu1jzF7BWfT26rvFMkSB1wOc3OxHIlwdutTalBs
	 z6nZseWyf02gXjQKeu0/ps0hZFyA05XpTuY3AnobG9hqor+Lgug02APS04OgEej4POSzB
	 3Pl1HZrOfAOqdd+Iu1z4fW2xBkL6UOs1/y4MqYR4YYIaMmOgIHT8Z8BBJg2kTDyuKTEuH
	 VbFctugjf4+2QyYDt1A3zEVkXZ+x8PDbgWWXLu9SFpgTxCLDipw5zY9qe9qgV+F6jYtMA
	 pvjg7gYipIqxTif6myef765RTefn+mduiznxHJ6HSXzamiiLZux7aAdf3WQsagnMr+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493656;
	bh=4Y/81ClOCp8Jxv2LZoqTmC+gzS+k21+Dn08CRoZGrN8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VOYVJYA9KNAEA6GjpC+cpVvI+5TJkWXzahJuTWQlvuxlYmmCPdNH/BWy4m063ZXr3
	 g7rBw7jYJW2cUPvqDm08xf45kZm9mx3Upa0Eba6NEAgkqBtaUcbiWh2QCLRmHrdghA
	 pDwlswJIiD0QxZ4pNN8PbCMA4gbOGd7fOv78AdbCTUDDdJ2zO4s2DvFCn32z5GgGex
	 /jd6w5oaKAzWpyCGsE4+QsrufpSzsFndfw3O3+cu02TEXrsTCXFfINA2LwWK4rTHsx
	 a2x/p3PehXMswsLTfm76++u8WUk0HZBFfhkVAVOfILozm7tDg4Ds8dxp8UXfVyetpC
	 VamJlGXv3QYow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95C176076D;
	Tue, 15 Sep 2026 17:34:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A594D23F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9731240535
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWA76QjgGIkr for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:34:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0243E40400
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493655;
 b=WYz+XlqWbUmIuMdMGlcgUTNumUHi3oKQfUinhed2sxSTHRXDG7EcgMQgMRCXyD0vq6k4
 HFX9vQ1sAKbQegiFlWUHicGTKY4k9aQU6OTAINO4YCowuyVnYyHPbSEi0Ogx9HYuwPTp3
 WUQVPKRH5M2Lh4dwIDtvbTsIArsopsjDj/tByJDMiOyzAXmtxmA/WEdGToDrZ1/kSAZsM
 c/atwEcCClVSkltrMl864+jcR9Xm+lhy4H/dvbfcB32h4r5C/OtD83eM3uh7DZrITWjw7
 5R6nAVAgE3zh6+EedZvoaNQepdokXvvuqr4ZeAWYdSNr/AInbrW1VI0lzd30TXkggIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493655;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=euK+gC/+4XmRlRmQrCjas8upjDYMCWC/m5wq9PvP3Fg=;
 b=TT9FoWGCTpnLgUJ4vkLDYG5T2V2pxppYgDW2X6kS2eDiMlLpiVpPRWb3bIu8jhRYv0dc
 48j6nYEny4oAsN+HPatauyGC33RQB9KVDUagjimmSp/7NdRhHmfZW4P00/98e9d5mcJVQ
 uiSwW/wsFCG8q4nkeA++7bEK/Hhjg4eygxHYurNX7wCl048ds/jgugHClFt334I0BzkBS
 NhdpP1J6b/0yCUX65dkJDa0Ww1a5k56LIc/nwUs9D2X4f8h5U9D9sVQsonhXSofMEpnC9
 6TNTNdLZJg7b20RCbu5KClI/8hSoJbzbGSEIf776ZXyGWiqeVTqvrJjgDy/pEXwSb2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q7gyQVrQ; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0243E40400
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:34:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BAFAE13F880;
 Tue, 15 Sep 2026 19:34:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:34:09 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:34:09 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>, Neal
 Frager <neal.frager@amd.com>
In-Reply-To: <20260915123932.1956884-1-thomas.petazzoni@bootlin.com>
References: <20260915123932.1956884-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <cfe7f2aef2418ce29dd88323f97bac48@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/xen: harmonize
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS select
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

On 15/09/2026 14:39, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_XEN_TOOLS needs the full blown version of bash and
> coreutils, so it selects BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, but it does
> so only if BR2_PACKAGE_BUSYBOX=y. Which kind of makes sense, but is
> not aligned with the vast majority of other places where
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected, where
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected unconditionally. Harmonize
> this with other packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
