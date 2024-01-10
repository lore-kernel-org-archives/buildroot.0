Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC31C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F0F041C0F;
	Wed, 10 Jan 2024 15:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F0F041C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dUKK1QobxqLU; Wed, 10 Jan 2024 15:28:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C3484188D;
	Wed, 10 Jan 2024 15:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C3484188D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4361BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16330417FA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16330417FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sTLi_Ex6dgef for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:28:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E0164179F
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E0164179F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B13E60004;
 Wed, 10 Jan 2024 15:28:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNaVC-008bKD-0Z;
 Wed, 10 Jan 2024 16:28:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sebastian Bauer <mail@sebastianbauer.info>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
Date: Wed, 10 Jan 2024 16:28:22 +0100
In-Reply-To: <20231227182429.1215185-1-mail@sebastianbauer.info> (Sebastian
 Bauer's message of "Wed, 27 Dec 2023 19:24:27 +0100")
Message-ID: <87h6jlcind.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/3] Revert "package/libcamera-apps: bump to
 version 1.3.0"
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sebastian" == Sebastian Bauer <mail@sebastianbauer.info> writes:

 > This reverts commit c9645fd29bf38b5a960aed3eeac36975d64a400a.
 > Building libcamera-apps 1.3.0 with current libcamera 0.1.0 fails because
 > some of the symbols like controls::AeFlickerMode are not recognized.
 > According to my research, they have been introduced after libcamera 0.1.0
 > but there is no release version of libcamera newer than 0.1.0 available
 > to which we could bump.

 > Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
