Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CE3CCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 07:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5450640C38;
	Tue,  4 Nov 2025 07:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id id6763EqecRf; Tue,  4 Nov 2025 07:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FD3040C2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FD3040C2D;
	Tue,  4 Nov 2025 07:34:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66D68222
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CE4140992
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KA9cVY30Lsks for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 07:34:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38AE7400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38AE7400BB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38AE7400BB
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:34:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 724268120; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Nov 2025 07:34:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vGBZ1-0037Vr-1s;
 Tue, 04 Nov 2025 08:34:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
References: <20251103183815.12051-1-dario.binacchi@amarulasolutions.com>
Date: Tue, 04 Nov 2025 08:34:47 +0100
In-Reply-To: <20251103183815.12051-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Mon, 3 Nov 2025 19:38:15 +0100")
Message-ID: <875xbq9roo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EGQ6nQlu/j2HOf2578Y75usaG+FpyEEtcmFr7kcmXhyN7IbVrtdcW5WWVZNEMQXCD8GcrNHqtCxjxJnk9G+mT4m4C1/B771KQfAybwQPpE3tSgnFpIwTd5bWr2/oam2AAlotx085GhHShF1cEjrmvuVEQ+9ldif1Z9hCFBYNP+orqgsj8hLbWbJ75o7iWLCu0eybV0Ywg9RPoW23VcxXodNJfr1sO4drdRJJ11kprehTU5hNOvBOwhuLxg8Xs5MqyCllmA8A4Cr/s0EKKXYR+FwNxHGCB9m5zihbw4OwCCHJ/N1J22xaSVKhCXWUxNoXbSU2cFrZdX6zw+31woIgTw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=hh3+gcaTSVQA3cIAY0g5UWA4NtSoMS3rlRxeUFfQd4k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=EGQ6nQlu
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 15.2.1
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > Release notes:
 > https://arma.sourceforge.net/docs.html#changelog

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
