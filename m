Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32192CEBF61
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 20:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DA240661;
	Sun, 16 Nov 2025 20:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyvZ_pYQXhCU; Sun, 16 Nov 2025 20:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18C3840668
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C3840668;
	Sun, 16 Nov 2025 20:59:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BA651A9
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51AA082668
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFPYvAO3hg8A for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 20:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F80482628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F80482628
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F80482628
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:58:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -743748465; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Nov 2025 20:58:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vKjpi-000000012JX-10oF;
 Sun, 16 Nov 2025 21:58:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20251115230847.2727702-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 16 Nov 2025 00:08:47 +0100")
References: <20251115230847.2727702-1-bernd@kuhls.net>
Date: Sun, 16 Nov 2025 21:58:50 +0100
Message-ID: <878qg5wv79.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AF0AGG0+VM2YYu1egUBUgNbPaYTqgj5C4oihJxR3MivnjH9Fzhb0qLkvTRtSAld+FRSLsL4uu/BCIqYtYqwo5/k52AgyoycXzQapvgJcq+YCqejaRPIAy8i3IBhGaUWRVwM3BRtYk6420Qj/hVze+Tjt0AQT7YFJUnvkSleztSYNsKmWct9MPQo1zKvk9Mxy+SJVxpXHNFMvp5ySwkKnTdfw4UPNA1swwvS0EnBbZnsdXk3VxddnRZCI5KAMSSGyVPTlTeaEGQ3g0KRQ9OHQQn/PE1X8wV7vkVk+iHI85vWFAJ8qIGR/QYs3HNffIbDeZKuCsoZ8/T4FjjF5jIH9fg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Y9sH3i1ooM0fAjEDmjdYMjdDipyWbB5EIZ8BlUlmWDg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AF0AGG0+
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: fix merged-bin
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

 > mv: '/home/autobuild/autobuild/instance-2/output-1/per-package/iputils/target/usr/bin/arping'
 >  and
 > '/home/autobuild/autobuild/instance-2/output-1/per-package/iputils/target/usr/sbin/arping'
 >  are the same file

 > Fixes:
 > https://autobuild.buildroot.net/results/dae/daeebb090f6d11d77840dd61add9bc422c6bc2fa/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Good catch. I see we have a number of other packages doing something
similar. I'll send patches.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
