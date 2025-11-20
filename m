Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DACCFA441
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 20:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CD806F4B1;
	Thu, 20 Nov 2025 20:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guZKHhuVs9Q2; Thu, 20 Nov 2025 20:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D84FC60A8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D84FC60A8A;
	Thu, 20 Nov 2025 20:03:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6079158
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9846740521
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcY5fgcbpguo for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 20:03:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17DCB400B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17DCB400B7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17DCB400B7
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:03:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1919902512; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Nov 2025 20:03:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vMAsX-00000003uXA-0OwD;
 Thu, 20 Nov 2025 21:03:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251120185148.307327-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 20 Nov 2025 19:51:48 +0100")
References: <20251120185148.307327-1-bernd@kuhls.net>
Date: Thu, 20 Nov 2025 21:03:41 +0100
Message-ID: <87see8jwte.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TtywvVByBAwMk3VftN+Dn+cXdQ1vuasGovjGO9dTfgzJjovK51tHCTIBjCEagLgvd+rZy7YfRLqZmZjTwp3EUVpXPDkplR11Wa6DMHqC//QX4Ev4Xa0T2FcDsV7aK7GnsmZV53OVgIGTwM4KdbDWGn1ydhsTThUPV7y/HXv76fUaghvhGtxeNVjd6G8uwEURxH+Zlddk0HOtRoz2tmtxRfs3PXW5uQ2IB+BwBp1CGacwVReU/ePwCC6ukH5/Hj/CaH65UAZ3YnyG4vHrUZDnIOwSuoGITEQDeAtCmtba34YeleReVJmUyAel9G24npULcHv1QZ1NUbh5IEyum9a3NQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=bl3ahURPgiyLeu9d34RK/0UPRwvDAt6xyZr0Baxnh7w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TtywvVBy
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.4.15
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

 > Release notes:
 > https://www.php.net/releases/8.4/en.php
 > https://news-web.php.net/php.announce/473

 > Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_4

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
