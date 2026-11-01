Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8582F606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hc3fuwCY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B514405B7;
	Sun,  1 Nov 2026 17:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pd21_AbtFE7f; Sun,  1 Nov 2026 17:13:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8F1E5405CF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553188;
	b=md2BxaXbggbOvbNd5WQV/fDjYTc6i2/g8F4DqJkFROg/I/SCrEJdLP/dLgHB687QgYl9
	 W3fAT1qQ+g+3wsVIhHsuelaWFmO+lhzQrc9gjPVYGzb3JWFL5XgvcwXSakt8QeBGlirKO
	 0IxYLXR/ltyPJ+Y5fbp0a7r80whB04vzpDR0y2t1LV3Rl9w4gf3QiPd6ehhxG+t5c4Xm0
	 vzb5uFd5YnKcHXxIIGwu0qbXEoxihgg81AczdT+rKIIXOVAW7Mv8RVchYn+ZmxaSVwLMx
	 NzVRkeuDFe6ptoV7hdhZuBGJb3QPzgi1oPUgZG1vGfuyreLTn8WVFuwvBCcDCJSuyiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553188;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=qWRBAfpDMstDFx3aVo7Ob3xw6ITRxWCnyeMyY1HprZAfqCC4TTr5eIcUqI9WyJHjtcjK
	 31WHJx1MEHKuDqLo7rrbvIXwuw3PdsCIwlzGyVnxsKjTf72yP1F9lcCsvsghtUJ4egxA/
	 27sFrTytCTq9XMYQ+VuTh1F/bS5JbyBbx2OQV+UE8RSNaJy3SHpRbgQqszxdPmxxjf3DN
	 nnOvCNR1pEIrLFDdSdlBFVAeTDurs5YuUma2j2wz6aOxHDjG+B7TBunTlhfYIoLkcXbtd
	 MgEJGmDYn8rhcFwlBL9jqKt25iUyOnCUGirF9taST/tzS6QjaR6y6KL/fX0MOH5eehg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553188;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hc3fuwCYg4elzyy+xdwPlZ1hNXBZuRmXnkYpFbUtlbmNWrfyt95+OPPj6a6omGCKY
	 pMf43ZTkeFC/nZ1PhPAKGO/GUYgNhkt03/voJZ5vfXDinWfZep4+LLsdQ6UFBVLV23
	 BxzUEJ+V8zvYhkVaMMhqfeWFYCRqbgM8I48oVtFIImG4x8M8//7A0rwvEKPpU5ZJ7w
	 Ahy+kybnunz3xdBcfQ4rXVC3K46acgwArKBQja4acHhNw41/IbjfwYsPuGaCHtmP/i
	 IG9yTvXhuvNtXVvQ/J561/89Nhq8VbgGk9AiVNuTj1G+rvntBX3w+5GhjAn4oVzFBF
	 AYjVZowcymXmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F1E5405CF;
	Sun,  1 Nov 2026 17:13:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 626B2EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54A3440076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxi-Hvcu06Ro for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:13:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B9AE44004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553186;
 b=BkcOtGNiqr9mQ2QcUUBrkITkT7AUXO8kvJSUwS1K5Fsc3ivwAoiMWnSXKTlN35P+0XXE
 s+M3skQsMBvlaaXSRgbywaa7Wm0+bJtHyPachwkFQ+SB2R8HlDwSfb2JeHN4wrtsJNRHW
 mH4XYJL2RX6kkJ+gBIfg/9cC0g24MiGewDgC8gbEPaNuAHTLtRy3dskjH43kHQJbcZs90
 HlFk8WzqlcIFLwyrbBulMERcucYZ3h7/NQVMlZRZO9tt1SWt/1eXWwlsoGV8syRQXg4Vq
 8Wkkp94XdHGorLBURpsd7vV8JnZvc+mzNPoLs1Rbbomg53cbrECD1lcANm53VB2MkEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553186;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=N73X5GkcS8/A3YYAhCallzkwgqeBJr6I6wXgTFyUkWMgxRKL1yUec0LcDH7rdke6dd2Y
 KJRuWi+120YgXBXKobPpoizK8I9hh1MpZamCPj2qqR7R/PAClgW9f3CcqnFCRy0Es6u1F
 G3Fy80tcRsy77dRhFNr0RNppRzfMVz5d4P+U2jAsnvn7zgBZ9qJADrrqxWBfawoX3QWON
 mpj7k4nmMF3wnYEIx8Z67GzHy22whlLp2eho0fGJ/ZGtP7P6NjvrQOmvixjXs1kCmc5Ep
 rNFyigYloJNSwN1B0DTkB88zH5EnuytSNh3WAUPPzAvaV8Ii8eYf3oT29v8r6badnKw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MGLi4RNK; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9AE44004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:13:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B3F1F13F8A7;
 Sun,  1 Nov 2026 18:13:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:13:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:13:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20261031172019.2683287-19-james.hilliard1@gmail.com>
References: <20261031172019.2683287-19-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <c45627ba0bad2a957633079f500cf995@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pytest-asyncio: bump to
 version 1.4.1
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

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
