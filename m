Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9657DD75E57
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 14:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F1D849F8;
	Fri, 22 Nov 2024 14:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXpX8JUTUjE8; Fri, 22 Nov 2024 14:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 404B1849FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 404B1849FB;
	Fri, 22 Nov 2024 14:31:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73A35B69
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 14:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54FB9849F8
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 14:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cufiJgF9ZFSa for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 14:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F9BD849FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F9BD849FB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F9BD849FB
 for <buildroot@busybox.net>; Fri, 22 Nov 2024 14:31:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1FC120005;
 Fri, 22 Nov 2024 14:31:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tEUhD-00997S-04;
 Fri, 22 Nov 2024 15:31:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
References: <20241104195824.1057262-1-francois.perrad@gadz.org>
Date: Fri, 22 Nov 2024 15:31:42 +0100
In-Reply-To: <20241104195824.1057262-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Mon, 4 Nov 2024 20:58:23 +0100")
Message-ID: <87zflrqr01.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/mbedtls: security bump to 2.28.9
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

>>>>> "Francois" == Francois Perrad <francois.perrad@gadz.org> writes:

 > fix CVE-2024-45157
 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
