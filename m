Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73902C433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0646B610D6;
	Fri, 30 Sep 2022 15:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0646B610D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QV2HLm_t5Zlv; Fri, 30 Sep 2022 15:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26D4560B4C;
	Fri, 30 Sep 2022 15:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26D4560B4C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0771BF2F7
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 662BA60B4C
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 662BA60B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmG3NuluGyJE for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:07:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C63610D4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1C63610D4
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:07:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C5BCE0009;
 Fri, 30 Sep 2022 15:07:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oeHby-00Bc9g-AJ; Fri, 30 Sep 2022 17:07:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220924071932.1205B85C6E@busybox.osuosl.org>
Date: Fri, 30 Sep 2022 17:07:34 +0200
In-Reply-To: <20220924071932.1205B85C6E@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 24 Sep 2022 09:16:45 +0200")
Message-ID: <87wn9k52a1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/m4: remove --disable-static
 for host package
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=bddc64e866186356297240240c69be7b17ff6d40
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This issue was reported by Firas Khalil Khana on a Github pull request
 > at https://github.com/buildroot/buildroot/pull/113/.

 > There is no --disable-static in m4. Research in the dark corners of
 > the Git history has shown that it was apparently added by Peter
 > Korsgaard back in 2009, in commit
 > 3467cf73051d2b8d28d48dfdd694f66315f3b8ca ("m4: cleanup"). At this
 > time, the version of m4 used was 1.4.9, but even looking at the
 > tarball of this old release shows that the ./configure did not support
 > --disable-static.

 > So let's drop this option.

Blast from the past! I also don't recall why I added it.

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
