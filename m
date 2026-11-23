Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23AB606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qmY20Jf+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=EpERpZPy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91EB080E8D;
	Mon, 23 Nov 2026 12:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_UF8d3mOSnD; Mon, 23 Nov 2026 12:29:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AE0D580DFA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795436968;
	b=NW+WP1VmWy3l9rZaQtgFIh50V2FLLVyYT5ztSE1fjXi0w2BCu5TCr9ZA3G8hPhkSv3lM
	 42KqpHYJpC8bHdTzI1cV5wEIKMvF2p4KfQQwPlWKgCgDYjGLKmTz40gfzHZkiLVygSc4Z
	 2rNQYbdDNDk5v8jDshz+lrfdBz8UYx7vzA26O4YI9OlyUDQa/qZPev+UWXBhpB3E4ba0F
	 Wk0ref8EOykGUWOs30eMzPUEp7IeBnxkveYxVNs0nXBP6ODMulCmuYZThMHXxYAgHHjlz
	 hI8tK38OKnbQpqgEdkkvr8bcZI8iPKlPy1IUCJt6rwjP2fRp4ULnXmHGY92oWjRfSjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795436968;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:User-Agent:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ScNxutug3QtO+iJXzg9+0fjIKJPwHBIMyQoPplUewfA=;
	b=HEPOT17bsTvI0nsJcvgmaRf9WHp/bkGh8fRDBVYqnkOOaTxIFbhnJMIBwvHjQ6PXGzCD
	 AaDzx56h1BQmrzvcX00n2qKaet7Ew8WwE5dp43UC6Q9QKSjXuoFcFF7jtszYLE3P4tKAw
	 7T39wP+UuUdbVBmEO8WDijiHvGaeZ7kFQzWK8Ro3Ua1Kb084EZWgKMaC181Lt3m2RKJJV
	 SP9+If8X59IxQzIo15gwA7KyhS9bmt209UDbgzaT/QNCJNw6F5o4YV5DzHqnvVc2o+ZWo
	 Wl2Qcgw9uKxOhCtQF5z8IUYgBe5QzUElGq5OhwTxUEImAUGky/YmRXA2BU2tCmXPDOg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=EpERpZPy;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795436968;
	bh=ScNxutug3QtO+iJXzg9+0fjIKJPwHBIMyQoPplUewfA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qmY20Jf+g1DwAQuBeSC0GbppMFd8xiO8wKwfYwK2yQHWWkzSbsnjEsdajhCKzZ2Ne
	 nZKkzvtmyF6E9Acbns8cscJV3mplV8MjVUN3tWkLUyrtrWZy4mWAtdEWV67Lu0OlbF
	 EHVfLT+DuD+DsESRUqLuzX/NdO0PnLtu3wVYDnUCquTskaCBDRkkBWJG1vc5N8RRHu
	 lSRfbZ1FVFYIORWuQCVDR8lQDMuusAjh0ktezVsOls3y1uO2bHiWVQingi9Fzm16y9
	 A2OFMXR62e7atlaHCjd/7MuYHDlt5Mek3gZTPpB/WuWc6PH1CMc4nw6fSc3aGiBDQB
	 SeuTx1ozRxEGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE0D580DFA;
	Mon, 23 Nov 2026 12:29:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62852260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 12:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53D9080DFA
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 12:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aP9B1MLGLRN for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 12:29:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5CC1080CA2
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=EpERpZPy
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CC1080CA2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 12:29:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=EpERpZPyJ57A6UoKN4ffrwunhGlkBRHOk84pJlDNSiZQc+teydx7wtvs3346JkQny0KQK6gaFJEukW9Gx7pxY9XlbBzWexmyfRrsLQ/DiiXnaKUCFcouKUEDcr+vBMExjRZR7a2gVYZBTjFbmIsW+hP5Yktuh3SIwuXybk9rJ5dsEpjYVcYA42+UXNjNXQsc2JB6JcyPVGmcYgkxMrV4uuaPrmFsrBvnVsPECP3Q1H4H+6fhcFii7uX8b1pwpVMRqwlwFnyaiIghnnFN/0jHooTx+zKt1eF9hRiyOzVQgTKnIcWiNDbiabtoYoT2AIIiU7pF/iJzDocjJgAG777poA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=x6l0w4ydFO3hOH9KgWaVesKGjOAnU7vrYDDxJQVSW0I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2051065458
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Nov 2026 12:29:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xVTAe-00000007k4j-3IXg
 for buildroot@buildroot.org; Mon, 23 Nov 2026 13:29:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 13:29:20 +0100
Message-ID: <87jym3loin.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2026.11-rc2 released
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Buildroot 2026.11-rc2 is released - Go download it at:

https://buildroot.net/downloads/buildroot-2026.11-rc2.tar.gz

or

https://buildroot.net/downloads/buildroot-2026.11-rc2.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2026.11-rc2 tag)

Another week, another release candidate. For details, see the CHANGES
file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2026.11-rc2/CHANGES

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2026.11-rc1..

    11  Bernd Kuhls
     8  Julien Olivain
     7  Fiona Klute
     5  Arnout Vandecappelle
     5  Giulio Benetti
     5  Peter Korsgaard
     4  Yegor Yefremov
     3  Thomas Devoogdt
     2  Angelo Compagnucci
     2  Bryan Brattlof
     2  Thomas Perale
     1  Marcus Hoffmann
     1  Titouan Christophe
     1  Yann E. MORIN

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
