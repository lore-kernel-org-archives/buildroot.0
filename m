Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529D1606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G8wDerWn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C9DA81542;
	Fri,  6 Nov 2026 21:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zu_LB3chvoRw; Fri,  6 Nov 2026 21:17:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 680C981589
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999823;
	b=SuJ7UYx0vG6SBypUFd1H/jv1qc/6dnA4F3Vtc1xWm0b/QVceZbBHU+DdTGfe5v4M8jcQ
	 aABBGgsVdyMLbPf+9pshlPQzm1paZusSG5tIJTyJrZMp8v7DAeNAFZ6UNh75kvkdM++jG
	 LkR5KhWVFDwUxRfZTvy6i/hmHz/FcfVdueroDqD+KzgoKkYvqxXtTVG3hieviw4vp7d77
	 QhBwI5DFU1EHpms+Lq7NNNGVBBTyiFkSDjuMk9YSoMf3dEn2VJP/k7mU6iRV/07aUBQFd
	 5q4m6dSHYGtmxXog6ZsbCYcXeNI/C7VVVw8kFWQFHbfxAD/WxwLA1YiSCjRVdgAihxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999823;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=K26EjC6VGjNh/KfhjDTDqkLNwMCdRQ//yYL1qv2dshU=;
	b=a7JcY37ThzEJukQ66hn0hzh4uHZCfb+TJQJpJkjhsfJcQGDcmtciSX8TA5SqELEWNPfP
	 6uMcc5pkGyIiw6Ew5d1XttzDLh0X3YW49L3CCqC/KZNrhsHTMxWG9GDMgxzQ5TSoX8zmi
	 pxq1YUoxs7W7KTB5F2DaNPgWspGBAy2UsDIC2j/x1w/SWJCkfLPakWdVnkqnX3RhK+Odn
	 KQKCsQfKQHjshgfWam01Qg+6j4btZux12D+lVDECnVdA7rA9e/j4qhp4Fex376tQKO4ku
	 wb+FHiwYPHHS0AAbANVHmMI5kQEVOhsIDlpE5U9aRtuh6SUunPStG9pxnWoSpQzQ7Uw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999823;
	bh=K26EjC6VGjNh/KfhjDTDqkLNwMCdRQ//yYL1qv2dshU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G8wDerWn6hNJFxJU63lZDeoiW9Re3WGbemAkxcYEAIAGw2+TOb48E2W5BtxK9Bfsv
	 IGhM/LBouBnza3Gmh2WGqXfl/MXjbyDo6OULM6FA6wez1DRraG5skZQjTX0fMlhS+P
	 SeKzQVVLSKWA8MgRYljAcLaDOwpErNuVuoOf5x56fGjzHAzHe5ADk12xLgHc/BwBUi
	 IdQt/aNpvr/QP3ezJ5OpHjqI8efMZFxHhXr4R4HdVVsx5Io3jqj/0I4jVFlfOsFFg8
	 jEoJZuj1P0LQSahSbf3rEnTTbAl/xlefSe2H00T/KizSs+csu49SWl3uY1iwKpwY7O
	 zTcQaNM6Snntg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 680C981589;
	Fri,  6 Nov 2026 21:17:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F7B3235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35FF781589
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89druIE6EoSG for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:17:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 67D6281583
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67D6281583
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:17:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9E09619F574;
 Fri,  6 Nov 2026 22:16:53 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:16:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:16:53 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>,
 Thomas Perale <thomas.perale@mind.be>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20261106191536.2120153-8-james.hilliard1@gmail.com>
References: <20261106191536.2120153-8-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <aa33823a7abf029eb153285f310af85a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 6.1.3
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

On 06/11/2026 20:14, James Hilliard wrote:
> Fixes the following security issues:
> - CVE-2026-108147: memory exhaustion via base64-encoded file uploads.
> - CVE-2026-111211: log injection through geometry form values.
> - CVE-2026-111362: SSRF through GeoJSON coordinate system references.
> - CVE-2026-113593: private data exposure through cached Vary headers.
> - CVE-2026-113733: password hash disclosure to view-only admin users.
> - CVE-2026-114582: SSRF through SpatialReference string input.
> 
> https://docs.djangoproject.com/en/6.1/releases/6.1.3/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
