Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BECBC3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D409281E4E;
	Tue, 20 May 2025 17:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TphiCv7Fl2Lc; Tue, 20 May 2025 17:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA7F78130B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA7F78130B;
	Tue, 20 May 2025 17:22:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43A0DD4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A9528130B
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpgvV_n7hJWA for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:22:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5EBAD81166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EBAD81166
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EBAD81166
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:22:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7CB1F6013A;
 Tue, 20 May 2025 19:22:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:22:29 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:22:29 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518173953.2148256-1-bernd@kuhls.net>
References: <20250518173953.2148256-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <3c2cffcd193349db0a6ab1c697920867@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747761750;
 bh=FRTsrzUwbaOTAjeyK28DPUYXk7PHn0xNdNH6cVOWkcs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pKT0Fzvo+a2aUS1xBzsjMdvreBxEnXhUwEhVK995Mzjdtnyg1o9W74wvHt/f4h9T/
 w0fq+wUt4A5UviU5DbFpM14yVli06+6C/ewqxqbUF+r8fIx+36AIRkMJRdEMJgwsLS
 5Di8leL/Sx0W8suEDV1ofROHCBXohfBcblNxpuLxdHUjg0PkF9Ww2QRb2ZlCJfTFKA
 savN+yKgVManmj/o1p5y2UUGVFHHs84eyei6NYVb4nDd3kiR2cq4ILWzQtXvDk271c
 f0o27mdltliMPwsZjGSkuI2A7nuWD1sMZa41QTHKQg/fK5eCbaANmn5OBzR4VNoSF/
 x6QzAXyWPXMew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pKT0Fzvo
Subject: Re: [Buildroot] [PATCH 1/1] package/libde265: bump version to 1.0.16
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/05/2025 19:39, Bernd Kuhls wrote:
> Release notes:
> https://github.com/strukturag/libde265/releases/tag/v1.0.16
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
