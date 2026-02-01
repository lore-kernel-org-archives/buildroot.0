Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA04BE65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE0436089A;
	Sun,  1 Feb 2026 20:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0dJey3YC3u6; Sun,  1 Feb 2026 20:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B35860688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978322;
	bh=O+lDQurswTUZ8/LdKzk7cNrPh/ow2gp/MOzKxCnJpZ4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AezrmQ2s4Dzsrod0+O9+LWpSb8Mf3rXbPn6kkJHABP5ZqLtuyopqF357zuDp7XRpP
	 AodxMLoEtuXX6Z0q/iyIhJbu7VJwgziJqrZn5SGXBPCGEMUin6qkM41o1OAbeww0xa
	 4CKGYu2tMgiFj+1o6i4esQYgdLYuQaBniIxRnv7SoShgsQoyDDvf7/Qo5NLmJAkdUL
	 g5ccodcgKIt5lcM+DaR1NnvwO681ZtRXnH1QMYt3Yc4gBKS7+/cyGTms3HYRywe402
	 q1phxZuz04XnoDTcNKpTYWvZsd1vrQOeIcFE+RpKnl8LmYUm8UARWQKV/459TXoYWK
	 vhROCJ6276xlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B35860688;
	Sun,  1 Feb 2026 20:38:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1349F1E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01A6682368
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zen9K5-NzGqh for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:38:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E25CA82367
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E25CA82367
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E25CA82367
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:38:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1860762535; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:38:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmeCy-00000005k7n-1Pgh;
 Sun, 01 Feb 2026 21:38:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260201183949.3297871-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 1 Feb 2026 19:39:49 +0100")
References: <20260201183949.3297871-1-bernd@kuhls.net>
Date: Sun, 01 Feb 2026 21:38:12 +0100
Message-ID: <87ecn49p3f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AFFR9bSChw3Ju+w3/s+t+f6IXW4IaZJtNHYIsXC4IFPo8AJuBn6dJVsChao/8wTmxbI2aHBWwNM7nBWx8gx8Nn7jAjhd4ab7/L0F53zpGB2hO1G9ylHMvGpR93EkM7PXg8XxOJp4uot48X7LuMwZeaZdjM3zoR6aMgf76OsNHa/kv2MP2Id57pCekn3gZ0+kOSqLh9nh2W4fdduaZa1xFIgkeCNbbuqDLIpx+QH0JRAhSLEkx3jC8diuS+9X7s2LQZimYjmMR1q16yvA6fcoveIgP89zr6/6aK0eZ34HnKxjX5UuCAITmMW9GtHSSKIUq16Y6fonNTC5YTdGklBBrQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=qcU6PCp6kscIWbSB1QUYBIQoZ7vtWV4qgBnKvtUJGkU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=AFFR9bSC
Subject: Re: [Buildroot] [PATCH 1/1] package/transmission: bump version to
 4.1.0
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

 > https://github.com/transmission/transmission/releases/tag/4.1.0
 > Removed patch which is included in this release.

 > Updated license hash due to copyright year bump:
 > https://github.com/transmission/transmission/commit/5ce17df2e52eda39d61272590bdf4921c9bf7bc7

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
