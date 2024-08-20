Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3841C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 18:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97AE260765;
	Tue, 20 Aug 2024 18:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLbDDWhE02Nk; Tue, 20 Aug 2024 18:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F88660AB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F88660AB7;
	Tue, 20 Aug 2024 18:49:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA76A1BF575
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 18:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B865E60AB7
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 18:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvAbmyh_7b9G for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 18:49:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A32460765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A32460765
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A32460765
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 18:49:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F12B420002;
 Tue, 20 Aug 2024 18:49:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sgTvS-00HMmp-0y;
 Tue, 20 Aug 2024 20:49:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
References: <20240711210342.250810-1-buildroot@heine.tech>
Date: Tue, 20 Aug 2024 20:49:50 +0200
In-Reply-To: <20240711210342.250810-1-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Thu, 11 Jul 2024 23:03:41 +0200")
Message-ID: <87ed6jf2r5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/boost: cleanup
 boost-context/fiber/math
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@buildroot.org> writes:

 > boost-context
 > - requires C++11 (gcc 4.8) since 1.61 see [0]
 > - dropped the dependency on (boost) thread in 1.77 see [1]
 > boost-fiber
 > - needed C++11 since it's creation in 1.61 [2]
 > boost-math
 > - add comment for gcc version

 > [0] https://www.boost.org/doc/libs/1_82_0/libs/context/doc/html/context/requirements.html
 > [1] https://github.com/boostorg/context/commit/8425e830eab0ad550db937027392c4b4a54df695
 > [2] https://www.boost.org/doc/libs/1_62_0/libs/fiber/doc/html/fiber/overview.html

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
