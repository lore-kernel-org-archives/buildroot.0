Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D345EC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C0BC81455;
	Mon,  1 Aug 2022 20:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C0BC81455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgjfN6ko2bqB; Mon,  1 Aug 2022 20:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 959B381409;
	Mon,  1 Aug 2022 20:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 959B381409
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 104411BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF1D840129
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF1D840129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fuuYaRs8omM5 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:37:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF0B40117
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABF0B40117
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:37:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E23201BF206;
 Mon,  1 Aug 2022 20:37:45 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:37:44 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20220801223744.3b670edd@windsurf>
In-Reply-To: <20220801114320.3729655-1-troglobit@gmail.com>
References: <20220801114320.3729655-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659386266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wd2zEB+ZXKl0NrLZh0ST1HEsgslKoV/y3W+cNxjFlfI=;
 b=fD5JuPyCxieUtoDZsPqwQWDCf7/zyM8B11GqAvKAeDYlr89BUfdaGFYR14wvfSNrelr6B0
 B8T4Bx31vijwt6g0rk7Lfm9BBcnqTGs32LIR+GX8qpljbOT8MCRWWhwT/+4VNUIsIDrPH8
 /yGQ4pSFYn3KxEHoG5/wh0e7V0yshh9PXGSSFOCqTBbhTiBbHyh5iOWBOFq1YIRKKewLB8
 U2gKgj+hnpl/4iJEwdrdKBmKzkWYKPPoGYJwmHB+Nh+r/QtzHwfshgdCKtVxRq0wrZnyuw
 sMBMRiQW1QDb9gzFTAELs447PgzHnMQQV3LqPspAjmNdEWITKZr63AzUtagFug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fD5JuPyC
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.4.2
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

On Mon,  1 Aug 2022 13:43:20 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Mostly a bugfix release (critical fixes to syslogd below), which also
> includes some features added to the logger tool and libsyslog related
> to logging to remote syslog servers, bypassing the local syslogd.
> 
> Critical fixes:
>   - Prevent over-read when scanning kermel log messages
>   - Prevent kernel log file corruption when messages contain control
>     codes, notably '\n', now C-style hex encoding is preserved (\x0a)
>   - Forwarding of log messages to remote servers stops after a few
>     SIGHUPs have been received (bug introduced in v2.4.0)
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/sysklogd/sysklogd.hash | 2 +-
>  package/sysklogd/sysklogd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
