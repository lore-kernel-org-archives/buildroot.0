Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2012C87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 20:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F6E8236B;
	Mon,  4 Aug 2025 20:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHVPz_DnkCHx; Mon,  4 Aug 2025 20:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B02C8236A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B02C8236A;
	Mon,  4 Aug 2025 20:02:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB99233
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7220240D57
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6VnFGnY9XJJZ for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 20:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF88840D4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF88840D4A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF88840D4A
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:02:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1763744660; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Aug 2025 20:02:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uj1O0-00BKQP-0t;
 Mon, 04 Aug 2025 22:02:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250804185002.3337860-1-bernd@kuhls.net>
Date: Mon, 04 Aug 2025 22:02:20 +0200
In-Reply-To: <20250804185002.3337860-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 4 Aug 2025 20:50:02 +0200")
Message-ID: <878qjylusz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=DuYd/fg0jGi0RrXU9Nh2p3AgrENxp47ZxjvAxejCsnieB0EA5FiV9xHSu+hLHV2Bndob9AwRFfEQiZjDs8DeB0isWkYd/rO3ffkkD5YRj6ubGviCv6VbOk/1twvV4gBTfHWv91WypMal4GKJRVTIhtkQsvRAFh3Q/ZPwYdBNPbu8CGsnpsmy30BwFg/p8KTrCb8vQmjfj2FO26ZSeGiA54EaX/JVL5AHOmZzSDBYsfRaxrIl+xEtyfxfc3tbDHFcXS7sQtIMXHgw1FD5amglKInKFwMbowensW1eHvpt0E7vjhdaQLoPp7jHAXsWZl79ZkTFT88RnNTBo0Oi4XdK6g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=mvbMtCqNHwxxusACPm50zm2Y1vhN+6n3E4d3RH6t1L0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=DuYd/fg0
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.8.3
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

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
