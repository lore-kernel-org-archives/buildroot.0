Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED5BD58D68
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 16:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5222B84E6C;
	Mon, 25 Nov 2024 16:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bx5zdu7Pw5z; Mon, 25 Nov 2024 16:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F59A84F8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F59A84F8B;
	Mon, 25 Nov 2024 16:37:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A83A4961
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 246A8433B4
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9Wy4OZ6zeeG for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 16:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32F214033F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F214033F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32F214033F
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:37:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8668EC0009;
 Mon, 25 Nov 2024 16:37:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tFc5d-005uO4-2S;
 Mon, 25 Nov 2024 17:37:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Cherniaev Andrei <dungeonlords789@naver.com>
Cc: buildroot@buildroot.org,  Marcus Hoffmann <bubu@bubu1.eu>
References: <20241109170900.1766890-1-dungeonlords789@naver.com>
Date: Mon, 25 Nov 2024 17:37:33 +0100
In-Reply-To: <20241109170900.1766890-1-dungeonlords789@naver.com> (Cherniaev
 Andrei's message of "Sun, 10 Nov 2024 02:09:00 +0900")
Message-ID: <87zflnnub6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/picotool: fix help
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

>>>>> "Cherniaev" == Cherniaev Andrei <dungeonlords789@naver.com> writes:

 > before this you will every-time see "*** picotool needs a toolchain w/
 > C++, threads, gcc >= 4.9 ***" even if all features are enabled

 > Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
