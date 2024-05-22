Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC8FC25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 06:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F6A260807;
	Wed, 22 May 2024 06:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGQSSN6Q54t6; Wed, 22 May 2024 06:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 804FB60810
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 804FB60810;
	Wed, 22 May 2024 06:15:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 824CF1C57BD
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 06:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74A9581AF3
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 06:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAoVny0ycJWn for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 06:15:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69541819D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69541819D5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69541819D5
 for <buildroot@buildroot.org>; Wed, 22 May 2024 06:15:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B388220002;
 Wed, 22 May 2024 06:15:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s9fGN-00AlFi-2m;
 Wed, 22 May 2024 08:15:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
References: <20240519133113.16738-1-ps.report@gmx.net>
Date: Wed, 22 May 2024 08:15:47 +0200
In-Reply-To: <20240519133113.16738-1-ps.report@gmx.net> (Peter Seiderer via
 buildroot's message of "Sun, 19 May 2024 15:31:13 +0200")
Message-ID: <874jaqmkx8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH for 2024.02.x v1] package/git: security bump
 version to 2.43.4
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer via buildroot <buildroot@buildroot.org> writes:

 > Fixes CVE-2024-32002, CVE-2024-32004, CVE-2024-32020 and CVE-2024-32021
 > (for details see [1]).

 > [1] https://lore.kernel.org/lkml/xmqqv83g4937.fsf@gitster.g/

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
