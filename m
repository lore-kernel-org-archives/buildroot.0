Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F92606A331
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=de6Ooy5t;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=WiWnuS7j
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D023240677;
	Mon, 23 Nov 2026 10:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4SrN5zftLXJ; Mon, 23 Nov 2026 10:41:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 90DBA40681
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795430508;
	b=DxhTRcJIIlJlO5cH+fXJjACAF37uB4xZBfPG7jXWHWwvbYDs4e2m2jUnZiuOzm6mu7i0
	 jK6jjgx2IVnQXZeAV/VJYqVTIxfklcBL8XGwL1Ld0oeonFGIhJ7jMeGtHBZ+nZ/d7KEk+
	 TW3wZNYCplzIiXEj0OSraJRyq4/Uws3G4gfzqC+9H1ESeHBSMPbNJyXxZVt0Lteh0EUql
	 tPp8OQhAwan837SZl8lu3qwLM7FtCGsnh/xfdvr1Ofh6tURnm5vDv1iKOjfWcRnRd8l0O
	 TGh6h6/M6k2JCCubY9qkPABRfIP9ntJUxU0AwIJx8BaxxUKa4XpDkMvxAkAw1jOTz4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795430508;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PbQ1Zf/ed7pFKP8rebamVclIgJGg2HFItcBDx+FEIFo=;
	b=nVJT9QQa+6FVZ9NLTpgAvRJVNG+GMdKR3/QiYTsYIs2w6cigdwzOivWfgePyFCzEwJhT
	 7eU3pj/go4cACGh7sXfTfdOtcXVYsiBOkPGb6wS36Qn55bAMzdrEwiUm89IFdArP9f6CM
	 6MO1K32wGPcvPkNS0k2VWyjXn5Ie1IAT3H2Q1fuPIBU/ELshyi2Caej9wQ2cWW/nmPlSa
	 Ve47LX2cqRa7zT9cg17BtNdC7qfwHjzdAubJ9vX2Wxpv4NyXIxbgbLZNU+8/x0nExJxdY
	 jwQ+sbDJTL5NG0nMMdXE/2BEt0/OfcOxS3nuTSUJU0VqYM2VfV9CE5VP35JxQy4kquA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795430508;
	bh=PbQ1Zf/ed7pFKP8rebamVclIgJGg2HFItcBDx+FEIFo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=de6Ooy5tV7WLt+QQ1FbcoSYPGiLd/KbFXrlbrj3SFbyh7ezd2rbLud+8EQskX3QOo
	 JoLjNaulYfWVNt2MwCr4Yq++Lp6X34mEyOC4DwsUdlsYfBypmq87tm8I+zJ1Hu+RrV
	 KUqjJ2LakJA8xWIA89xPqajki3oP5HeC1lu9LbWyJuuF2YlIkEBR78FDAFaUtjnfV6
	 1+Nn8bqqsEuv9gHFIXVbK+GQ0wKw63YD25dbMiMCFyqQJ+/IctH7XXCx/ZzJ2tCw2e
	 JgztsXfSI+lsnPSWkle9Asr1dlrQaX0zmJz8P2HqmPn3Sllt1MwaHdiJRuvIZC3v6W
	 /Mz7ii6Imn4Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90DBA40681;
	Mon, 23 Nov 2026 10:41:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9909B260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E9F840098
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8HzvXVruq-w for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 10:41:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 388F24005D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=WiWnuS7j
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 388F24005D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:41:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=WiWnuS7jOh3FzPl/A8aiqLm1JBJQJcaZK/mL3o/iNADaAzkcxDTbHx2UlYqQF6BKee/tD91HrPftkZHxvZCWiUZP3RVXg4qHGrXn+UmuWUHiIpYw3M9VAoZPbYojiV8qIZaHYwRTAimjVxVHpDca49Wt/izMmWFIlzk4h2BivGNmSG6mWj9R5o5ONRp90RzmgiIdHjuau3bK0CtC52FMm44CyCmOljaszpO7ESQDtT1X/kWjS+c+e2aUfxeGWn6ruUIMNM+GIN5rV0vrunHtbhomPR4GcYmpZ8RFTcUQ79G4COJUUma8TmE6639Tnmp0tLEJpihODlSoX7bfnbUiTQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ASOM7NOmNy2cMgN93fN4ZrZzHtNBknOyWzOZuh/XcKg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1965432500; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Nov 2026 10:41:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xVRUS-00000007cHT-3Yph;
 Mon, 23 Nov 2026 11:41:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>, Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <389d0ede586efaeb9cad9797149183e12648198b.1795424865.git.yann.morin@orange.com>
 (yann morin's message of "Mon, 23 Nov 2026 10:07:45 +0100")
References: <389d0ede586efaeb9cad9797149183e12648198b.1795424865.git.yann.morin@orange.com>
Date: Mon, 23 Nov 2026 11:41:40 +0100
Message-ID: <8733srn82j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/mosquitto: security bump version
 to 2.1.4
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

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Drop patches, all applied upstream, and backport two fixes.

 > We need to revert an upstream commit (patch 3), because of an issue with
 > cJSON, that we already tried to fix in e57c73bd5a67 (package/cjson: add
 > a patch to allow cross-compilation with sysroot) but that was reverted
 > in 1634ee6d161e (Revert "...").

 > There are indeed cJSON upstream issues [0] or PR [1] [2] on that topic,
 > so the fix is most probably not in mosquitto, hence the revert has not
 > been sent to mosquitto upstream.

 > [0] https://github.com/DaveGamble/cJSON/issues/1094
 > [2] https://github.com/DaveGamble/cJSON/pull/812
 > [2] https://github.com/DaveGamble/cJSON/pull/1112

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Titouan Christophe <titouan.christophe@mind.be>

 > ---
 > Changes v1 -> v2:
 > - mark as security bump  (Peter)
 > - add missing SoB and Upstream tags in patch 0003  (Peter)
 > - add references to the cJSON issue in patch 0003  (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
