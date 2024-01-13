Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4DBC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 15:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 536F341DF6;
	Sat, 13 Jan 2024 15:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 536F341DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6b1V3omNDTs5; Sat, 13 Jan 2024 15:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF9041D8D;
	Sat, 13 Jan 2024 15:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF9041D8D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2491BF263
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 15:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32A68403E5
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 15:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32A68403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp25hJ_Dhf75 for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 15:10:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3EB0403AA
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 15:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3EB0403AA
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF812C0002;
 Sat, 13 Jan 2024 15:10:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOfev-00DDC6-0o;
 Sat, 13 Jan 2024 16:10:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20240103191151.2777684-1-bernd@kuhls.net>
 <20240103191151.2777684-2-bernd@kuhls.net>
Date: Sat, 13 Jan 2024 16:10:53 +0100
In-Reply-To: <20240103191151.2777684-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 3 Jan 2024 20:11:51 +0100")
Message-ID: <87h6jhtgjm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] package/exim: do not build
 perl-based utilities
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Upstream added various utilities, for example exim_id_update
 > with commit https://github.com/Exim/exim/commit/46a36afae41f63de654269c8a0b7cf5852a85a14
 > which is a "Utility for one-time upgrage/downgrade between exim message-
 > id formats, around the 4.97 transition" which would add a dependency to
 > host-perl/perl so we build and install only the needed exim binary.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2: removed comment before EXIM_INSTALL_TARGET_CMDS, reworded commit log
 >     text (Luca)

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
