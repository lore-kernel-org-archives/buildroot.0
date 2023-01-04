Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD61DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 16:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88FB66108E;
	Wed,  4 Jan 2023 16:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88FB66108E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ba0DQNLN9PNq; Wed,  4 Jan 2023 16:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2C4761087;
	Wed,  4 Jan 2023 16:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C4761087
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6545F1BF5DF
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4109961087
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4109961087
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7UdwssUjCbpL for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 16:46:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF0A6107F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DF0A6107F
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 16:46:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 08576240008;
 Wed,  4 Jan 2023 16:46:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pD6ts-00538i-Dv; Wed, 04 Jan 2023 17:46:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
 <20230101233653.487175-7-ricardo.martincoski@gmail.com>
Date: Wed, 04 Jan 2023 17:46:00 +0100
In-Reply-To: <20230101233653.487175-7-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 1 Jan 2023 20:36:30 -0300")
Message-ID: <87h6x6z1rr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 06/29] package/i2pd: really install
 configuration files
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > While applying [1] the commit "fffbd2c9f7 i2pd: new package"
 > unintentionally removed completely the post-install hooks, so
 > I2PD_INSTALL_CONFIGURATION_FILES is declared but never called.

 > Fix the install of configuration files by adding the defined symbol to
 > the post-install hooks.

 > [1] http://patchwork.ozlabs.org/project/buildroot/patch/20180327212401.5173-1-fontaine.fabrice@gmail.com/

 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
