Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CD9C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 20:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2963B80BEA;
	Tue, 28 Nov 2023 20:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2963B80BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sc47hSk1-xVh; Tue, 28 Nov 2023 20:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89CEB80BA7;
	Tue, 28 Nov 2023 20:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89CEB80BA7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C82E1BF38E
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11EC341764
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11EC341764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rROZbis3jkxR for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 20:50:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C53CB41762
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 20:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C53CB41762
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF9871C0002;
 Tue, 28 Nov 2023 20:50:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8529-00GUXU-10;
 Tue, 28 Nov 2023 21:50:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier <brandon.maier@collins.com>
References: <20231128195507.5291-1-brandon.maier@collins.com>
Date: Tue, 28 Nov 2023 21:50:17 +0100
In-Reply-To: <20231128195507.5291-1-brandon.maier@collins.com> (Brandon
 Maier's message of "Tue, 28 Nov 2023 19:55:07 +0000")
Message-ID: <878r6hd2ly.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] docs/website: fix favicon
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

>>>>> "Brandon" == Brandon Maier <brandon.maier@collins.com> writes:

 > When the favicon image was added in f26e61319f3f (docs/website: add
 > favicon.png), it was added to a different directory then where the header's
 > icon link points. This causes the favicon to fail to load with 404.

 > While we are here, remove the "shortcut" rel attribute as it is non-standard
 > and it's recommended not to use it[1].

 > [1] https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rel#sect4

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
