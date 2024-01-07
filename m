Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D3AC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 11:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC6AC41DFC;
	Sun,  7 Jan 2024 11:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC6AC41DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zox5Dbl2ry7h; Sun,  7 Jan 2024 11:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4508A408F6;
	Sun,  7 Jan 2024 11:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4508A408F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 806BE1BF4D5
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66D9E408F6
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66D9E408F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9SmKi0N3qb-N for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 11:21:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70524408DE
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 11:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70524408DE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B1AAC0003;
 Sun,  7 Jan 2024 11:21:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMRDY-006dob-2y;
 Sun, 07 Jan 2024 12:21:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <01cce88291ac132ca8c881eaaaf3b02a4efa68a9.1702887543.git.yann.morin@orange.com>
Date: Sun, 07 Jan 2024 12:21:24 +0100
In-Reply-To: <01cce88291ac132ca8c881eaaaf3b02a4efa68a9.1702887543.git.yann.morin@orange.com>
 (yann morin's message of "Mon, 18 Dec 2023 09:19:03 +0100")
Message-ID: <871qat1j9n.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] editorconfig: fix wildcard expansion
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

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > It turns out that wildcard expansion, * and ?, is not performed in
 > matching lists {...}, at least in the vim plugin. The spec is not clear
 > about that, but refer to "pattern matching through Unix shell-style
 > wildcards" [0].

 > So, let's consider that this is not supported. Expand the patterns into
 > one section each, rather than use a list.

 > [0] https://spec.editorconfig.org/

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
