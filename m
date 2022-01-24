Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C21BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E24BA60EBF;
	Mon, 24 Jan 2022 17:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rehFmxL6Gydh; Mon, 24 Jan 2022 17:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 338C760D66;
	Mon, 24 Jan 2022 17:25:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 354BA1BF296
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3236960D66
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJc0Rc-s9U4Q for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:25:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 031C360B60
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:25:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id D0886CFACF
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:15:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A0E8220004
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:14:57 +0000 (UTC)
Message-ID: <cb342e80-deda-35f8-3c2f-2ca42e3e2bb7@korsgaard.com>
Date: Mon, 24 Jan 2022 18:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20211225050854.1138268-1-t123yh.xyz@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20211225050854.1138268-1-t123yh.xyz@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/cage: only enable XWayland if
 wlroots has X11
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 25/12/2021 06.08, Yunhao Tian wrote:
> Cage requires wlroots to be built with X11 enabled
> in order to enable XWayland, otherwise it will fail
> with error:
> 
> "ERROR: Problem encountered: Cannot build Cage with
> XWayland support: wlroots has been built without it"
> 
> Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>

Committed to 2021.02.x / 2021.11.x, thanks.

--
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
