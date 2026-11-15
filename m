Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67F9606A329
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 19:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EELvTXvL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=MP5ud5Pg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71FBC80D85;
	Sun, 15 Nov 2026 19:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcJe30At3k2P; Sun, 15 Nov 2026 19:21:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 973D680D96
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794770475;
	b=A/k6ZQRSJOc49HifSzTnTuQGNrur4KNO5AyoYVX0+C9jyNxcQtVz3ucmdn2WH0ZE9tqZ
	 ulB8FQTK+mDgWM9zbXT7DXllka+t7X1pxRNguvVCpR4tT//k+RXCReXL8Osl14J5exL9p
	 tUs+RHH8edIQ5ndgOKFqc1mi5dUHfq8F7tDiMw91qwe1gbNbgbaCMqJpzWkJU4KPiCg+A
	 2z7adNdk+pzBRjcvw0uUDwanCXE80fjWUBsQT4gxSNCysyEJKwwHaDr3mSL4jsAAUAgwi
	 tz/QpsRxl2hpMzd/oNAVNcN4oNtOWyanwJxzojUhiD3MeFPpuNF1aJYyQCZ9iCZEN2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794770475;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ike8UTg2LO11TkwVhX3dTOE9vtkl129QbOz1ePh4YjE=;
	b=HkZG+n0Y4K0RmmKVg+h1FJy6MN616gylaM+1AfPtEoftvpWOApdfm5ASMct3k+yZOu5z
	 W85e+s0O8f9qkilapfmVHViZtnbYYiq1x6Zj79qIvi9LcENpyNgmntq5W4sAPY3DZv1Td
	 MrFwnQzpurB/uq+3c3PIx29gh90cYPR/OKGWqg6qN2sQB5GqrV9NXfxF7bp+VcnlORP/o
	 fCR/FV9zINWhb5IIWqreIuIoh2mDgJPSVF3nHggvQVCey7iOPGO5p15lXNFJjdiz6wct6
	 f9JJKT7C3Q1IQKuNjWbV5KqaPLFafIqCouaDf/aa42roFudJG7Z+kylbkDdLjZ6bTDg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794770475;
	bh=Ike8UTg2LO11TkwVhX3dTOE9vtkl129QbOz1ePh4YjE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EELvTXvLwAI5mO0LSiUHxSPlAOkKEy+7Gu1/t2CgEo7eYRj8kTkKSha15ltbNJ/hb
	 c9J6/XlDxzDQmqeNtIGN6wzASSeg96tB79gBOhOGkkn+AcbL6wKLbN7sOhqi7nh3KW
	 JbG7Unsu5A3Rh2I3MKYrEBBYGFEWrB9N4+A/wK9cjcs9lr0djJqcvgOCSdKMZFn4wN
	 b7thNUdyP0GihPbdWdfOn3Sa+IwQi9AoQVIdzGTzVNvIqkUAtpm8hk4csyktuYE78O
	 QQMC0M2iPVdGwhx8N8FSpnDKC0hjO1wRQUeZaGNclxTez965FEZTH5vEEY3X+y+QFO
	 b/TN40SrxoS+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 973D680D96;
	Sun, 15 Nov 2026 19:21:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB372FE
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2197640061
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48CKL_vhhBpb for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 19:21:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8B49C40048
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=MP5ud5Pg
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B49C40048
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:21:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=MP5ud5PgnMq08mDayxkv5nywZbUDzaBaDMsYpaKOETibh9tbJRppYbYLUdKGJw0qRbJy/Pzt4TLRnDPBsWN12Dwxr1zHOUgNplFjJitePh/XnAuNP5+gGs3dpTotcgWbvz+L2mO2CSykM4A4YD83Ed/1tsYKLdz43MQcnDUahu3qseUTBoBkH2O2fV/uOneNOeCR34ZWtf+zh9SJdXrMvIE1BFjNowxELldJn1DDOph22S7Ye2pGsu3LNoh/QTIJzI6kjxeiZFafAU+KETubx4SVOy1GySB/3RSQEmztqQxyM/0c8Ye/QKlIBHU1u/i3zNsLwz3VNZ7Wazqh8tYIjQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=GWeo1sng27bcfbuYFLA3JxiDY0PtiGiobGXbWbvgIiw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1309037406; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Nov 2026 19:21:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSfmn-000000002KR-2GIA;
 Sun, 15 Nov 2026 20:21:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261115120424.1235918-2-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sun, 15 Nov 2026 13:04:24 +0100")
References: <20261115120424.1235918-1-ju.o@free.fr>
 <20261115120424.1235918-2-ju.o@free.fr>
Date: Sun, 15 Nov 2026 20:21:09 +0100
Message-ID: <87fqx16guy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: test_grub: fix test by
 setting qemu cpu
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
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Since commit [1] ("tooolchain/toolchain-external:
 > update toolchain-external-bootlin to 2026.08"), TestGrubi386BIOS is
 > failing at runtime due to an illegal instruction in init.
 > The error on the console is:

 > Run /init as init process
 > traps: init[1] trap invalid opcode ip:b7de4230 sp:bfe26040 error:0 in libc.so.6[a3230,b7d65000+188000]
 > Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

 > This is because the test configurations selects BR2_x86_core2=y, but
 > qemu-system-i386 is started without specifying any machine or cpu.
 > The default machine is "pc" and the default cpu is "qemu32", which
 > emulates less features than a Core2. The toolchain update in [1] also
 > updated its glibc which is now including instructions not supported
 > by the qemu emulated cpu.

 > This commit fixes the issue by explicitly setting the qemu CPU
 > to "core2duo".

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/eeec7b495f6b6127f0cf7020674f7853814a6d06

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
