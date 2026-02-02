Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52AFE73144
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 137B6404F8;
	Mon,  2 Feb 2026 08:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5y3ckNjx26c; Mon,  2 Feb 2026 08:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ECF74021D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770020174;
	bh=SwY0bqowzwHKnWWZFQXC1NDIkBpP+BKPxfAUOv/Bea8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nNv55AthIl5qXz/ncsZ1PDMGNiZK2/mtB7N2m+Umh0yi+70Rxkesy17RjNclZukGB
	 K0BO4xdjk3N3EpZzqjuhUDgzwd+2RxaxcQMjk7nz8U5TQtUxJCNmDzIXlTGYuPjAOJ
	 MC2neEo+hXGjeaW7go/SQguFBeX0nmYS1oYV0cZH8xJy4t1fmVJr6lXTZBTcJutMPd
	 gs0S+Q1pJpLb9Q0LJodQ9TUmbj7h3iVGP4Cy7wQ3MgDVZTH6zpCa4CKcmSjCY4BQaH
	 I1AaSd9IJfse7f1V8nZaTkMQICx85i+J3JsBD/36ComvvAgFOfqwbJmzQxebRnjhml
	 WLgwLbnn16rKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ECF74021D;
	Mon,  2 Feb 2026 08:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 930B0149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 773C84017A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7_FGGYTUt62 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:16:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FBC0400D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FBC0400D9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FBC0400D9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:16:10 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1987454220; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 08:16:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmp6L-00000005nmh-0nX2;
 Mon, 02 Feb 2026 09:16:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260201184105.3516843-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 1 Feb 2026 19:41:05 +0100")
References: <20260201184105.3516843-1-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 09:16:05 +0100
Message-ID: <87y0lb7e7u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Xuna7k66k6QluVjgc4lYk04FhpP1vOuFd0pxg9K6LZEH5FYtwr3G3rgakWDBDnxe+1UN91dAeJkVx6lNjEDKSgaQNZuocCROwWpfgO9N17E/Mn0nGzo3KGWnpnF7f+TRIOlLDktk03HNIwqVVk6bydbWSPyGBrkuL19dg866fmWgtWxoTdocN/aVjumSp70WJHIPT8Wr0/cu8QzGZkM7O1X7WvpRc1t+AJPXX5J411EdwGGd7PMJGExQEiA73SE75TfquV8L/BbCS3p9H1UZTjiTxiCOI62ySUGL2DzZ9d27adBgsrIAn52KffzLxor/hjZgfu63rYCoixb47Ot6hg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=DtOqQJDDp/i6pdt45rh9AyD1DlLzuwnesakaMVuTCfU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Xuna7k66
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: bump version to 4.0.6
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://gitlab.com/procps-ng/procps/-/blob/v4.0.6/NEWS
 > Removed patch which is included in this release.

 > Switched _SITE to https.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
