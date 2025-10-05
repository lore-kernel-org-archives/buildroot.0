Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB91CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E58BB4129C;
	Sun,  5 Oct 2025 13:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXZ6JFT2hsG7; Sun,  5 Oct 2025 13:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DECCC4122E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DECCC4122E;
	Sun,  5 Oct 2025 13:30:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1A50272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3DF483B85
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFtXo70hPOca for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 959B582293
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 959B582293
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 959B582293
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:30:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 253145646; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 13:30:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5Ooa-00Gl1T-2H;
 Sun, 05 Oct 2025 15:30:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>
References: <20251004122113.2161276-1-bernd@kuhls.net>
 <20251004122113.2161276-3-bernd@kuhls.net>
Date: Sun, 05 Oct 2025 15:30:16 +0200
In-Reply-To: <20251004122113.2161276-3-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 4 Oct 2025 14:21:13 +0200")
Message-ID: <87zfa5328n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Ipsk2y6uE1KNBVSbsLOeYCAPwIV+S1Rgw+CTvHcEEeAyiuULG3vg6Qp25UdM0vyrkz9ZpnEjtFY/gqyOIO7Gvnw5GMwpOng+Q1GaGldcsTvRFDacfe1HHKOq+LJkLGroeaVP4yJRKDGheTsB/uksqpbyv5jWCq4nfHbhOB4Jfi6wseYrS6z/Nhxjza58+XE147zyWStpjiL3YuamOP05m31vxk4mnkfeCzko4A+XxSZKS2bSPUvBgAei3mfHYaGm5u77m+rZZ8lWYBoc4m5Gg7rSjAKifJQJsIm3lzjCyo3tWy1bhgk9QJZiqHm9tujsx0ON6V+0a3067dyy5veIKA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=srMsNRk/iSUfMOrGKb6bggbvcxwaJiWj79dvSWrmbmY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Ipsk2y6u
Subject: Re: [Buildroot] [PATCH 3/3] package/gnupg2: bump to version 2.4.8
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
 > https://lists.gnupg.org/pipermail/gnupg-announce/2025q3/000496.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
