Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E83606A323
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=scpDFE3W;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=L2K72wlz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 488B240411;
	Mon, 26 Oct 2026 19:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcrTnwrYQyD7; Mon, 26 Oct 2026 19:03:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4E12440437
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793041432;
	b=lzV3E+s1g//qZJzlnoGhFFH7m0HiocMmNoJpwLw4kIm9S6PvQ/ZuG4ofKqm02j8c4lBH
	 kO6tT/Kqag2X2eL84tIgonUJh7vgDI3t84bT8mjCgCj+dOUbSz0uQQdrTgbKliQnB2a5p
	 isu9BBI2oVlCcRDFwA9hw1nzkail3lZKDfhgoIe9UqmXUzykr9JHQCaK5NnaaY5PIglHT
	 DqWLWFx+f8/VzraYsMtQ5+Sp0PDdKl3q4qbt7mlDqL9I09D+ivXhJAMp2XqNnzw1lKNZI
	 mA8cYjrduDHyxLS+OMFY//A43ecWxm334JMI++69Byl7hFYRq5YVXuDCczZlTNhMzTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793041432;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nGC92kDurtgmC2Oi/Zo3fh+xUJfAM2/zc1CbysmZstE=;
	b=JBNNP/hmpc8IkJxifwu8x4fCkOC8Y8nPcEvNXkWOYK2/Xc0PSmmKXY5RmRjXWN4JxDbR
	 ZL9WTw8H0SK2tG1NdW5+n6ov6tsEuqspqxkq1IcALDwphmJL7jCf6lUMcNIaNjbV4pu4K
	 m5LqH0/+Iv9Gg/kGiEgd0I2FNv7pFxG0swuCSocnArTs2wHeauTQHMNmC7TX1R68Sz3Ca
	 PnZTdgkJ8n2nsymf8DkdhFlITEVsa+wTjYGbdTb3ukO/XYXJ/Go9g83HfYjdFN6YhczBr
	 iOHG3k4jwt5ITlzwvT9mu87xlRE8GME9vGdZiXjGIvte1uYhaGkyLumG7rLI7WkVgWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793041432;
	bh=nGC92kDurtgmC2Oi/Zo3fh+xUJfAM2/zc1CbysmZstE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=scpDFE3Wtxxxdp2tRD80MKChURLPcHND7YVdyiJKaHRU55hTmah1nelYt/Ox1iOZd
	 ksRnvv2fANWYRD1eiW/Nvuz/BUJyP+DHJVl3pUraNhTKt2eoBtALn0w+UcJ078tfnZ
	 uaNNAUhBR27Vx6SUohBheQzJDwq35e4RFmlsFbhGpMK4otEJZpIq9rT/HBId5QEweS
	 naREmHQeeDw+xe6n+8yrIhKk7c8BDnbuGfD/iVBqfCDgadV+NRN6H7efvWDNkvB+ry
	 v2axTcOmZeG5WMB4Kc7HaKrYmMa6Z8EuKdFgNtOCHBEZlEooY5/pEjQNV2nWU3eAUn
	 9wvC4x3hX0c0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E12440437;
	Mon, 26 Oct 2026 19:03:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D643A35F
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC92D605ED
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0RtdfnHrwer for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:03:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 82EDD605EC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793041429;
 b=MkWQQ5IdSBMKapb+yBvsmv54AQwvrEBzfnzKhi/Z40KlnMcq4jjqvcW9r453mydu80KC
 J77CuYz6uHiO0k5u2yxEdMvBNMlxUDJNW9AvJUZaPCg1V6Cq57d2w5NXaIM2h7uQNtZnW
 jT5aN9ZniPdxvafeOjbVVgJjcj/Q9H9T8vxFfcqc1Pj5AlmWXYu+rNkKDHaxLYnp+zWfF
 Ywjtg9zqBBaQdYOKoG5txRsj39WYaJmLUx+z0YOpus6jIj+sawXSgCJZGpaH+DZ1N+YJq
 xajs0Ota8Zn4I7+6abhAgIXXq9L3ClyP3uLUccVS872EZOi5CWYXcREew0HOOX5Iw0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793041429;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=xaRB5dzurJXVp6HCy+NWuhJrfem8AgIx9Ixq6V6aJ1A=;
 b=bz5+fx4Co2vCpi1mEFXHLTUY1VjcpSY14/qhjbOR1nBCUofnanc0rCY+Yfltx/IsuZhX
 z6Z+t9xVNQl8bEXFSVcxAHMnWD9chRfys+XSyxKSEvliOkkfq1LQe28n+0MXW1YfJdvI0
 z+lVzMVT76Qxavk7/oHVRnwlNcMCpe80K5CaqaMuwpX7lN8L3LyR1vnh2CaL7VwdVHkBj
 qxGlAr3tC1S3HnUHd/CtxkaXY2kYVzo3JLfgIIjz/CA2/eheU5DAb07jMyzns2OMht6Px
 9M9RIjoGe0MrZoRKQ/IHD3R2PCLejaZ44jI8EK4IoajxOn7SSmjuI7GUMD9jJM2eokA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=L2K72wlz; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=L2K72wlz
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82EDD605EC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:03:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=L2K72wlzivRN6XyLtCC8o929P+AoKJjAb6asFdN+rcIOp6kVo+RA6XZIROZvlPWPWY1fFInB0Ju7DdrGFvvyhkYM3qiRV/Y5DMI7RovPIqHk1qG0R9QbpzNslD6ENOjneXV8BOqWOWpUVaih4/uh0V+86CA9cMd0Ynj2JUfz0idXnhoWS+1KrMWJNELrSh3jP0jJ8cyrZh67ogY0D0FljTieMYCHb5AkFYHEQOQg3Lrbz4GM0z3cGy9BhPnF5MYSEbRnolRRKRaNDqox/nD6o4c1a6WEGO3+tpWj6pZJ5iaUMUHMyTXd+MFgxIyPEytqTxyGUEvoUiv7XUmSj2Ihiw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=aXqbz00ebr2YrSBTEyIXF7JRK1PC8mRLuGuz4rNQ7EA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1954954780; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 19:03:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xLPys-00000008Smd-3thh;
 Mon, 26 Oct 2026 20:03:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
In-Reply-To: <CACXRmJjJShS7_o5+NQFWaztXZBMeOyvApEVF6zoG=zQ3eZycSA@mail.gmail.com>
 (Thomas Devoogdt's message of "Mon, 26 Oct 2026 19:28:48 +0100")
References: <20261024164906.3150226-1-thomas@devoogdt.com>
 <87y0blhs7h.fsf@dell.be.48ers.dk>
 <CACXRmJjJShS7_o5+NQFWaztXZBMeOyvApEVF6zoG=zQ3eZycSA@mail.gmail.com>
Date: Mon, 26 Oct 2026 20:03:38 +0100
Message-ID: <87v76o473p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/msgpack-c: bump to version 7.0.2
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Hi Peter,
 > After some searching, yes this is a security fix.

 > See https://github.com/msgpack/msgpack-c/issues/1181#issuecomment-5365155306

OK, thanks. Then we should probably backport the fix to 2025.02.x:

https://github.com/msgpack/msgpack-c/pull/1182/changes/8a48af0e3ed15ce0e60273de30a073ae6419489e

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
