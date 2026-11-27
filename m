Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F05606A324
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 16:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aJxR7Ftv
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1611240B12;
	Fri, 27 Nov 2026 16:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJbdc6NSUJxj; Fri, 27 Nov 2026 16:57:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D351A40AE4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795798675;
	b=bNzAI2IIc/I03GzdpmwDwQ1KGNWhbIw5UIVdKC1T6CN/Ed/+CxuvH3V8qWZ4zk3lOtqM
	 vLl61hYJ63N45+aQYMl/kJfIg44gTkSo2t0akAVQEbS8mX9ek4XWLP1YFwsCD3h6vbWAW
	 ome6djHCYYDKI6fqxTNobyCe4AcM13TQCBsjySOyUsp0xm0I8QtxJVMKK4gTtAs3H2hrv
	 GLuVs1q0uEwueFixQe5ANf2LjmwJ59NN6v93+ULyqm+obi0XUZ7AOsB5eYj/6Co95Z8SE
	 FTbryckVIT2hHmlMkfAa/JnKRrcWQGidixioh76oEzQ5+Q8V5TYYKXXsu0ipr8tTzoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795798675;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Mime-Version:Date:Message-Id:Cc:To:X-Mailer:
	 References:In-Reply-To:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oDu96axMpOgy4kuJ/dk7Zv+2zlrhvpDvDLYSHEGDmOs=;
	b=WJPE/bvDG9Z6ogJ+GnA0EBFjfs2oAVsr+DjoGX0OysHaw6gvE/YZnHam2aVpULVKuVqS
	 JyfuOgl9AL0Vj0GQLqIlL/Nl6gggS6hosgUtmkixFchKjm7G3Ht32J5HatFx+1zkg2aQG
	 /eFMT3jwrEUizcLcCkl/WHB+1opxN3zuBuo5q4P06QREYF+oEum6Fbd4do1VAfKcAkm56
	 03cHPN+Lh9nqnUCki7Sz0U5geSnXhh4vcrwn6zQFll+lx5SMvEvAhaYjW2P71TwPl+o38
	 pK9Jc2LySZNV8Xvk+oXklWPYC4j+83U/4Z0arxFiIym5WJUxEwuZYAzZ8BFzKRbhNPg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795798674;
	bh=oDu96axMpOgy4kuJ/dk7Zv+2zlrhvpDvDLYSHEGDmOs=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aJxR7FtvqHQL6cYUFVwbvLLCt8g0urDmlyON4GN41ER0sxoxx+WQMx56Y3lSEMJU/
	 TY4O1H9kdU6i67hFOR4fGCcUQAbJpBtBH/K4nwa/HdllqcPE0PZmRGduZ+RwHiowI7
	 oltlrd1vX7oeVMoM+M9ZLPFDigMGAZGkpYKzeCH8I/1wx/7sSe7aykwy4NwQ7xRXW2
	 ai2o+WI6v3Trj5Vso5Lje8fCeQYPKDLXQl7w5pGop0CnoG8Pz3p3BLkAYSN1X7Cdsx
	 dlZJ8IANXuN4PsJINnPZt4MMzEPAmi3YXDY/D7F82mZz5ohQgY5Gne3Tyzrr6C6NFC
	 kiI3odVsRN/ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D351A40AE4;
	Fri, 27 Nov 2026 16:57:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E05826D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F38840623
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fd1d6107QQU for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 16:57:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D49FB405CE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D49FB405CE
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:57:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6FCEE4E417C6
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:57:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D99A60603;
 Fri, 27 Nov 2026 16:57:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 986F311E90D9A; Fri, 27 Nov 2026 17:57:41 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 27 Nov 2026 17:57:38 +0100
Message-Id: <DN65HUO2L67J.3G9J8E4LN49R5@bootlin.com>
Cc: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Bernd Kuhls" <bernd@kuhls.net>, <buildroot@buildroot.org>
X-Mailer: aerc 0.22.0
References: <20261127164638.3676415-1-bernd@kuhls.net>
In-Reply-To: <20261127164638.3676415-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.100.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri Nov 27, 2026 at 5:46 PM CET, Bernd Kuhls wrote:
> https://lists.exim.org/lurker/message/20261125.130455.f06c6601.en.html
>
> Fixes GCVE-25-2026-11-82-1.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
