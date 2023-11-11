Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2619CC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 22:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD85841FC8;
	Sat, 11 Nov 2023 22:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD85841FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2h35HKzjcHx4; Sat, 11 Nov 2023 22:08:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173DD41F93;
	Sat, 11 Nov 2023 22:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 173DD41F93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59F251BF48B
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 22:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 326AE607B5
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 22:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 326AE607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59anV8qfEDIG for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 22:08:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4595E607A3
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 22:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4595E607A3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84F9F60007;
 Sat, 11 Nov 2023 22:08:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r1w9M-008QAX-2x;
 Sat, 11 Nov 2023 23:08:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Roberto Medina <robertoxmed@gmail.com>
References: <20231107231351.8369-1-robertoxmed@gmail.com>
Date: Sat, 11 Nov 2023 23:08:20 +0100
In-Reply-To: <20231107231351.8369-1-robertoxmed@gmail.com> (Roberto Medina's
 message of "Tue, 7 Nov 2023 23:13:51 +0000")
Message-ID: <87y1f4gcyz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Bump Linux and
 U-Boot version
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

>>>>> "Roberto" == Roberto Medina <robertoxmed@gmail.com> writes:

 > Bump version of Linux to 6.1.61 and U-Boot to 2023.10.
 >     U-Boot requires enabling pylibfdt and pyelftools
 >     We need to increase the size of the rootfs, and we get rid of a
 > 64bit warning on `mke2fs` by passing `-O 64bit` as an argument.

Do you just mean the warning from mke2fs or something else? E.G.:

64-bit filesystem support is not enabled.  The larger fields afforded by
this feature enable full-strength checksumming.  Pass -O 64bit to
rectify.


Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
