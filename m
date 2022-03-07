Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59589C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 127F34171E;
	Mon,  7 Mar 2022 19:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ALEiC4iYjSe; Mon,  7 Mar 2022 19:33:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39C7341727;
	Mon,  7 Mar 2022 19:33:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEA9A1BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCA7A4171C
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfrBS5irLDYe for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:33:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B96A24173D
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:33:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 260E760002;
 Mon,  7 Mar 2022 19:33:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRJ6Q-000yOO-QN; Mon, 07 Mar 2022 20:33:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
References: <20220303191945.3952450-1-geomatsi@gmail.com>
Date: Mon, 07 Mar 2022 20:33:06 +0100
In-Reply-To: <20220303191945.3952450-1-geomatsi@gmail.com> (Sergey
 Matyukevich's message of "Thu, 3 Mar 2022 22:19:45 +0300")
Message-ID: <87h7897e31.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix
 libwpa_client.so build
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sergey" == Sergey Matyukevich <geomatsi@gmail.com> writes:

 > Build target libwpa_client.so is not built regardless of whether the
 > option CONFIG_BUILD_WPA_CLIENT_SO is set or not. Add patch that
 > fixes wpa_supplicant build regression.

 > Fixes:
 > http://autobuild.buildroot.net/results/001981339f3b895ecd9208a747a0e47d07c9583a/
 > http://autobuild.buildroot.net/results/318f9ecd4060d34cc8385891b56d0a0e6275f2c9/

 > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 > ---

 > Hi all,

 > Note that the patch has been posted to hostapd mailing list
 > and discussed, but not yet accepted:

 > https://patchwork.ozlabs.org/project/hostap/patch/20220222085219.3996729-1-geomatsi@gmail.com/

I see that in the mean time it has been applied, great!

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
