Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C7CC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 22:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CA1E40B75;
	Tue, 14 Mar 2023 22:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA1E40B75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDchaCYDh3ib; Tue, 14 Mar 2023 22:37:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A23C640B74;
	Tue, 14 Mar 2023 22:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A23C640B74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F8DD1BF3A4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 624CE60ACE
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624CE60ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mVxAcwyd0GPT for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 22:37:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2399560A7E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2399560A7E
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 22:37:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DA18260003;
 Tue, 14 Mar 2023 22:37:41 +0000 (UTC)
Date: Tue, 14 Mar 2023 23:37:40 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230314233740.718156ab@windsurf>
In-Reply-To: <20230314130608.2876389-1-giulio.benetti@benettiengineering.com>
References: <20230314130608.2876389-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678833462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxim60aPPNAacEYdwCopixser9zN7Jyb63BzTtcut3U=;
 b=nWOYFAjV8AhKkLvhcfwDP9gIX9Zo4DlLyZ5sQeNCjZQeb+L9ccocZdpNFbmIy+35JXQC3i
 naZxgqzy8ZcggN1Zhk7ug/g47iS6iBZJccJedW7n6gbn2jwkofNUJOs5Qkx/F+jPCfh5aS
 YqeRLOpLyhnEMjM+7rGASmH5TkuyE71ylg75aeFZEyE8fhkFacb/50GYq/dq38lupC4erj
 EYtHiP3/2UHOao33KKGQh6k3HR0TKpCPqpBsj+RrbmcEs0NP8Lrnetpmj/w1c7/bYfhlaW
 EATgVv7b0SS5huf/WKlFQAZhHfspOz4R6L7qmsANAzADGFeE9iEjdykmihLL1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nWOYFAjV
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure on PowerPC64
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

On Tue, 14 Mar 2023 14:06:08 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch pending upstream[0] to fix build failure on PowerPC64 due
> to conflicting get_ra().
> 
> Fixes:
> http://autobuild.buildroot.net/results/8c5/8c51009fa32947b2c1cda8f9862507df8da126db//
> 
> [0]:
> https://github.com/aircrack-ng/rtl8812au/pull/1054
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../0001-Fix-build-failure-on-PowerPC64.patch | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 package/rtl8812au-aircrack-ng/0001-Fix-build-failure-on-PowerPC64.patch

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
