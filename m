Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C2FC4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 17:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 365E4822DE;
	Thu, 25 Apr 2024 17:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bxyVoPCsMuP; Thu, 25 Apr 2024 17:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 522A4822ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 522A4822ED;
	Thu, 25 Apr 2024 17:20:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A1D11BF39A
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 340A341A09
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KTMgehOqIwY for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 17:20:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FE1E41A06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FE1E41A06
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FE1E41A06
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 17:20:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C60FE0003;
 Thu, 25 Apr 2024 17:20:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s02lk-0005R1-1n;
 Thu, 25 Apr 2024 19:20:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20240425160732.561621-1-angelo.compagnucci@gmail.com>
Date: Thu, 25 Apr 2024 19:20:24 +0200
In-Reply-To: <20240425160732.561621-1-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Thu, 25 Apr 2024 18:07:32 +0200")
Message-ID: <87v8459x5z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-pillow: security bumo to
 version 10.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > In _imagingcms.c in Pillow before 10.3.0, a buffer overflow exists because
 > strcpy is used instead of strncpy.

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
