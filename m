Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9B3C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C385160C0A;
	Sun, 12 Mar 2023 09:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C385160C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L01aLjWKBXcn; Sun, 12 Mar 2023 09:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 184EA60F81;
	Sun, 12 Mar 2023 09:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 184EA60F81
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 930DD1BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 794C740A02
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 794C740A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJxUfxfgEhDC for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:07:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34DD3409FD
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34DD3409FD
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:07:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7DBEE240005;
 Sun, 12 Mar 2023 09:07:54 +0000 (UTC)
Date: Sun, 12 Mar 2023 10:07:53 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20230312100753.0b383fbf@windsurf>
In-Reply-To: <1ad45c1bf4b73061d4b05a43afc1bbaf423111e4.1678179925.git.baruch@tkos.co.il>
References: <1ad45c1bf4b73061d4b05a43afc1bbaf423111e4.1678179925.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678612075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvQs8th+ptayzfPPaLGk/HVDgeTs9lANm/zV5vnKQNA=;
 b=D48kWZPUQiNs/f2RxhrdRto6UAL8t1x9X8F9avtudycE5m8CS4v8U4TeqFdLpd7imnKkrg
 KB1qy9g3+Zt91j68sGXNyWWlSTN1QhyRMM7VsqG7wKdMiXzOPDex1HOngPIBNsN2JAJkfC
 Ooz78X/MxmyXDh1jaNfVPBDP4wpJA60sG81cYuzO2nPlwk8nsXfCmIXRN78ohshX0R9M6o
 LESiLUbT5cGuVcqog6A1QPpCO6zQelLBwkT/YhoHaud56HVxF3h6ra6MOiIUAHfi5QRwo3
 4AO/CLN63f0CoyjlMUNQR9pDdNvDD5OGuSZ1X6NV1MB1wXPMa273tr6kPylI+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D48kWZPU
Subject: Re: [Buildroot] [PATCH next] strace: bump to version 6.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Mar 2023 11:05:25 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/strace/strace.hash | 4 ++--
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
