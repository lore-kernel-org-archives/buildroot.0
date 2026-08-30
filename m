Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D286C61DE1
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 16:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69091605EA;
	Sun, 30 Aug 2026 16:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiFHuX3lmxUh; Sun, 30 Aug 2026 16:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788108652;
	bh=O287sJLfKNAHwEd2HMZJhFgoaxJg8nbHfohQP4ABDrs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nAf+3SXnscqHEy23/YH+iKM16we1gERQVoBpdd5BEX9MMawDoR3oSKsgFkYH5g67j
	 i2t0txjYXtSdJN/EbGQ2JBYXFASCRYJKASFGkBOJpuUFenopCywlpJ6RcrhnuayfuS
	 PQNPj3yF3uXkb9UrK9mo/r+PZDJAMiHt/AHY3eDnjWSGOn1cLacSY25TQMaJ7DLs25
	 GeshgLjxQ/TTQazFgxzgjrue6pNgTLtqM1SkBlk81MTs1en/+h7IFSxhqfsZa9gOsF
	 mje8wztSQdy5qM0KQPdHH6MRya8s8e6DHd5OHqCduVtS1yJflAiHKb/+USNSC7Oax5
	 qJXxV3HfgaduQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A1A5605E5;
	Sun, 30 Aug 2026 16:50:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF65C265
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 16:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5EC6605DF
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 16:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoeOxIc6Oiwo for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 16:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 906A9605D8
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 16:50:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 359902003CE;
 Sun, 30 Aug 2026 18:50:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Aug 2026 18:50:43 +0200
MIME-Version: 1.0
Date: Sun, 30 Aug 2026 18:50:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260829190755.1764700-1-bernd@kuhls.net>
References: <20260829190755.1764700-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <d4cf2a6169e908cc3a8858f6738e1ca7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-36-g2d5421ffc
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

On 29/08/2026 21:07, Bernd Kuhls wrote:
> Fixes the following CVEs:
> 
> CVE-2026-19499:
> https://gitlab.com/gnutools/glibc/-/commit/63b53df549451a5d69fcba6d7612ea99f517e8e3
> 
> CVE-2026-77117:
> https://gitlab.com/gnutools/glibc/-/commit/6f9b2bfa500bf5d1cff5d990adfff4b71298dadd
> 
> CVE-2026-80489:
> https://gitlab.com/gnutools/glibc/-/commit/cb61572ea3f773e1e1978f6c412cc36a30acdb0c
> 
> Added GLIBC_IGNORE_CVES for CVE-2026-19542 which was forgotten in
> buildroot commit 58f31377389dd2f5090e4dd69deb4d5f994f88c0.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
