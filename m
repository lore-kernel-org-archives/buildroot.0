Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C808C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2DEA41673;
	Mon, 15 Aug 2022 09:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2DEA41673
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prAqCSyGpJQv; Mon, 15 Aug 2022 09:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D651409FD;
	Mon, 15 Aug 2022 09:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D651409FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49FA11BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 253E1824B4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 253E1824B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpstFDPbbX70 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:49:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3C77818A2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3C77818A2
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:49:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B539920002;
 Mon, 15 Aug 2022 09:49:46 +0000 (UTC)
Date: Mon, 15 Aug 2022 11:49:45 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20220815114945.2c32654b@windsurf>
In-Reply-To: <20220815090736.79798-1-troglobit@gmail.com>
References: <20220815090736.79798-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660556987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IoiKlpu4tKG0A1C7XDQsP/9i0+dmTp5eQq2yqik4DSE=;
 b=SeiT4O0EARYLYS3XU98naVRMyuM/+oneieiPa2bKwofc+0oa9IKacSwdJgD7UTGDXcUCdu
 XOZ6tPR5NQ0wBTmcpTGqgPwq++NBtSXFR03gBpGj1LHnW1qkGfoWM06zT76GkFTU8moSNx
 +Ejl6qKprYzdK4U+li/ayjgTRMPp9JG7AAvBcEW3P/NAzOdjtonqas4mdUcYYV0ai4QmM8
 MIDAXJMIlQiDHY4MJNXhUUK0o10qoDsQ/yQLAvuWBpOtn/QzVIXNw9lKx1fMxYLIA4UAFf
 IyZtvslIp//57MRaZ4ryplVSiNHeS491Tes1Lfvndi8IIWGahChGkF5xohYNjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SeiT4O0E
Subject: Re: [Buildroot] [PATCH next] package/sysklogd: bump to version 2.4.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Aug 2022 11:07:36 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Only one change compared to v2.4.3, fix for running `syslogd -T`, which
> should use local time for all remote messages, but time is always logged
> with "Jan 0 00:00:00".
> 
> https://github.com/troglobit/sysklogd/releases/tag/v2.4.4
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/sysklogd/sysklogd.hash | 2 +-
>  package/sysklogd/sysklogd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Since this is a pure bugfix release, I've applied the version bump to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
