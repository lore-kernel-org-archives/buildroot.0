Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE5FCA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 20:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FB9860E08;
	Fri, 22 Aug 2025 20:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aENv94cCRP0F; Fri, 22 Aug 2025 20:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D43F560DEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D43F560DEE;
	Fri, 22 Aug 2025 20:22:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F0741C7
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 055CA60E03
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0wMh7mAZcGs for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 20:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4236760DCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4236760DCD
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4236760DCD
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:22:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 145104E40BD2
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:22:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BE8F7604AD;
 Fri, 22 Aug 2025 20:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8EB81C22C887; 
 Fri, 22 Aug 2025 22:22:16 +0200 (CEST)
Date: Fri, 22 Aug 2025 22:22:15 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <20250822222215.124802c0@windsurf>
In-Reply-To: <20250821091601.3774405-1-peter@korsgaard.com>
References: <20250821091601.3774405-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755894140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=x9lyETc1VqlR5UrN8ij4W0of/a2S7F0waquXxZeNr/8=;
 b=M/2FzOXJQmoiqkiiqqfiMmNwpUtKTutMp2NlBe0Tqjl/Omj5Em6omFt/BnShjnEukog8yJ
 CLsdzqIIaG/nbROg0Gfwo+x8pFIsgdZDemYSNEAhqlfuW89BtrZ+cR6DLV/einWaFOHiPm
 BsRGOZijd8NitJIWG3nWxNq/yT+2mXA5xPyxoOziNfW1tHUHcZ3S/bk4VACItSRnw0vDGE
 tR3HaWn3gDpl7OLdBHl2sUAqoFAEtlzjWELD6MqN99N6G7HDau7gGO1GtOIOzM2GyMpSdn
 JmUAuXCvCaRSoF7e7vUUhPzprVIUxlcD3jH9eLBhZ5OiWpyGy0bvdpnvRvVMrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=M/2FzOXJ
Subject: Re: [Buildroot] [PATCH 1/2] package/proftpd: bump to version 1.3.8d
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Aug 2025 11:16:00 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Bugfix release, fixing the following issues:
> 
> 1.3.8d - Released 14-Mar-2025
> --------------------------------
> - Issue 1855 - Use of HideNoAccess for SFTP sessions can lead to segfault
>   and/or unexpected behavior.
> - Issue 1876 - SFTP channel allocations can lead to high memory utilization
>   over time.

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
