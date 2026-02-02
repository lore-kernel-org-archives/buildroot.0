Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB99E7315B
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 698B883B6E;
	Mon,  2 Feb 2026 11:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuaImoyJUQPu; Mon,  2 Feb 2026 11:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3E178375B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770032633;
	bh=KE2bIGYqs3JDAk10E6ojuVZJ4NIKGgRcuOocITDsczQ=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IkQVUT57M3V1t9I75HXDJKf5KnlMOmf6MmUTmF6bhB9zMhoCP774Zt8Nsy3DRJgkL
	 SpiLTo2WnW5n08j4qkOe2DYuqSaggWTXW1tdPQwhR5fItQ1jkeuG9bgKJtu6OmF0Cl
	 qLsEcLAUmLhSGXJaZ2tNw7/2OkMkgJBAQ2VQB6u6KEkLxqYGAKB1TERoe68fH3hljy
	 oAQX53Xg/TCxplidHcLMdmZwDs1USUjxmmJKSDrImvAY7cSYX9td7kmhWEB+Uq6K/q
	 Z85JE1/F2Co/jP2JZagDNlE50Jdd3qT3vfEgH8h62XkPAQGDs55LYGaU/gq5jq0bpK
	 OU0BYjpmDil+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3E178375B;
	Mon,  2 Feb 2026 11:43:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 834101E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6502540AB0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qnww4KYVI5Mf for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:43:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B7E4407FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B7E4407FC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B7E4407FC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 229889595; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 11:43:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmsLL-00000005uw1-0pVg;
 Mon, 02 Feb 2026 12:43:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
In-Reply-To: <20260202083207.1095362-2-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Mon, 2 Feb 2026 09:31:52 +0100")
References: <20260202083207.1095362-2-buildroot@heine.tech>
Date: Mon, 02 Feb 2026 12:43:47 +0100
Message-ID: <87ecn34bgs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=P9W8YPoIJ7uQ1iXLTw6Gf/xg+3UItYXJhMRH9xkW0I1aBfwAwK2CW+6WFS6S/ZRIkvzkfIid/g/3Q8+mpKlCaXP1QJw3AG10UbmhhMT/j44/6WvWHMYOVWzXVFHOLXwTtJXBDqI+htCJj4niWY2cxjxkxO/Q4jLdYJJO3HlvKuRomDS2XEOADnRvB3p+tNCoxWOKgb1DL+vNNqxpgekm44SxzLZAwUGv3C0JJy3guP0nlfzMQT5bFwhPMYoKKhFXHQe0MPkwBwWUclm00NTyFGRSihyfUp0NdAUlbcoJMr1Ib/Ejo7Z+UavbzL0UxWyL/pEY/vKUcQWTm6D83u90ig==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=nwQuuoXXxCyfvivhKy/Kr6KG8LKU7SNiHkh2qBcJHBA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=P9W8YPoI
Subject: Re: [Buildroot] [PATCH] package/{python-}protobuf: bump to version
 33.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@buildroot.org> writes:

 > contains mainly a fix for python-protobuf.
 > Full Changelogs:
 > - https://github.com/protocolbuffers/protobuf/releases/tag/v33.5
 > - https://github.com/protocolbuffers/protobuf/releases/tag/v33.4

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
