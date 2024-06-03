Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAADC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BDED402B7;
	Mon,  3 Jun 2024 15:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARq86iZvEvMU; Mon,  3 Jun 2024 15:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1526D402D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1526D402D6;
	Mon,  3 Jun 2024 15:24:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3279D1BF228
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F4C960A4D
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uu5al4F4MUjV for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:24:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1196960596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1196960596
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1196960596
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:24:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6C421C0002;
 Mon,  3 Jun 2024 15:24:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sE9Xd-003K8v-0l;
 Mon, 03 Jun 2024 17:24:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Charles Hardin <ckhardin@gmail.com>
References: <20240326042522.34109-1-ckhardin@gmail.com>
Date: Mon, 03 Jun 2024 17:24:09 +0200
In-Reply-To: <20240326042522.34109-1-ckhardin@gmail.com> (Charles Hardin's
 message of "Mon, 25 Mar 2024 21:25:22 -0700")
Message-ID: <87plsyhwx2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-plugins-good: add qt5tools
 as a dependency
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

>>>>> "Charles" == Charles Hardin <ckhardin@gmail.com> writes:

 > During a configuration with per-package, seeing the following
 > meson build error which is resolved when the qt5tools are
 > declared explicitly as a dependency.

 >     build/gst1-plugins-good-1.22.9/ext/qt/meson.build:48:4: \
 >       ERROR: Problem encountered: qt5 qmlglsink plugin is enabled, \
 >       but qt specific tools were not found

 > Signed-off-by: Charles Hardin <ckhardin@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
