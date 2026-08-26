Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7697FC61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D01440752;
	Wed, 26 Aug 2026 21:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dguIm78Apsw5; Wed, 26 Aug 2026 21:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787780859;
	bh=UTylY0Hmg8L5kviIQOYIgvo2bSS3aONe4AZEtUmtOgE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eExTsT9PiuND+5HrJUeVmFRkRNqUtW1sO9Gbeq/dx74gAAu88qybFNB236pHDOguB
	 vfrqOYlfyxcMkh2OptkG0wJTV5ZxR8ix7/9+yRoVy5/OyOMVzPJJjNlIMSNQi7XWFE
	 5eq9WYcYUcdwJZP4xwtHmmOLwpyldlw13q1XOYsXodn4aFdv5OeX5YVM10Gni1CKeg
	 Y9Yj03UhSgPqBsUPh36Lted9D2UtjLAH+tzAuQVBOCWjvx/wwL0aX2iGMf/7emFI8Z
	 iiRiVU8OmJ4D54qD4p3C67pOOTlDw/41XCnXgVrbp1awhj+uhrqGLJ69smYMPQcJoM
	 p1pucEftnFdWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98BD8403E4;
	Wed, 26 Aug 2026 21:47:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A3F8230
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 206EF403E4
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZTj3pyli30R for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:47:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CDE2403BD
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:47:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C686E780333;
 Wed, 26 Aug 2026 23:47:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Aug 2026 23:47:31 +0200
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 23:47:31 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260826154100.4144157-1-thomas.petazzoni@bootlin.com>
References: <20260826154100.4144157-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <afc8ce49e89906c5e6b5947fe02119c1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/flex: fix build with old host GCC
 since autoconf bump
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

On 26/08/2026 17:41, Thomas Petazzoni via buildroot wrote:
> Since the bump of autoconf to version 2.73 in Buildroot commit, the
> build of target flex fails if the host compiler is too old, because
> the flex build system tries to use -std=gnu23 which isn't supported by
> older GCC releases, causing:
> 
> gcc: error: unrecognized command-line option '-std=gnu23'; did you mean 
> '-std=gnu2x'?
> gcc: error: unrecognized command-line option '-std=gnu23'; did you mean 
> '-std=gnu2x'?
> make[3]: *** [Makefile:1162: stage1flex-buf.o] Error 1
> 
> (Indeed the *target* flex package does build some host tools using the
> host GCC compiler.)
> 
> To fix this issue, we backport an upstream commit that isn't yet in
> any flex release.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/aac730b57adb5b54964f1054de781750952ef7d4/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
