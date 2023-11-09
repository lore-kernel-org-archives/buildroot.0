Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEF0C4167B
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 11:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B98D60F02;
	Thu,  9 Nov 2023 11:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B98D60F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlAviuddFu-J; Thu,  9 Nov 2023 11:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB78060A7E;
	Thu,  9 Nov 2023 11:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB78060A7E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 609A61BF28A
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A7C060A7E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A7C060A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EBw_K7a8EK8Y for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 11:12:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7724560A7A
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 11:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7724560A7A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C0FF24000B;
 Thu,  9 Nov 2023 11:12:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r12xt-001rrZ-1G;
 Thu, 09 Nov 2023 12:12:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier via buildroot <buildroot@buildroot.org>
References: <20231031225751.35130-1-brandon.maier@collins.com>
Date: Thu, 09 Nov 2023 12:12:49 +0100
In-Reply-To: <20231031225751.35130-1-brandon.maier@collins.com> (Brandon Maier
 via buildroot's message of "Tue, 31 Oct 2023 22:57:51 +0000")
Message-ID: <878r77p4cu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] freeradius-server: enable default
 modules mschap and realm
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Kalpesh Panchal <kalpesh.panchal2@collins.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Brandon" == Brandon Maier via buildroot <buildroot@buildroot.org> writes:

 > From: Kalpesh Panchal <kalpesh.panchal2@collins.com>
 > "mschap" and "realm" are already part of default required
 > raddb modules(DEFAULT_MODULES in raddb/all.mk).

 > so removed them from disabled module list so that
 > radiusd.service can start without following errors:

 > - /etc/raddb/mods-enabled/mschap[11]: Failed to link to module 'rlm_mschap': /usr/lib/rlm_mschap.so
 > - /etc/raddb/mods-enabled/realm[21]: Failed to link to module 'rlm_realm': /usr/lib/rlm_realm.so

 > Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
