Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77F6E7316D
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00FF960BCF;
	Mon,  2 Feb 2026 13:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSE1B7ZMSoWy; Mon,  2 Feb 2026 13:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98117608F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770038881;
	bh=Z4VLyUIVjiWFzMZ5PpfLGf0I8RZckP8C9BlvBKsUlxM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lgrAufJzvaiLF62NFi/TGucAc+cz6sE5qr0nmkrDOuoI01sfB+9QgLd2jLJGDrGNs
	 3ozkqAv3sInnNhZwiQ0pxK3FmCBjcO7MEpyKhoUSePX9COC3j48G1RqFPXEApobpg4
	 6X8EKRNpSiI/POGUsBfy+w6sPPRzooqwO1NeHOWMzZsQX2R6JXWpQR+VmOsErRx22p
	 FICWhGYCen8x6Kgl89bJAxH3CMS9Oy8yYHMqnmNlwXqhwteasZsH/UwgOtuZOG6yXS
	 5vBeWOPwve0FsIzfoLFHMkjphbwMv99nXpY2iyN/4c7muAHm1b4CPMIWxXM+ZNYEbf
	 lIsWbu45X2XXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98117608F5;
	Mon,  2 Feb 2026 13:28:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 739C21E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DD9A400D5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vyp_X9giZC1H for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:27:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 546DC400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 546DC400BD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 546DC400BD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:27:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -263855422; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 13:27:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmty3-000000065cq-2DlW;
 Mon, 02 Feb 2026 14:27:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: buildroot@buildroot.org,  Marcus Hoffmann <bubu@bubu1.eu>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260112221927.3745398-1-Mr.Bossman075@gmail.com> (Jesse Taube's
 message of "Mon, 12 Jan 2026 17:19:26 -0500")
References: <20260112221927.3745398-1-Mr.Bossman075@gmail.com>
Date: Mon, 02 Feb 2026 14:27:51 +0100
Message-ID: <87ms1r2s2w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=SCaLyQXmjT6co6Q3bVP2qC0yWBe0AeCWLAtmqbX2bX97E/KnjQQa4vMKN2T3BZdo1DCibQjfLbbZTHEzV7GtciCtD7xdiPjx9uNMPFeHzrGIuPU8wezmZJ3Mv/NTCtuX5IyUvvQve1WW4DLIC4uzpBYBegb6fBG9P8wf/oMZAGduJHrTRMs0+Tu1UgrOduECxDG6ffZmaF8BEHCVWB5xcuhImSLrKhF5XrsKcrCE1oT0myswm8nbV8QQrnansUlohWrxZDZolXgNnBxA0+ZUm42/eUYG9ymOTRSZgdPr0jSEBKPeImmB/M0PCDCWkrmWpJMw/sPvo2uO5kAkf2eqog==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=JwZ37LvqFtduZf4Kv5harwDTC1zmiBMK3JIjBEgpu8g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=SCaLyQXm
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pico-sdk: Add host-pico-sdk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jesse" == Jesse Taube <mr.bossman075@gmail.com> writes:

 > Add a host-pico-sdk package to pico-sdk.
 > This will allow users to build rpi pico applications on the host system.

 > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
 > ---
 > V1 -> V2:
 >  - No change

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
