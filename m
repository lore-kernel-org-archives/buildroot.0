Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFC3C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5444023D;
	Wed, 10 Jan 2024 15:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D5444023D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e0kU-AZI_X2S; Wed, 10 Jan 2024 15:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A999A41511;
	Wed, 10 Jan 2024 15:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A999A41511
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A36E1BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF4C3436D9
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF4C3436D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZBy-8uDpGR0 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:41:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEE0143583
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEE0143583
Received: by mail.gandi.net (Postfix) with ESMTPSA id C10C71C0007;
 Wed, 10 Jan 2024 15:41:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNahR-008cEM-2i;
 Wed, 10 Jan 2024 16:41:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231109212901.5596-1-ps.report@gmx.net>
 <20231109212901.5596-4-ps.report@gmx.net> <ZYylqNlJBI4-Uouq@landeda>
Date: Wed, 10 Jan 2024 16:41:01 +0100
In-Reply-To: <ZYylqNlJBI4-Uouq@landeda> (Yann E. MORIN's message of "Wed, 27
 Dec 2023 23:31:04 +0100")
Message-ID: <87r0ipb3hu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 4/4] package/libcamera: add i.MX8 ISI
 pipeline option
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2023-11-09 22:29 +0100, Peter Seiderer spake thusly:
 >> Add i.MX8 ISI pipeline option (introduced with upstream commit [1] (since
 >> version v0.0.1).
 >> 
 >> [1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=0ec982d210861cc6aaebb5d6e8f1a755a16c9792
 >> 
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
