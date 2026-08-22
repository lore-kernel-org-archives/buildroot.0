Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2013C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 10:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A19A409BE;
	Sat, 22 Aug 2026 10:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhj-VSa052Fb; Sat, 22 Aug 2026 10:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787394758;
	bh=TDgcohGIKAVlbRYFH9uVILmmO9uREahw/Bx17B5u4vY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GY3StFUBioV0RLv38kAHUVaRPo2wfdtiUxYFEqr1dtwdPNJFgP1//SiS7ghQ6Co8t
	 WFyLcoyNCSKbHu5Nd/S3aAo/WXVWj5fQBSLpDIIkW9lF2jLWKmt3BONfVTggZ3Odis
	 /dPkRhZ9fy2XEVO++sn75xqXmCmOaoyc3bmVY6j2o0oDmBoDWXNfiTNwQ3zWcsTFkK
	 2l27uLKLnAO4+8R8bbrB03GDxSXc7WUGj+OUnrOnBaK9GgZW9pe3Y/BzoIOSYCvzTe
	 keUg8ObVbC56dWgSTPvzEw/VEQH84lnNI4FkvZz+fZEZIOSdgvABm0G7DOrE0m5zJ5
	 yjaSBHnhPmqSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D07409C0;
	Sat, 22 Aug 2026 10:32:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CBD1476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A1FE409C2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4eqtFe-xLKK for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 10:32:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E1EE409BE
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:32:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A71A513F861;
 Sat, 22 Aug 2026 12:32:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 12:32:28 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 12:32:28 +0200
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260819-bump-python-scp-v1-1-562177e2911a@bootlin.com>
References: <20260819-bump-python-scp-v1-1-562177e2911a@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <382785459463c104a29284ea6eeda337@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-scp: bump version to 0.16.1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTkvMDgvMjAyNiAxMToyNSwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gQ2hhbmdlbG9nOiAKPiBodHRwczovL2dpdGh1Yi5jb20vamJhcmRpbi9zY3AucHkvY29tbWl0
LzhmMmE3NzhjYzZkMjk4OGIzOWMwNTIzZjYzM2QyNzQ4NGU3MmYwZTYKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
