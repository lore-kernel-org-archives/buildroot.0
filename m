Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4FAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:17:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3161F611AF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3161F611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F196780DF4;
	Tue,  9 Nov 2021 08:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZ-RYFjJASPd; Tue,  9 Nov 2021 08:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5039880DAC;
	Tue,  9 Nov 2021 08:17:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26F061BF3B9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 230FE606EF
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSeUTlygvrO6 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:17:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A36360692
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:17:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 119541BF206;
 Tue,  9 Nov 2021 08:17:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mkMK5-0006mI-8Q; Tue, 09 Nov 2021 09:17:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20211105221658.1163788-1-romain.naour@gmail.com>
Date: Tue, 09 Nov 2021 09:17:41 +0100
In-Reply-To: <20211105221658.1163788-1-romain.naour@gmail.com> (Romain Naour's
 message of "Fri, 5 Nov 2021 23:16:58 +0100")
Message-ID: <87czn94uai.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/refpolicy: move patches to
 subdirectory
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > refpolicy patches are for 2.20210908 upstream version but when using a custom
 > version from git they may fail to apply.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417630

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2021.08.x, thanks (after adapting it to the version /
patches available there).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
