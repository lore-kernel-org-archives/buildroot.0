Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46D3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 20:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A635409AC;
	Tue,  8 Mar 2022 20:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmRmBDzT5pa7; Tue,  8 Mar 2022 20:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5814037A;
	Tue,  8 Mar 2022 20:13:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1878A1BF86C
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 086C94035E
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7AG0Mp6MsLTw for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 20:13:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA1C94035C
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 20:13:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70141FF807;
 Tue,  8 Mar 2022 20:13:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRgCo-001fxQ-HC; Tue, 08 Mar 2022 21:13:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <19532_1646758392_622789F8_19532_102_1_b2db850ee51822a3272be0f6984d2e53d73e790c.1646758134.git.yann.morin@orange.com>
Date: Tue, 08 Mar 2022 21:13:14 +0100
In-Reply-To: <19532_1646758392_622789F8_19532_102_1_b2db850ee51822a3272be0f6984d2e53d73e790c.1646758134.git.yann.morin@orange.com>
 (yann morin's message of "Tue, 8 Mar 2022 17:53:10 +0100")
Message-ID: <87mti02of9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-golang: default to rawname to
 install binaries
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
 > The default currently is to rely on the package name to decide what to
 > build and install if not specified by tje caller. This works nice for
 > target packages, where a 'foo' package will by default build and
 > install a 'foo' executable.

 > However, for host packages, that will build and install a 'host-foo'
 > exzcutable, which is not really, even really not, what would be
 > expected.

 > We fix that by using the package raw name, i.e. the package name with
 > the host- prefix yanked away.

 > It is very improbable that there already have many host-golang packages
 > in the wild (in br2-external trees), but if there are, they would
 > forcibly define those variables to a sane value. This change is not
 > incompatible, as the values provided by packages take precendence; it's
 > just that those packages now carry superfluous, if innocuous, variable
 > assignments.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
