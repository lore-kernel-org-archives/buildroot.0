Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DFE606A8A1
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NGMg4eP/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=h8Z0CY1v
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF6D40977;
	Wed, 11 Nov 2026 11:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErWDYVWtY47w; Wed, 11 Nov 2026 11:57:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1A7CE4097A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794398232;
	b=o6vVwRD0tza5K3Qa24lqggjikvfVK6m/UP2NvybOKw6B/nEkxGmWhRRCenCRwa+olBjt
	 Lis1DVKrHLcKEEa2/2BHGiv6Uxb64Ods8EYNPf+V+We/86zsx7lA2R5UkkULi/ziBqL36
	 qPOntBwfr7225H2zu/WqbDRMPkc6pKUgOly0vz9Cz24rrtDjR74XpbY02R1aK85xukZLp
	 N/+wUe9VInI1Ijo7SlP/7K3sl1PAaFg05oF2vOIkg/MqZxFHITGP12Ak/VSENhDQmsY2X
	 RJjKci6RQIeCsT0PA8NoCTPF5P6Xh7ArxX7RB93xSMbTOPnLiPGBf9ycQDe+/huqUWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794398232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IjckZIO0j996OcOAveLCl+tZouCwyMv0y7VcJmublKc=;
	b=FPg8k2/hO/xU9+RujOQJMbrofNjxK37/jIAqzzD3m9zb6T0m+/8NVCdQEl8/VXpeFm3Z
	 46bM3zeyUwaYHgSgWiZ9xU5qWRjQjkrtzNUfSAuhvQdjPD2Qv99eWyPCgHrPemX1FAMgG
	 MxYqMZmLbU7yWt65h9pehgKSDP6bhctqsNxeMz4XI9e+jaId+qlKweJJF8pglk5CIouq+
	 Ny8gesEZJj9Co7mdykHpa1tO1VXhjKGJJmA9m0/4V/UqwLKig99m9UkcmrCqmsy47iCq6
	 YhQaP1mZhEYnqM1mgLtnlZePgp3M6+DlbeBnFevg1wEPctlNpjtS59AWHcUfdt3KFUw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794398232;
	bh=IjckZIO0j996OcOAveLCl+tZouCwyMv0y7VcJmublKc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NGMg4eP/y7I2oja2zHHZUll01P028D+M4EX7z4+n+0qPT2XypenS5vzy8RR5WHGuD
	 3cApsYKNk0cNdj/KcTw8yLjNnF1BhV3dt+/qFbCA+H/2uOyQUAfhWB+itASdPi5D4i
	 wQU880qvj0XH+xGheAVMNVFnYn6kWTg4leqWSA1Y/DQjZoxhXhXYkZ59y+ymQtE+tJ
	 hdvnswLcs9QEsQnoKT4d3scIaudVGv0GD+XAUaSYiAEPyegx0gAFK1cRFeIpTg7OGS
	 WC6xi9zc0CvIvadQl1LwbhuaZyjhbgcXJ8P9U3JGPoa54W8WjN0Zuj4xnBoOsTghPT
	 dneoHWctuCADQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A7CE4097A;
	Wed, 11 Nov 2026 11:57:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4063028C
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3245B40217
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lSubUn7B-dF for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:57:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 516AD400D5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=h8Z0CY1v
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 516AD400D5
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:57:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=h8Z0CY1vusPehc/tADhr82QX9c2OcVAA0m98gMbLLenK+lOs32PZuJGyAv1yW59vP9RWgXHXQftw+3igsqBJtae6HYl92VTjfR9dax9gJ2zchfitF8UW+PyHfVrVKYH7s+Z4bKRz2Dt4rEQixIIFe2GSEunrSslBYV3A0xjpAFCkuwB773ZXX/PKyjiqMrhyoc/UK8RaVVzJDqjRLPJsRE9HxQlE5XCzEj1QMlrnWs1kcDOZ1faLAinA5ciWqtaVT0H4mA2d5D+9qdt7BZng42pt7v9KZSHRDHkzS5xznpKwJWCvmGs7NF/jPGa3gE5POZHt+Owq8gdvry2WhMSeEA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=HSu1LKlGNkV0nkKChrU1QFpcsW5WUUUSgr+EIL+8cUY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1496849133; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Nov 2026 11:57:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xR6wl-00000002emo-1qOf;
 Wed, 11 Nov 2026 12:56:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov <yegorslists@googlemail.com>, fhunleth@troodon-software.com
Cc: Yegor Yefremov via buildroot <buildroot@buildroot.org>
In-Reply-To: <CAGm1_ks5cqsnUXwepApaQ0C=s3b1u8rqu-Xiv2mStVAKWj6KHg@mail.gmail.com>
 (Yegor Yefremov's message of "Wed, 11 Nov 2026 12:15:06 +0100")
References: <20261111081946.3850218-1-yegorslists@googlemail.com>
 <878q2zmxq9.fsf@dell.be.48ers.dk>
 <CAGm1_ks5cqsnUXwepApaQ0C=s3b1u8rqu-Xiv2mStVAKWj6KHg@mail.gmail.com>
Date: Wed, 11 Nov 2026 12:56:59 +0100
Message-ID: <875wy3k2d0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/am335x-pru-package: fix host build
 with GCC 15
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

Hi,

 >> Committed, thanks.

 > Thanks. Should we keep this package at all? The last commit was in
 > 2018. It looks abandoned.

Ehh, no idea. I've added Frank, who is listed in DEVELOPERS for it. What
do people use to program the PRUs nowadays?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
