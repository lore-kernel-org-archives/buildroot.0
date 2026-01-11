Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD86D2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 653C5807FA;
	Sun, 11 Jan 2026 17:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMhTJwrHKpn1; Sun, 11 Jan 2026 17:18:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91AB581234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768151932;
	bh=rrTW6ET3l3k5SxD1gr7a8qddRpuYTvchbaHpN10p7nE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aL/bZ7hm+l5jJcptMXopzNHPbjnUZ1706FPGRhLK+28+fnLzzGu+eLhCB/faWecJY
	 VZNbqhjqB9cWZWkLw299B5zOZ5nkMgJ/B4GuQfLiWbX4KgyvbLH4oiGqVDC6SlTi03
	 ytmpH5oimUUrwNbqj3vMYjTJZIHy5ZYtTuaORV6kAN8zD5oaGp6eE1B8TVeI3M3N9h
	 ZGAh0P2z83sxsSTb6Kt7wW5YfeO1DDO8HfG76xNmCxj8BmYlM1rbmg0FdtRhzqSpDF
	 WSFzhlLnNOiDBYkAYp5Lo4Ghd/bCLnf+NHEdMgpkU6podVS0/QQAPiLJq1C0HZFvRO
	 qw25WI44eqvgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91AB581234;
	Sun, 11 Jan 2026 17:18:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B07018D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5FC8812C3
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNXzUmlppsg5 for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:18:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1A62807FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A62807FA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1A62807FA
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:18:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2109821168; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Jan 2026 17:18:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vez5Q-00000006sYs-3wtk;
 Sun, 11 Jan 2026 18:18:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260110180655.2221592-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 10 Jan 2026 19:06:54 +0100")
References: <20260110180655.2221592-1-bernd@kuhls.net>
Date: Sun, 11 Jan 2026 18:18:44 +0100
Message-ID: <87wm1oysnf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PQTKHn/APOZNYPzKAbwWfdskCmtYkVJxZAOhI+Vk63OizmktwqdLdr6i+Ouv/vvrPiGwP9eDclUmYs9M30lqwicBrN5Y2o9g/JdCcSQdrjrQNeMuJ7CJX6iduIf8X2sL0hf/urRj+syU1771tFGLL3P6c2GFkTca/t3m9taE1M6y3PJlXFvSI2wOIr04ZaDFFv1Cr6pCLTj6f8g25sfFIHq/o45dcotTvFYfl6fTqAnELHC/FYNHMa1B628tcYOH2EiK8Jr2g0nlz0zKiRvu7V5I7GUu7nZdcfJfyfuTrx1/pOOaRMV0BRzpivV3s2hE0tApLhBnR55tdjJm2LXbsw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=xTTgls+9cBFFHyq5GT4MZyH82VKC6cYrBVVK6noWq/g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=PQTKHn/A
Subject: Re: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to
 1.2.15.2
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

 > https://www.alsa-project.org/wiki/Changes_v1.2.15.1_v1.2.15.2#alsa-lib
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
