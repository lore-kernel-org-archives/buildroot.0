Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFA2C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E37581E22;
	Sat,  5 Nov 2022 22:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E37581E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qyDySZFw84yk; Sat,  5 Nov 2022 22:34:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7105E81CE1;
	Sat,  5 Nov 2022 22:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7105E81CE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A31D91BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85B7660AEF
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B7660AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NaOoJ9go1ZBK for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:33:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D0060A71
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46D0060A71
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:33:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 14DFB1C0004;
 Sat,  5 Nov 2022 22:33:50 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:33:49 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221105233349.4492095b@windsurf>
In-Reply-To: <20221103211513.4099651-1-james.hilliard1@gmail.com>
References: <20221103211513.4099651-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667687631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEKBRgfh29WUoke7laMhfJO5MXoeIiqzgRBhrPpKSwM=;
 b=n3Dzvycjc5sd+6ul7mAl+LwFSBUeg0oyoIF1328JaYECtwk6ZUBYH7Ooa1aCz6O1Gwck0O
 Fpawd2l7MpSexOCMffjWsn1+B7sXh64/dtSTpxLWE3p8JLG/VvPICUbBZAbVD44RtYCz3D
 ei0+5CHQDvqYxecldpKL8q/2uBXiZPQDKGLY/LxMuyH2Yd1RShM/iQ9vHBZoLqTxFqjkHn
 YYUkR4o0h8eiQwPKK858tuzv04s2ayy7+Y/NAWepAcfxx+adKZwRAYz05GrQCZuT+r9Oj1
 CZayWoNC1VumFXRzoG1hmqCChpcYcFaZ7glzlqs3hQ4f0N781gfLE88yjs5LSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n3Dzvycj
Subject: Re: [Buildroot] [PATCH 1/1] package/python-xlsxwriter: bump to
 version 3.0.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 15:15:13 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to date update:
> https://github.com/jmcnamara/XlsxWriter/commit/0fc418931f984e5d6119569d47e9985b2bae5d57
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-xlsxwriter/python-xlsxwriter.hash | 6 +++---
>  package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
