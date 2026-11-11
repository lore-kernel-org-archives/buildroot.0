Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E5606A321
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 09:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CwOmmgXa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=fPBD5fWJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B9460622;
	Wed, 11 Nov 2026 09:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iITy22Cep7Sy; Wed, 11 Nov 2026 09:12:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C139C608C4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794388346;
	b=nttWkV1yaEGKr3q5bxcgggNGN+dmDHjaKlF6M1s2GLrC6TV6dUN2nEu3gc+hKmJ9KqwH
	 J/QQAAqlmYGbBhw/bLdc3cg/A9hWMFBGRzJFH8UaI7fN6o9gJyTZe2kTHgRUj8xKNH295
	 NVPgzgNz6MyYmKall+2rmMPYEhTTaxzMLcYMSiN+zG53EaoRC8MMMKZhaUXYsX0pb8NlF
	 mkVF81jCDt+fB8Ayo5CnWJ0s0sp+YmU7NWQEWvTmGV1sDZuhH1LP/fWTWzK9IFL6wBukO
	 x34C/QXvLV4qCwq2rDvm1oQ6thrJgHofipQdnJsjGX1LcNYxqx3qzBDl8tzUNpZRkGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794388346;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IFpno6eiV5elu5cqFvUmrSUkBiwshziTOBTz3dpwkf0=;
	b=MsztCJBV0YRKNTDPSkG91652+8f/KFMZvk4jgmQlRLKevaiPzrWS5mY2QgJLYTjm0vOV
	 LPXvRKr4cwky9s4fhXXt1oawMJoZfx76XoFt4IKI70gSvuXYkz1s+bVYPUVxsK/owwaP1
	 yGsQPq5AWTbWLpyaUEKYRnEwIyNHKe9zDWzibAee33AGBUErH7fNIiK1XMvAHNcoR3+aV
	 fgE1ewYxgnB8rpBjyAuU1dudIqqL5zo/LsqlWtWUCcxTkOtsxsp3vq9VyPnvgT2C2vLQp
	 GdqEEvM7PQmFDRO6Bb2igQQ3H9x6Y/n2SJqxK1xGVKkIpeDIW8ws33pvUvJ6mZQqmdA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794388346;
	bh=IFpno6eiV5elu5cqFvUmrSUkBiwshziTOBTz3dpwkf0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwOmmgXapLvaSnb+lMUmdaplALvsA6G/vKDFC/OcdEiowZuGA/zVYlw+vAAWiiLvo
	 R0gFYpHT5Et8X/+5uYZcbGWVU0BCPqYQdyLiA8jUYhRf8IzfliV0M+k61nf1EVMWGQ
	 B7gTTsjWaR4eoDwZLOoMtX1Ck5kEI0ifv8FjQXnA7bFNwXTEH+DESfR+WAgD08DWRU
	 hLQsgGH+qa7mVJLqrE79PtMuslJd2nl4d++jyahAQiD+L5XSiuBXBgxLP7V4ZYTWWj
	 3kgmXc+lQKtvdj6LGQGTpfsHO7ENWhkHhqxE+YaHFiU7E/+1piga0ritH+xc5Hg/ol
	 rSU9SKLeGja4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C139C608C4;
	Wed, 11 Nov 2026 09:12:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F8B0731
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 09:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00A4C80D3D
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 09:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCHvx-mLvBLi for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 09:12:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 72FE580D09
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=fPBD5fWJ
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72FE580D09
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 09:12:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=fPBD5fWJ81l/6MKUG+DkAi+kPh5O0wJrPc925GcKJ6ol3wX6aATyXxjpQPVLMeoX2dmU8/RqBLT5wpmHwRt6wH8yVT3IeCQjtw3V5DYsWjxDZ7qx5IJtKxRttctFYrUXjjXvtYLHuQvgDrx+4uPzJzh6MwqGBlZMVNY0jgoN3zsrqtiy4XdOR77quskbE6+9gXTehycvSu4FH5YAPT6Q1ARPMvDy3LbrhxjcwPy+uE2au02w+2u9C4N79FJ+4rQmX/Tj4uypdsZE3FptD9Qxh05wRvrbZrdnwC2kARMhTiY4+TZwxyVDEJsSN+OnSzhCNIArVQ1JJrjHhlS0JIEDKQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=S4030xms3E1jjolUOR1rLOk2iP2gezoWRoqW25waOuY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1295471385; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Nov 2026 09:12:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xR4NL-00000002Kb1-0he0;
 Wed, 11 Nov 2026 10:12:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
Cc: <buildroot@buildroot.org>,  <arnout@rnout.be>,
 <luca.ceresoli@bootlin.com>,  <thomas.petazzoni@bootlin.com>,
 <michal.simek@amd.com>,  <ju.o@free.fr>,  <brandon.maier@collins.com>,
 <romain.naour@smile.fr>,  <romain.naour@gmail.com>,
 <ibai.erkiaga-elorza@amd.com>
In-Reply-To: <20261110185329.165764-1-neal.frager@amd.com> (Neal Frager's
 message of "Tue, 10 Nov 2026 18:53:29 +0000")
References: <20261110185329.165764-1-neal.frager@amd.com>
Date: Wed, 11 Nov 2026 10:12:15 +0100
Message-ID: <8733t7u3yo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/xilinx-fpgautil: bump to
 xlnx-rel-v2026.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Bump xilinx-fpgautil to xlnx-rel-v2026.2 version.
 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
