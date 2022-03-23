Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB41EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8443860AE7;
	Wed, 23 Mar 2022 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YIxCarJubbDk; Wed, 23 Mar 2022 21:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C0D860AC3;
	Wed, 23 Mar 2022 21:04:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF59D1BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BE5240884
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5psecMA6lML for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:03:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D867841895
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:03:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B469E100002;
 Wed, 23 Mar 2022 21:03:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nX88u-009pd1-Rk; Wed, 23 Mar 2022 22:03:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kamel Bouhara via buildroot <buildroot@buildroot.org>
References: <20220310095602.2435745-1-kamel.bouhara@bootlin.com>
 <20220310095602.2435745-5-kamel.bouhara@bootlin.com>
Date: Wed, 23 Mar 2022 22:03:44 +0100
In-Reply-To: <20220310095602.2435745-5-kamel.bouhara@bootlin.com> (Kamel
 Bouhara via buildroot's message of "Thu, 10 Mar 2022 10:56:02 +0100")
Message-ID: <87v8w4e5zj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 4/4] package/odb: add dependency on
 host-libodb
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kamel" == Kamel Bouhara via buildroot <buildroot@buildroot.org> writes:

 > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > host-odb installs the ODB compiler, which when executed at runtime,
 > needs access to the libodb headers. In order to have them installed,
 > add a dependency on host-libodb.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 > [Kamel: Add optional host-libodb-boost dependency]

Committed to 2021.02.x, 2021.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
