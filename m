Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719A4C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC71D83E40;
	Thu, 18 Aug 2022 06:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC71D83E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7lxpEkyJ2cz; Thu, 18 Aug 2022 06:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E76A832EB;
	Thu, 18 Aug 2022 06:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E76A832EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63A171BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F2E440189
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F2E440189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pup9zRmCkPIh for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:16:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E02A400E4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E02A400E4
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:16:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7DCE320002;
 Thu, 18 Aug 2022 06:16:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oOYpM-00CfVb-L2; Thu, 18 Aug 2022 08:16:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220726134436.2014032-1-thomas.petazzoni@bootlin.com>
Date: Thu, 18 Aug 2022 08:16:24 +0200
In-Reply-To: <20220726134436.2014032-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 26 Jul 2022 15:44:35
 +0200")
Message-ID: <87a68284av.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-buildroot,
 package/glibc: sync glibc dependency comments
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > In commit fd839aeb7f40596e60bc53a96b7a65892924cc26 ("package/glibc:
 > introduce and use BR2_PACKAGE_GLIBC_ARCH_SUPPORTS and
 > BR2_PACKAGE_GLIBC_SUPPORTS") we moved the Config.in logic about glibc
 > dependencies from toolchain/toolchain-buildroot/Config.in into
 > package/glibc/Config.in.

 > Unfortunately, it is not possible to move the Config.in comments that
 > tell the user, within the choice..endchoice for the C library why
 > glibc is not currently selectable, so we had to keep them in
 > toolchain/toolchain-buildroot/Config.in.

 > Turns out that the comments were out of sync with the dependencies,
 > and two comments were missing. This commit adds the missing ones, and
 > adds a comment in package/glibc/Config.in explaining that we need to
 > be careful about updating toolchain/toolchain-buildroot/Config.in as
 > well.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
