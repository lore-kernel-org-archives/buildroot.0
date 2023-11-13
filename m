Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8D4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 21:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97B85409A2;
	Mon, 13 Nov 2023 21:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B85409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHGQgA-36QOV; Mon, 13 Nov 2023 21:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E79EC4175E;
	Mon, 13 Nov 2023 21:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E79EC4175E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E262E1BF389
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C84B4420AA
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C84B4420AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otaQCXY30pOj for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 21:52:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B554A410AC
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 21:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B554A410AC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90AC2FF806;
 Mon, 13 Nov 2023 21:52:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2eqw-00BYym-2P;
 Mon, 13 Nov 2023 22:52:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231112194326.2539029-1-peter@korsgaard.com>
 <20231112194326.2539029-4-peter@korsgaard.com>
Date: Mon, 13 Nov 2023 22:52:18 +0100
In-Reply-To: <20231112194326.2539029-4-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 12 Nov 2023 20:43:25 +0100")
Message-ID: <8734x9e2y5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 4/4] support/dependencies/check-host-tar.sh:
 blacklist tar 1.35+
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > GNU tar 1.35 changed the behaviour for the devmajor/devminor fields,
 > breaking the download hash validation.  For details, see:

 > https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html
 > https://patchwork.ozlabs.org/project/buildroot/patch/20231018141155.533944-1-vfazio@gmail.com/

 > To work around this issue, blacklist tar 1.35+ similar to how we do it for
 > pre-1.27 versions so Buildroot falls back to building host-tar (which is
 > currently 1.34).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
