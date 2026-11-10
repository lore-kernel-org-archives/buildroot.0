Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D33606A207
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Nkb8EYuw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=qrGo29/n
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A93408D2;
	Tue, 10 Nov 2026 17:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGqahc7RRN-a; Tue, 10 Nov 2026 17:57:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E89CF408C0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794333444;
	b=QzNNMEtWsLqyp7aiFndxJQdk1WRUOuCchl2qWsavBo2DSiLMbIQwzykj5lnyBKZliq1U
	 RI0UINl9WT5q5nHSTrsowAZxpucJDvA7/l+OI3DliGroDjJpgjzs1wmq+PbjBCK+DKUXR
	 GkWxSCw7EFcbhWsLEiZOLBcSgg3ZGm+7DNdvIzP6Bc37pJ8q46fIINPMBGbBH0JrsSXYY
	 KddVJYhmF6M82AjkTxWsPDKH1pKm8sN1U/jZ8OAeH1y6sO5ANd3ue+78smXT98eiQvI6D
	 V539FaQm2fNK7gmwww+XwU2gWmy8w235OsHk4CAcmnql8gbFgCizwZ3gjKTMYC5Pcug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794333444;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dHA8GF0wNBASksgV9qSp3s6E0K+n/mhdrZLAd5Vd0oQ=;
	b=cw7Op2lAPOj4zMSABcgMndypxMXTA3mUer8kq4Jw4N7/ae7VIno8JL4MhNyRIf9N/Ts9
	 y4ine9TgAhYW08zZQ/UJbFSiuW9Q4+imPQYug6M6gY/a/7xVBc3ZVF7/t6gry7o0oDhZg
	 1WLCFECDdjekEVlwtemG7r0HhFpT76ENb0eLhJRU9SLirbDGheYB/BOlX/WUVzIMzwKi0
	 A3WEs75w2EB1pYfaUTt+pSTvqaxU6yqdF8MGf4PMxriOr9XXGiG5oiEy9hKUHEbMgJD9q
	 FYQXwsAtUCdyamCTw/BJwkvhiZJiw/WEnLtcO0SsnP5zehFpkYnCS2uebblW+etBOnA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b="qrGo29/n";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794333444;
	bh=dHA8GF0wNBASksgV9qSp3s6E0K+n/mhdrZLAd5Vd0oQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nkb8EYuwwuLGi9zhFHytO0+8CWS4UVTbK7cr5mODghuEf3dGrOof4NUS9U6xKoEaC
	 2XMAX35dG/+jdWCMwxgKNVnpC6fwCYBUYU5PKS63dpxZC95u1oOUEUW2Viuk4spms+
	 c73HC2s/yMsENZS97XakaMXYFnJOIRiBvVrRNLlcCXgRWAXqRdjSkUTw3qZiIODSeE
	 sN1PZF+svp/8fosvElnha2R8qDC7M8yRoZn4PNDYOn2bSQYmumLhHgDjl9rJ9LWjkO
	 qA15IE6Z9O5Xm5SoFbXcGJJ030D/dqovkUyouOUU+29IHGQ0jYhzNGhaEd+IYUf1Sh
	 X23hOhfYlIoWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E89CF408C0;
	Tue, 10 Nov 2026 17:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBF9028C
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97F57408C0
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUlK17wA5Tx8 for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 17:57:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 81FCF4089B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=qrGo29/n
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81FCF4089B
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:57:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=qrGo29/n8LBjFP/LdL2dkWPgV28RfFKKrU/9gnEJppZOsQF+tl9Ju0omJUheYxJdoYsR+AuMBnL2z+2Y7K6PSyNa3sj7Mdl2kiP+yICuzk2frGhk6JfgmZwTM67PHJ6LAyHTWj1QmMuRj4JpeWMgob3A54NX1/eq65zHfJGUstIfX9t/6/ZlNSEyh1TdhxgUea6ZQ/SU5xDnTxPXmAfzH1iypiNdwIo5S8yhp2fMbKSbPSBYHHlxAGFto/5Ln6Zum/6vVVa150Wow4mHYG0/DN+NpKVUFG1GWkSfvPYTohHhNV/01nJNScCjnPACuwJee2CTaUsb7qXadBTXC/Y7hw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=dCuvT40C7HHD8kB9pnq/ZohfnjsiMXMfXx/03u4DEX4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1281987880; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Nov 2026 17:57:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xQq5m-00000001bPY-3M4g;
 Tue, 10 Nov 2026 18:57:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261110165045.3679658-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 10 Nov 2026 17:50:44 +0100")
References: <20261110165045.3679658-1-aperez@igalia.com>
Date: Tue, 10 Nov 2026 18:57:10 +0100
Message-ID: <87ld70tvrd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: bump to version 0.13.1
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This release fixes an issue when opening directories in the new root
 > when read permission is missing, and introduces support for multiple
 > --sync-fd command line arguments.

 > Release notes:

 >   https://github.com/containers/bubblewrap/releases/tag/v0.13.1

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
