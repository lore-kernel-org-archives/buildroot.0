Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95F3C54E41
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 21:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C8D7605F9;
	Mon,  4 Mar 2024 21:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urqjPbVKyreY; Mon,  4 Mar 2024 21:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F8666062E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F8666062E;
	Mon,  4 Mar 2024 21:50:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE1321BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA45C80B6D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BOYOygse7OW for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 21:50:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFE3680B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFE3680B3C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFE3680B3C
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 21:50:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DA8D240002;
 Mon,  4 Mar 2024 21:49:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rhGC4-00GzKL-2b;
 Mon, 04 Mar 2024 22:49:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240304160757.3518501-1-fontaine.fabrice@gmail.com>
Date: Mon, 04 Mar 2024 22:49:56 +0100
In-Reply-To: <20240304160757.3518501-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 4 Mar 2024 17:07:57 +0100")
Message-ID: <87a5nd1xbv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: needs C++20
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > C++20 is mandatory since bump to version 3.2.0 in commit
 > 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813 and
 > https://github.com/randombit/botan/commit/e2efb744ceda875b193bc5ce589f2c45ceaa3a82
 > resulting in the following build failure:

 > powerpc-linux-g++.br_real: error: unrecognized command line option '-std=c++20'; did you mean '-std=c++2a'?

 > BR2_TOOLCHAIN_HAS_GCC_BUG_64735 dependency can be dropped as gcc > 7 is
 > not affected by this bug

 > Fixes: 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813
 >  - http://autobuild.buildroot.org/results/4171515ce33832fb07c8b42cda2575067f9e9859

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
