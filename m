Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FA4CE7A8C
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8362560E5D;
	Sun, 24 Sep 2023 21:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8362560E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4jSxMba8kV9; Sun, 24 Sep 2023 21:07:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2B6960E19;
	Sun, 24 Sep 2023 21:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2B6960E19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C577C1BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F44640320
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F44640320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NmVYoiA56ugv for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:07:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9A6F4012B
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9A6F4012B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C016C0002;
 Sun, 24 Sep 2023 21:07:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkWK7-001wdM-GO; Sun, 24 Sep 2023 23:07:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yanghao Cheng <yanghaobillcheng@gmail.com>
References: <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
 <20230915222711.899079-1-yanghaobillcheng@gmail.com>
 <20230915222711.899079-2-yanghaobillcheng@gmail.com>
Date: Sun, 24 Sep 2023 23:07:27 +0200
In-Reply-To: <20230915222711.899079-2-yanghaobillcheng@gmail.com> (Yanghao
 Cheng's message of "Fri, 15 Sep 2023 15:27:11 -0700")
Message-ID: <87msxbgu0g.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 2/2] package/xserver_xorg-server: Add
 condition in xserver_xorg-server.mk
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
Cc: Yanghao Cheng <yanghao.cheng@aioi-atg.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yanghao" == Yanghao Cheng <yanghaobillcheng@gmail.com> writes:

 > From: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
 > Does not install systemd unit if nodm or xdm is enabled.

 > Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
 > ---
 > Changes v1 -> v2:
 >     - Simplify the condition per Thomas's suggestion

 > Changes v2 -> v3: (Suggested by Yann)
 > 	- Revert indent added in original patch
 > 	- Keep the original number of patches

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
