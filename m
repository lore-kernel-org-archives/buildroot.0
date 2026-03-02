Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A96C624C6
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 09:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EE5283DCD;
	Mon,  2 Mar 2026 09:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkvSueLneA34; Mon,  2 Mar 2026 09:29:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7022C83DA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772443763;
	bh=NdjUTAN26fvQ61k+bkmXKUJVkKxMGW6/HhuMb6hc8/M=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y90/f+CrfJBbt86zsbMwIEjO6+ar0Nf7ddC1ieUUZEba2xCe/SGTKbohhTYkjcrL8
	 m3BqeMKjX5gyxoiu0fTI6X+fbriqCKBIeUXQTnTyrm7vnnCkV0/32e3BbBR9UqSN/+
	 PUgqkeUvEFrI+rMrPMx5YtgWBf112ASEaAFHWscU7tE3IvmWAqkqlJIv+r1a6MTBWi
	 KDdrPglOUSlC9p2tX9OH3BoBBtjyDngZFY/a4ose+rloZoCUF4vOWjOdq5G9yljdUO
	 7Z81I/vh1bxlKe+xNIqabiKz6dthzjOuR8HyGCwWkN64+AR77QYw7L8B+hTt/4pWj0
	 2O+IHQHrWdbbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7022C83DA4;
	Mon,  2 Mar 2026 09:29:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11064231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02C3A83DC8
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bILwaL5olVa for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 09:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6569983DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6569983DC1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6569983DC1
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:29:20 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -538137428; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Mar 2026 09:29:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwzaV-0000000DVVd-0IH9;
 Mon, 02 Mar 2026 10:29:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260302083333.2907389-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Mon, 2 Mar 2026 10:33:31 +0200")
References: <20260302083333.2907389-1-aperez@igalia.com>
Date: Mon, 02 Mar 2026 10:29:15 +0100
Message-ID: <87ecm2mvf8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bnsW26fxgRjOsW9KUllUhljt2abcghazEWVraAJRCzYuNNSq1R9gp8Y0Avyr+T09Wv4S76fjojT/Beq53wI/SXjKVkRqdyICVcTEQ2iHFGNHyxlim+wtB+b7vp1JllCcGIqkxPAAMwTh61GiaW6gLqxOdRo9+xAopWayM1SZqUmVnMVPqnBusvzArCzVfSwv09J08GfUbNBPRXOSCjAxb44aMUJq5QEEJ7+uhfNNhHTbXHfxp3gLMSL+jZLbKSQ974DtI8euOLClutcGfOY57QrVHxz18dgr86bgx45/e2oG3JD2KyIs9mQVP+4dOLsl39uw3eqPpsokdUXw1zX7Gg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=IBrPef9JRzFJeMTFPjHBSlRy7kq5dd6cwgsce/H343Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=bnsW26fx
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: bump to version 2.50.5
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Fixes a number of crashes. Release notes:
 >   https://webkitgtk.org/2026/02/09/webkitgtk2.50.5-released.html

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
