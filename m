Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84323606A32A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SSsBvu4W
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5074E80E15;
	Sun, 22 Nov 2026 11:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aG9uyveC5_Vd; Sun, 22 Nov 2026 11:19:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B1BA80E0D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795346389;
	b=Y9jg0RtXApJ13me4L55jMdsgBQC/rE99tDt/cYuXbCjFlL6Ur31p1z29npVl5M4OD4an
	 c+rP8D206YItdN9RUZE3MgszApU7G56NUopyK++SNu30EN1Symp2m6nbNMMVI0VWlzz4r
	 CgM5tREyVm7knrhiYUAjTUODB6JtpSHAgBkgQJlyHLOFXaCwcNRZQwTglCZYuVvLr1unZ
	 7vWx7UYDdizLgVK5YxP630kMCtsYm0D/0ho7cGo1UgTqKrd+YvLZoKJNKf4ahqlo99eZl
	 u45E6kxEFxuI5fMm6bFSmM2QsVR8CyaHqC2GCEp8piwPMtVxuInmEVxW43F+qM0HToQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795346389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kVRSDSRl73NuTo2ISCnzj27XdOScsDytN1H4Wzl2AYU=;
	b=X6XdMz6DdLCPETBfh1K61vEnHBAKN92aQ0hyjbPyGOHPgWroZ0rhEW3TXKmREGAX4gR5
	 O+IRu5kaRph2AXA5ndiirtUZHUo9PoRI1OnlaBvuAX2o3YbDiZr7PVd1lm51t4kb4mexS
	 IlysOLa9PnY0sp2CR3QdnEIDicCXn3I6lu6gFlqMeB6SWKPxHlVtEAxhQ34at04qYHTN1
	 B36HD5V30DWPe5q8tTPwqvQmJFFGT6NDu3POOzkCxrQ2fbNS/bFkZZa0ZWyIZQmraY9qe
	 XH8r7FGsifpB+7ISwiwawX7UemUdRnuozSwOVazqOkTZfJraVgNA24kr9Gqe33kSCRQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795346389;
	bh=kVRSDSRl73NuTo2ISCnzj27XdOScsDytN1H4Wzl2AYU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SSsBvu4WCt+dTW5P1MgtELiMD3sbxCVwA3baaTuq7T9xNHHmlQ9pTQhv00S8li+KZ
	 X9HpWZg4nSzCkgyl57QxiNOPeA+S0j9tfrUi2L8Z6VukmtuKa9cBhVWAmhyr88+8we
	 HLaApHufeZmwRlTHRiseiBhDAN8F6WSX84Cr0JZuwxTEnaO+ejBKu4oRajlWBQMgVm
	 OkMpY9gMYnZEOLxuAJz27OrRpMU/KTvLbkqBqUEgWt30R2lAFehSLPQGm+2E4jfAgA
	 CTVKkX85ktJaZiCrVv5JqWij6OSLWQVBEIv9gFJ1DHLGqechOkEW4GM+dU7cxLql54
	 xTYxg08Elhz0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B1BA80E0D;
	Sun, 22 Nov 2026 11:19:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 809C122B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 11:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7297740695
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 11:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPxwGfocH0Ld for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 11:19:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A10F740692
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A10F740692
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 11:19:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5196C19F57E;
 Sun, 22 Nov 2026 12:19:44 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 22 Nov 2026 12:19:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 12:19:44 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261121074223.790556-1-bernd@kuhls.net>
References: <20261121074223.790556-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <70c3b242a2c13946ff0e71436fcf0a7d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/opus: Use vcvtaq_s32_f32 with
 clang only
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

On 21/11/2026 08:42, Bernd Kuhls wrote:
> See upstream discussion
> https://gitlab.xiph.org/xiph/opus/-/work_items/2397
> and first version of buildroot patch for discussion:
> https://patchwork.buildroot.org/project/buildroot/patch/20260613215558.978962-1-mcdev@playlinux.net/
> 
> Fixes:
> https://autobuild.buildroot.org/results/e7396609cb47827bef2a220cbe1f46167dbf7ec3/
> 
> The build error was introduced by upstream commit
> https://gitlab.xiph.org/xiph/opus/-/commit/d4494e6ed7d564cbee3cfdfe41d0c0989c4345ff
> which was first released in version 1.6 and bumped in buildroot by
> commit 9e779d6e57add2e1a78addb02ab45fbdd6a457e0.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
