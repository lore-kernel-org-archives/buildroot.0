Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8206E606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KAwJjAys;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=VIjdeHnq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FDCE606CA;
	Mon, 23 Nov 2026 07:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-MikGZbZh5X; Mon, 23 Nov 2026 07:08:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 11FAD6068D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795417701;
	b=rJvqBUevC1bixPxlq3qwQfglh0HOhF3i6uC8fRgTZXdKopWGIJvLbYKwZoYrVTc+7wHC
	 MkFRhMWv56081cS6gGdf2Ni+F9TJLO0a5XNZSAypA5nmkdkwHPy9UmNyzkVaKtSquVj8m
	 IW/SYR6d9GTCr6fuiAb0Au61o20dbuxgc6vInCPkRU0Jdth6lrgKBr52IMqxAlwUIo08x
	 iWDCG8C5jsaFfr1CRQyBFdKhuSg33mAguCu7ZwhC/XvjWGU4lz1Ibr3NzMM629d7XEqhq
	 jr7STEoABhS3COqweEwfiQBFxd3Yy4101KjMcpVHHlrUK3ThLXRdj4R++h2ssaJaNgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795417701;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LkvXLR8NBSsAQfXyICa4K2CVTWkzgmuPrvY5aFUb3PE=;
	b=Aiz3bMOWYR6xjBqnskblFaseKa1JIgDfrlJzD8yMpmSkuvwIfQ6Rx4U49/e5JLcvz3vr
	 wDysV+eGF8QK3fv8crjWOAHCgdGheD+pTtLHz34Bd5YYhdBIjB3XXmfIN7kdrWb8cUaa6
	 nk+4KtWgvjxY8Ytn4vgc1njoEmfdSFTjQhTU532NqlNHS1fNHTVZB/PHzP7hvh4IzbunJ
	 u0uCCW7EX40i6n8dTjOrMMI2apehSsVJgPT4sZNdP08tH1dHgjGKA7TS6w9KtNbhxvtJu
	 NwK8pffZCUJl0GwQJiYTkZMqr0g2q3Uv3aJvan9ki8sG104dfNfVpVLhEtFN8+nhSQA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795417701;
	bh=LkvXLR8NBSsAQfXyICa4K2CVTWkzgmuPrvY5aFUb3PE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KAwJjAys4+WRglk3h/8T00wm/S51UrwrTUv/tjEk85qnOlxFh2dq/fPLNMtNle3b6
	 hnQcjMWI6IqbLje/O2naG6COLY+pP/umn24M+JGapuNzYxIq1hY2EdHNVk7DP7jfpQ
	 1YV8SG6A/IvHiEonX4KEmpDh+Hebtv1SuqKkDqcp+aMb7qTkolGgb5iQ4dF+62WzY7
	 Z3wBNqQYJ7611TGGmlVkKycCDAnxyHOUN/ZKTVVzobr+WlIzTKiC7fxfgfvua1Yamq
	 1kwdwANgEmJ7077z15KEkgo+DyV85YESQD072u7yyTJ7zyhs409NdVz57kuefYLSCh
	 A8ohTUWtK04Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11FAD6068D;
	Mon, 23 Nov 2026 07:08:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3709B499
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 07:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D00540063
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 07:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnaBSq6NyaUq for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 07:08:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 095D740081
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=VIjdeHnq
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 095D740081
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 07:08:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=VIjdeHnqkSYsU/QT7TXgkVJe+kLN94DyZJl64WkR1SdyTU7hOJVlxde/mi980GGuKjy8AV63f4RfqP6sr8tGz/zwa4sOCY4GYmEcTfekndFcehL0gHCuZbTK57eKLiyIk+v4CyX/s0IHsY5DMVtQgAfVPQ/tBMGSGCJOHxHcwAF70jY3exxSi8bX2LgsqA9h1MWFmr1Ywi5yzkIOcm8xvZ3lOX4lUv8FrPaDVgRQZWeCA/wMAuvA9Q1LqMzFBgK085Mmry83RG4EZCDVB68UUaZ5OKaO8fGs3LR76TJrojGSzw09KlMGq6JYS5QciGBwaoLFXCx/9xGBp1Xcc1ETQQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=l+XG4AUThFgUrFwVB0UJKHJuc1KU8D2u9P02OgzZgjU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 964061024; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Nov 2026 07:08:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xVO9t-00000006ubc-1HdA;
 Mon, 23 Nov 2026 08:08:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org,  Danomi Manchego <danomimanchego123@gmail.com>
In-Reply-To: <20261120204928.4020930-1-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Fri, 20 Nov 2026 21:49:27 +0100")
References: <20261120204928.4020930-1-angelo.compagnucci@gmail.com>
Date: Mon, 23 Nov 2026 08:08:13 +0100
Message-ID: <87jym4m3du.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/jq: ignore CVE-2026-44777
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > CVE-2026-44777 is fixed in jq 1.8.2, as stated in the release notes and
 > in the upstream advisory GHSA-rmpv-jgvr-wpr9, but the NVD entry marks
 > all the versions up to and including 1.8.2 as affected.

 > Release notes:
 > https://github.com/jqlang/jq/releases/tag/jq-1.8.2

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Did you try contacting the NVD to the CVE entry fixed?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
