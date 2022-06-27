Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F9BC43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B04F582C3C;
	Mon, 27 Jun 2022 20:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B04F582C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grD8TD79Des3; Mon, 27 Jun 2022 20:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D304282C33;
	Mon, 27 Jun 2022 20:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D304282C33
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C64321BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F0AE82A5D
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F0AE82A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWBj4SY7fLHm for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:43:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95EEE82909
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95EEE82909
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:43:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AD381100006;
 Mon, 27 Jun 2022 20:43:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o5vaA-00D1E4-PY; Mon, 27 Jun 2022 22:43:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20220530151612.3072914-1-thomas.devoogdt@barco.com>
 <4c9eff36-58b8-c617-b4e9-c52826aeca32@mind.be>
 <CACXRmJh9hqYSXuQ6hsgZyMSHxebbsVBqqN4ywJ+XHCUOaj43Fw@mail.gmail.com>
Date: Mon, 27 Jun 2022 22:43:42 +0200
In-Reply-To: <CACXRmJh9hqYSXuQ6hsgZyMSHxebbsVBqqN4ywJ+XHCUOaj43Fw@mail.gmail.com>
 (Thomas Devoogdt's message of "Tue, 21 Jun 2022 10:34:20 +0200")
Message-ID: <8735fpzvk1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: add qemu host tools
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Hi,
 > I did not find a way to update this series (using git send-email), should I
 > send my mail to something else than buildroot@buildroot.org?
 > Anyway, a new patch can be found here:
 > https://patchwork.ozlabs.org/project/buildroot/patch/20220621083027.2587218-1-thomas@devoogdt.com/

Simple send a v2 patch (git send-email -v2 ..) and login to patchwork to
mark your v1 patch as superseeded, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
